from forklift.evaluator import Evaluator, Config
import os
from forklift.asm import AsmAdder, FuncDataclass
from forklift.utils import normalize_structs, InferenceDataset

# This function will be compiled and we will try to recover it. Note that despite its apparent user-level simplicity,after vectorization its assembly becomes quite convoluted.
# Your new C code that checks for proximity in an array.
SAMPLE = dict(func_def='''
int func0(float numbers[], int size, float threshold) {
    int i, j;
    for (i = 0; i < size; i++) {
        for (j = i + 1; j < size; j++) {
            if (fabs(numbers[i] - numbers[j]) < threshold) {
                return 1;
            }
        }
    }
    return 10;
}
''',
              deps='''
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
''',
              fname='func0',
              )

DIRECTION = 'clang_opt3_ir_optz-ir_optz'

MODELS = {'clang_opt3_ir_optz-ir_optz': 'jordiae/clang_opt3_ir_optz-ir_optz-2024-01-15-0959-e1bf-bc2b'
          }


def run(sample, batch_size=1):
    config = Config(hf_model_path=MODELS[DIRECTION],
                                pairs=[DIRECTION],
                                )

    evaluator = Evaluator(config)
    predictions = []
    fnames = []
    batch = []
    rows = []
    pair = DIRECTION
    samples = [sample]
    for row in InferenceDataset(samples, compilers_keys=['clang_ir_Oz', 'clang_x86_O3']):
        batch.append((row, pair))
        fnames.append('func0')
        rows.append(row)
        if len(batch) == batch_size:
            predictions.extend(evaluator.predict_batch(batch))
            batch = []
    if len(batch) > 0:
        predictions.extend(evaluator.predict_batch(batch))

    # return fnames, predictions, rows
    return predictions[0]


if __name__ == '__main__':
    predicted = run(SAMPLE)
    for idx, lifted in enumerate(predicted):
        print(lifted)
        print('_____')

# Prints
# %struct.struct0 = type { i32 }
# define dso_local void @f(%struct.struct0* nocapture %0, i32 %1, i32 %2) local_unnamed_addr {
# %4 = sext i32 %2 to i64
# br label %5
# 5: ; preds = %8, %3
# %6 = phi i64 [ %12, %8 ], [ 0, %3 ]
# %7 = icmp slt i64 %6, %4
# br i1 %7, label %8, label %13
# 8: ; preds = %5
# %9 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %6, i32 0
# %10 = load i32, i32* %9, align 4
# %11 = add nsw i32 %10, %1
# store i32 %11, i32* %9, align 4
# %12 = add nuw nsw i64 %6, 1
# br label %5
# 13: ; preds = %5
# ret void
# }

# One can compare the output with the ground truth:
# clang -c -Oz -emit-llvm -S f_ground_truth.c
# It's not identical token-by-token (notable, the original one didn't use structs), but it produces the same output
# clang -c -Oz -emit-llvm -S f.c; clang test.c f.ll -o program_predicted.x
# clang test.c f_ground_truth.c -o program_ground_truth.x
# clang test.c f.ll -o program_gt.x
