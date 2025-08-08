import os
import re
import subprocess

def find_test_files():
    """Find all test files in the current directory named problem#_test where # is a number."""
    return [f for f in os.listdir('.') if re.fullmatch(r'problem\d+_test', f)]


def main():
    success = 0
    total = 0
    successlist = []
    
    test_files = find_test_files()
    if not test_files:
        print("No test files found in the current directory.")
        return 
    
    print("Found test files:")
    for test_file in test_files:
        total += 1
        print(f" - {test_file}")
        try:
            test_result = subprocess.run(
                ["qemu-aarch64", test_file],
                capture_output=True,
                text=True,
                timeout=5
            )
            if test_result.returncode == 0:
                print("  Test passed")
                success += 1
                successlist.append(test_file)
            else:
                print(f"  Test failed: {test_result.stderr.strip()}")
        except subprocess.TimeoutExpired:
            print("  Test timed out")
        except Exception as e:
            print(f"  Unexpected error: {e}")

    print(f"\nTotal tests: {total}, Passed: {success}, Failed: {total - success}")
    if successlist:
        print("\nSuccessful tests:")
        for s in successlist:
            print(f" - {s}")
    

if __name__ == '__main__':
    main()
    
