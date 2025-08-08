%struct.struct0 = type { float }
define dso_local float @func0(%struct.struct0* nocapture readonly %0, i32 %1) local_unnamed_addr {
%3 = sext i32 %1 to i64
br label %4
4: ; preds = %8, %2
%5 = phi i64 [ %12, %8 ], [ 0, %2 ]
%6 = phi float [ %11, %8 ], [ 0.000000e+00, %2 ]
%7 = icmp slt i64 %5, %3
br i1 %7, label %8, label %13
8: ; preds = %4
%9 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %5, i32 0
%10 = load float, float* %9, align 4
%11 = fadd float %6, %10
%12 = add nuw nsw i64 %5, 1
br label %4
13: ; preds = %4
%14 = sitofp i32 %1 to float
%15 = fdiv float %6, %14
br label %16
16: ; preds = %20, %13
%17 = phi i64 [ %25, %20 ], [ 0, %13 ]
%18 = phi float [ %24, %20 ], [ 0.000000e+00, %13 ]
%19 = icmp slt i64 %17, %3
br i1 %19, label %20, label %26
20: ; preds = %16
%21 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %17, i32 0
%22 = load float, float* %21, align 4
%23 = fsub float %22, %15
%24 = tail call float @llvm.fabs.f32(float %23)
%25 = fadd float %18, %24
%26 = add nuw nsw i64 %17, 1
br label %16
27: ; preds = %16
%28 = fdiv float %18, %14
ret float %28
}
declare float @llvm.fabs.f32(float)
