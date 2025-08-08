from forklift.evaluator import Evaluator, Config
import os
import glob
import argparse
import subprocess
import shutil
from pathlib import Path
from forklift.asm import AsmAdder, FuncDataclass
from forklift.utils import normalize_structs, InferenceDataset

DIRECTION = 'clang_opt3_ir_optz-ir_optz'

MODELS = {'clang_opt3_ir_optz-ir_optz': 'jordiae/clang_opt3_ir_optz-ir_optz-2024-01-15-0959-e1bf-bc2b'
          }

def read_code_file(problem_path):
    """Read the code.c file and extract the function definition"""
    code_file = os.path.join(problem_path, 'code.c')
    if not os.path.exists(code_file):
        raise FileNotFoundError(f"code.c not found in {problem_path}")
    
    with open(code_file, 'r') as f:
        content = f.read()
    
    # Extract function definition (assuming it's the main content)
    return content.strip()

def create_sample(problem_path):
    """Create a SAMPLE dict from a problem directory"""
    func_def = read_code_file(problem_path)
    
    return dict(
        func_def=func_def,
        deps='''
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <stdbool.h>
#include <limits.h>
#include <string.h>
#include <float.h>
#include <ctype.h>
''',
        fname='func0',
    )

def run_prediction(sample, batch_size=1):
    """Run the model prediction on a sample"""
    config = Config(hf_model_path=MODELS[DIRECTION],
                    pairs=[DIRECTION],
                    )

    evaluator = Evaluator(config)
    predictions = []
    batch = []
    pair = DIRECTION
    samples = [sample]
    
    for row in InferenceDataset(samples, compilers_keys=['clang_ir_Oz', 'clang_x86_O3']):
        batch.append((row, pair))
        if len(batch) == batch_size:
            predictions.extend(evaluator.predict_batch(batch))
            batch = []
    
    if len(batch) > 0:
        predictions.extend(evaluator.predict_batch(batch))

    return predictions[0] if predictions else None

def compile_and_test(ll_file, test_c_file, output_exe, opt_level="-O0", debug=False):
    """Compile the LLVM IR with test.c and run the test"""
    compile_cmd = [
        "clang", 
        "--target=aarch64-linux-gnu", 
        f"--sysroot={os.path.expanduser('~')}/aarch64-sysroot",
        "-B/usr/lib/gcc-cross/aarch64-linux-gnu/11",
        "-L/usr/lib/gcc-cross/aarch64-linux-gnu/11",
        f"-L{os.path.expanduser('~')}/aarch64-sysroot/usr/aarch64-linux-gnu/lib",
        "-static",
        opt_level,
        "-o", output_exe,
        ll_file, test_c_file,
        "-lm"
    ]
    
    if debug:
        print(f"Compile command: {' '.join(compile_cmd)}")
    
    try:
        # Compile
        result = subprocess.run(compile_cmd, capture_output=True, text=True, timeout=30)
        if result.returncode != 0:
            return False, f"Compilation failed: {result.stderr}"
        
        # Run the test
        if debug:
            print(f"Running test: {output_exe}")
        
        test_result = subprocess.run(["qemu-aarch64", output_exe], capture_output=True, text=True, timeout=30)
        
        if test_result.returncode == 0:
            return True, "Test passed"
        else:
            return False, f"Test failed: {test_result.stderr}"
            
    except Exception as e:
        return False, f"Error during compilation/testing: {str(e)}"

def get_problem_directories(base_path="~/asm-to-asm/humaneval"):
    """Get all problem directories"""
    base_path = os.path.expanduser(base_path)
    problem_dirs = []
    
    for i in range(1, 165):  # problems 1-164
        problem_path = os.path.join(base_path, f"problem{i}")
        if os.path.exists(problem_path):
            problem_dirs.append((i, problem_path))
    
    return problem_dirs

def main():
    parser = argparse.ArgumentParser(description='Run LLVM IR generation and testing on HumanEval problems')
    parser.add_argument('--problem', type=int, help='Specific problem number to run (1-164)')
    parser.add_argument('--debug', action='store_true', help='Enable debug mode with verbose output')
    parser.add_argument('--opt-level', default='-O3', help='Optimization level for compilation (default: -O3)')
    parser.add_argument('--results-dir', default='results', help='Directory to store results (default: results)')
    
    args = parser.parse_args()
    
    # Create results directory
    results_dir = Path(args.results_dir)
    results_dir.mkdir(exist_ok=True)
    
    # Get problem directories
    if args.problem:
        problem_path = os.path.expanduser(f"~/asm-to-asm/humaneval/problem{args.problem}")
        if not os.path.exists(problem_path):
            print(f"Error: Problem {args.problem} directory not found at {problem_path}")
            return
        problem_dirs = [(args.problem, problem_path)]
        print(f"Running on problem {args.problem}")
    else:
        problem_dirs = get_problem_directories()
        print(f"Running on all problems (found {len(problem_dirs)} problems)")
    
    results = {}
    passed_count = 0
    total_count = len(problem_dirs)
    
    for problem_num, problem_path in problem_dirs:
        print(f"\n--- Processing Problem {problem_num} ({passed_count + len([r for r in results.values() if not r['passed']])}/{total_count}) ---")
        
        try:
            # Create sample from problem
            if args.debug:
                print(f"Reading problem from: {problem_path}")
            
            sample = create_sample(problem_path)
            
            if args.debug:
                print(f"\nC code being processed:")
                print("=" * 50)
                print(sample['func_def'])
                print("=" * 50)
            
            # Run prediction
            print(f"Running model prediction for problem {problem_num}...")
            predicted = run_prediction(sample)
            
            if not predicted:
                print(f"Error: No prediction generated for problem {problem_num}")
                results[problem_num] = {'passed': False, 'error': 'No prediction generated'}
                continue
            
            if args.debug:
                print(f"\nGenerated LLVM IR:")
                print("=" * 50)
                print(predicted[0])
                print("=" * 50)
            
            # Save the generated LLVM IR
            ll_filename = f"problem{problem_num}_generated.ll"
            ll_file = results_dir / ll_filename
            
            with open(ll_file, 'w') as f:
                f.write(predicted[0])  # Assuming first prediction is what we want
            
            if args.debug:
                print(f"Generated LLVM IR saved to: {ll_file}")
            
            # Test compilation and execution
            test_c_file = os.path.join(problem_path, 'test.c')
            if not os.path.exists(test_c_file):
                print(f"Warning: test.c not found for problem {problem_num}")
                results[problem_num] = {'passed': False, 'error': 'test.c not found'}
                continue
            
            output_exe = results_dir / f"problem{problem_num}_test"
            
            print(f"Compiling and testing problem {problem_num}...")
            test_passed, test_message = compile_and_test(
                str(ll_file), test_c_file, str(output_exe), 
                args.opt_level, args.debug
            )
            
            results[problem_num] = {
                'passed': test_passed,
                'message': test_message,
                'll_file': str(ll_file),
                'exe_file': str(output_exe) if test_passed else None
            }
            
            if test_passed:
                passed_count += 1
                print(f"✓ Problem {problem_num}: PASSED")
            else:
                print(f"✗ Problem {problem_num}: FAILED - {test_message}")
                
        except Exception as e:
            print(f"✗ Problem {problem_num}: ERROR - {str(e)}")
            results[problem_num] = {'passed': False, 'error': str(e)}
    
    # Print final summary
    print(f"\n{'='*60}")
    print(f"FINAL SUMMARY")
    print(f"{'='*60}")
    print(f"Total problems processed: {total_count}")
    print(f"Tests passed: {passed_count}")
    print(f"Tests failed: {total_count - passed_count}")
    print(f"Success rate: {passed_count/total_count*100:.1f}%")
    
    print(f"\nPassed problems:")
    for problem_num, result in results.items():
        if result['passed']:
            print(f"  Problem {problem_num}")
    
    print(f"\nFailed problems:")
    for problem_num, result in results.items():
        if not result['passed']:
            error_msg = result.get('error', result.get('message', 'Unknown error'))
            print(f"  Problem {problem_num}: {error_msg}")
    
    # Save detailed results to file
    results_file = results_dir / 'test_results.txt'
    with open(results_file, 'w') as f:
        f.write(f"Test Results Summary\n")
        f.write(f"{'='*50}\n")
        f.write(f"Total: {total_count}, Passed: {passed_count}, Failed: {total_count - passed_count}\n")
        f.write(f"Success rate: {passed_count/total_count*100:.1f}%\n\n")
        
        for problem_num, result in results.items():
            status = "PASSED" if result['passed'] else "FAILED"
            f.write(f"Problem {problem_num}: {status}\n")
            if not result['passed']:
                error_msg = result.get('error', result.get('message', 'Unknown error'))
                f.write(f"  Error: {error_msg}\n")
            f.write(f"\n")
    
    print(f"\nDetailed results saved to: {results_file}")

if __name__ == '__main__':
    main()