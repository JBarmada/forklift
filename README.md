# Forklift: An Extensible Neural Lifter

Repository for *Forklift: An Extensible Neural Lifter*, accepted for publication at COLM 2024.

## Data

### ExeBench

Available on the HF hub: https://huggingface.co/datasets/jordiae/exebench/tree/clang
Note that it's the branch/revision `clang`, not `main`. The dataloader supports streaming:

```
# pip install datasets==2.15 zstandard
# A known issue is that the data loader requires datasets 2.15.
splits = ['train_synth_compilable', 'valid_synth', 'test_synth']
stream = True 
datasets = {k: load_dataset('jordiae/exebench', split=k, revision='clang', subsets=[k], streaming=stream) for k in splits}
```

The assembly and LLVM IR are stored in the `'key'` field. For example, for obtaining:

```
def retrieve_asm(row, asm_target):
    asm = row['asm']
    asm_idx = asm['target'].index(asm_target)
    return asm['code'][asm_idx]

retrieve_asm(row, asm_target=asm_target)
```
Following the original work in ExeBench (https://dl.acm.org/doi/abs/10.1145/3520312.3534867), assembly targets with prefixes `angha` correspond to the assembly obtained following the AnghaBench methodology (https://ieeexplore.ieee.org/document/9370322), that is, with synthetic dependencies, and the ones prefixed with `real` correspond to assembly compiled with the dependencies obtained from the headers. For example, for obtaining assembly generated with GCC, for x86, for the O0 optimization level, with synthetic dependencies, one can run:

```
retrieve_asm(row, asm_target='angha_gcc_x86_O0')
```

As another example, for LLVM IR Oz:

```
retrieve_asm(row, asm_target='angha_clang_ir_Oz')
```

### Synth:

The C functions to be compiled for the Synth benchmark can be found on Github: https://github.com/mob-group/synthesis-eval/tree/master/examples


## Paper

https://openreview.net/forum?id=LWfDcI6txJ#discussion

```
@inproceedings{
armengol-estape2024forklift,
title={Forklift: An Extensible Neural Lifter},
author={Jordi Armengol-Estap{\'e} and Rodrigo C. O. Rocha and Jackson Woodruff and Pasquale Minervini and Michael O'Boyle},
booktitle={First Conference on Language Modeling},
year={2024},
url={https://openreview.net/forum?id=LWfDcI6txJ}
}
```
