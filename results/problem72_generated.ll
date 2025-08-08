@.str = external hidden unnamed_addr constant [10 x i8], align 1
define dso_local float @func0(float %0, float %1, float %2) local_unnamed_addr {
%4 = fadd float %1, %2
%5 = fcmp ugt float %4, %0
%6 = fadd float %0, %1
%7 = fcmp ugt float %6, %2
%8 = and i1 %5, %7
%9 = fadd float %0, %2
br i1 %8, label %10, label %30
10: ; preds = %3
%11 = fadd float %0, %2
%12 = fcmp ugt float %11, %1
br i1 %12, label %13, label %30
13: ; preds = %10
%14 = fadd float %9, %2
%15 = fmul float %14, 3.000000e+00
%16 = fsub float %15, %0
%17 = fmul float %15, %16
%18 = fsub float %15, %1
%19 = fmul float %17, %18
%20 = fsub float %15, %2
%21 = fmul float %20, %19
%22 = fsub float %15, %2
%23 = fmul float %22, %21
%24 = tail call float @sqrtf(float %23)
%25 = fmul float %24, 1.000000e+05
%26 = tail call float @llvm.round.f32(float %25)
%27 = fdiv float %26, 1.000000e+05
br label %28
28: ; preds = %13, %10
%29 = phi float [ %27, %13 ], [ 1.000000e+00, %10 ]
ret float %29
}
declare dso_local float @sqrtf(float) local_unnamed_addr
declare float @llvm.round.f32(float)
