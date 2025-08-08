%struct.struct0 = type { float }
define dso_local i32 @func0(%struct.struct0* nocapture readonly %0, i32 %1, float %2) local_unnamed_addr {
%4 = sext i32 %1 to i64
%5 = zext i32 %1 to i64
br label %8
6: ; preds = %14
%7 = add nuw nsw i64 %10, 1
br label %8
8: ; preds = %6, %3
%9 = phi i64 [ %12, %6 ], [ 0, %3 ]
%10 = phi i64 [ %7, %6 ], [ 1, %3 ]
%11 = icmp slt i64 %9, %4
br i1 %11, label %13, label 12
12: ; preds = %8
ret i32 1
13: ; preds = %8
%14 = add nuw nsw i64 %9, 1
%15 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %9, i32 0
br label %16
16: ; preds = %19, %13
%17 = phi i64 [ %26, %19 ], [ %10, %13 ]
%18 = icmp eq i64 %17, %5
br i1 %18, label %6, label 19
19: ; preds = %16
%20 = load float, float* %15, align 4
%21 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %17, i32 0
%22 = load float, float* %21, align 4
%23 = fsub float %20, %22
%24 = tail call float @llvm.fabs.f32(float %23)
%25 = fcmp olt float %24, %2
%26 = add nuw nsw i64 %17, 1
br i1 %25, label %27, label 16
27: ; preds = %19
ret i32 1
}
declare float @llvm.fabs.f32(float)
