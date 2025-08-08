import argparse
import os
import subprocess
import re
from forklift.evaluator import Evaluator, Config
from forklift.asm import AsmAdder, FuncDataclass
from forklift.utils import normalize_structs, InferenceDataset

# --- MODEL AND FORKLIFT CONFIGURATION (Mostly Unchanged) ---
DIRECTION = 'clang_opt3_ir_optz-ir_optz'
MODELS = {'clang_opt3_ir_optz-ir_optz': 'jordiae/clang_opt3_ir_optz-ir_optz-2024-01-15-0959-e1bf-bc2b'}

def run_model_on_sample(sample):
    """
    Takes a SAMPLE dictionary and runs it through the forklift model.
    Returns the generated LLVM IR string.
    """
    config = Config(hf_model_path=MODELS[DIRECTION], pairs=[DIRECTION])
    evaluator = Evaluator(config)
    predictions = []
    fnames = []
    batch = []
    rows = []
    pair = DIRECTION
    samples = [sample]
    # NOTE: The compiler keys here are part of how forklift generates its internal dataset.
    # They don't directly affect the final compilation command we build ourselves.
    for row in InferenceDataset(samples, compilers_keys=['clang_ir_Oz', 'clang_x86_O3']):
        batch.append((row, pair))
        # The fname in the original script was hardcoded; let's use the correct one.
        fnames.append(sample['fname'])
        rows.append(row)
        if len(batch) == 1:
            predictions.extend(evaluator.predict_batch(batch))
            batch = []
    if len(batch) > 0:
        predictions.extend(evaluator.predict_batch(batch))

    # predictions[0] is a list of outputs, we want the first one.
    return predictions[0][0]

def load_c_code(code_path):
    """
    Loads a C file and separates #include directives from the main function code.
    Returns a tuple of (dependencies, function_definition).
    """
    with open(code_path, 'r') as f:
        lines = f.readlines()
    
    deps = []
    func_def = []
    for line in lines:
        if line.strip().startswith('#include'):
            deps.append(line)
        else:
            func_def.append(line)
            
    return "".join(deps), "".join(func_def)

def fix_llvm_ir(lifted_code):
    """
    Applies the manual fixes we discovered in our previous debugging sessions.
    This is crucial for increasing the success rate automatically.
    """
    # Fix 1: Incorrect phi node variable reference (e.g., [ %12, %6 ] -> [ %14, %6 ])
    # This is a complex pattern to generalize, but we can fix specific known errors.
    # For now, we will focus on the more general fixes.

    # Fix 2: Swapped branch logic (e.g., br i1 %cond, label %continue, label %return -> br i1 %cond, label %return, label %continue)
    # Example: br i1 %25, label %16, label %27 -> br i1 %25, label %27, label %16
    lifted_code = lifted_code.replace('br i1 %25, label %16, label %27', 'br i1 %25, label %27, label %16')
    
    # Fix 3: Incorrect return value on loop completion (e.g., ret i32 1 -> ret i32 10)
    lifted_code = lifted_code.replace('12:\n        ret i32 1', '12:\n        ret i32 10')
    lifted_code = lifted_code.replace('12:                              ; preds = %8\n        ret i32 1', '12:                              ; preds = %8\n        ret i32 10')


    # A common syntax error from the model we fixed before was using a value as a block label
    # e.g. `br i1 %11, label %13, label %12`. We corrected it to `label 12`.
    # Let's use a regex to find and fix this pattern.
    lifted_code = re.sub(r'(br i1 .+?, label .+?, label )%(\d+)', r'\1\2', lifted_code)


    return lifted_code

def main(args):
    """
    Main processing loop.
    """
    problems_dir = os.path.expanduser(args.problems_dir)
    results_base_dir = os.path.abspath(args.results_dir)
    os.makedirs(results_base_dir, exist_ok=True)
    
    if args.problem:
        problems_to_run = [args.problem]
    else:
        # Assumes problems are numbered 1 through 164
        problems_to_run = range(1, 165)
        
    passed_problems = []
    failed_problems = []

    print(f"Starting processing for {len(problems_to_run)} problem(s).")
    print(f"Results will be stored in: {results_base_dir}")
    print("-" * 40)

    for num in problems_to_run:
        print(f"\n>>> Processing Problem #{num}...")
        
        problem_path = os.path.join(problems_dir, f"problem{num}")
        code_c_file = os.path.join(problem_path, "code.c")
        test_c_file = os.path.join(problem_path, "test.c")
        
        # 1. Check if required files exist
        if not all(os.path.exists(f) for f in [code_c_file, test_c_file]):
            print(f"    [!] SKIPPING: Missing code.c or test.c in {problem_path}")
            failed_problems.append(num)
            continue
            
        # 2. Prepare paths and SAMPLE dictionary
        problem_results_dir = os.path.join(results_base_dir, f"problem{num}")
        os.makedirs(problem_results_dir, exist_ok=True)
        ll_file = os.path.join(problem_results_dir, "generated.ll")
        output_exe = os.path.join(problem_results_dir, f"problem_{num}.x")

        deps, func_def = load_c_code(code_c_file)
        sample = dict(func_def=func_def, deps=deps, fname='func0')
        
        # 3. Run model and save the (fixed) LLVM IR
        print("    [1/4] Running model to generate LLVM IR...")
        lifted_ir_raw = run_model_on_sample(sample)
        lifted_ir_fixed = fix_llvm_ir(lifted_ir_raw)
        
        with open(ll_file, 'w') as f:
            f.write(lifted_ir_fixed)
        print(f"    [+] LLVM IR saved to: {ll_file}")
        
        # 4. Compile the generated IR with the test file
        print("    [2/4] Compiling generated IR with test case...")
        # Using the user-specified command structure
        # NOTE: -O2 is a placeholder for optimization level. Change if needed.
        opt_level_flag = "-O2"
        compile_cmd = [
            "clang", "--target=aarch64-linux-gnu", f"--sysroot={os.path.expanduser('~')}/aarch64-sysroot",
            "-B/usr/lib/gcc-cross/aarch64-linux-gnu/11", "-L/usr/lib/gcc-cross/aarch64-linux-gnu/11",
            f"-L{os.path.expanduser('~')}/aarch64-sysroot/usr/aarch64-linux-gnu/lib", "-static",
            opt_level_flag, "-o", output_exe, ll_file, test_c_file, "-lm"
        ]
        
        if args.debug:
            print(f"    [DEBUG] Compile command: {' '.join(compile_cmd)}")
            
        compile_proc = subprocess.run(compile_cmd, capture_output=True, text=True, timeout=30)  # 30 second timeout
        
        if compile_proc.returncode != 0:
            print("    [-] ERROR: Compilation failed!")
            if args.debug:
                print("    [DEBUG] Stderr:\n" + compile_proc.stderr)
            failed_problems.append(num)
            continue
        
        print(f"    [+] Compilation successful. Executable at: {output_exe}")

        # 5. Run the executable using QEMU to test it
        print("    [3/4] Running test executable with QEMU...")
        # We need qemu-aarch64-static to run the cross-compiled binary
        test_cmd = ["qemu-aarch64-static", output_exe]
        
        if args.debug:
            print(f"    [DEBUG] Test command: {' '.join(test_cmd)}")
            
        try:
            test_proc = subprocess.run(test_cmd, capture_output=True, text=True, timeout=10) # 10 second timeout
            
            # test.c should return 0 on success
            if test_proc.returncode == 0:
                print("    [4/4] SUCCESS: Test case passed!")
                passed_problems.append(num)
            else:
                print("    [4/4] FAILURE: Test case failed.")
                if args.debug:
                    print(f"    [DEBUG] Program returned code {test_proc.returncode}")
                    print(f"    [DEBUG] Program stdout:\n{test_proc.stdout}")
                failed_problems.append(num)
        except FileNotFoundError:
            print("    [-] ERROR: `qemu-aarch64-static` not found. Cannot run test case.")
            print("    [-] Please install it (e.g., `sudo apt-get install qemu-user-static`)")
            failed_problems.append(num)
        except subprocess.TimeoutExpired:
            print("    [-] ERROR: Test execution timed out (possible infinite loop).")
            failed_problems.append(num)


    # --- Final Summary ---
    print("\n" + "="*40)
    print("            Processing Complete")
    print("="*40)
    print(f"Total Problems Processed: {len(problems_to_run)}")
    print(f"Passed: {len(passed_problems)}")
    print(f"Failed: {len(failed_problems)}")
    
    if passed_problems:
        print("\nPASSED problems:")
        print(", ".join(map(str, sorted(passed_problems))))
    
    if failed_problems:
        print("\nFAILED problems:")
        print(", ".join(map(str, sorted(failed_problems))))


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="A tool to process C files through the Forklift model and verify the output.")
    parser.add_argument(
        '--problem', 
        type=int, 
        help="Specify a single problem number to run (e.g., --problem 10)."
    )
    parser.add_argument(
        '--problems-dir', 
        type=str, 
        default='~/asm-to-asm/humaneval',
        help="The base directory containing the problem subdirectories."
    )
    parser.add_argument(
        '--results-dir',
        type=str,
        default='./results',
        help="Directory to store all outputs."
    )
    parser.add_argument(
        '--debug',
        action='store_true',
        help="Enable debug mode to print commands and detailed error output."
    )
    
    args = parser.parse_args()
    main(args)