%struct.struct0 = type { float }
define dso_local void @func0(%struct.struct0* nocapture %0, i32 %1) local_unnamed_addr {
%3 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 0, i32 0
%4 = load float, float* %3, align 4
%5 = sext i32 %1 to i64
br label %6
6: ; preds = %11, %2
%7 = phi i64 [ %18, %11 ], [ 1, %2 ]
%8 = phi float [ %15, %11 ], [ %4, %2 ]
%9 = phi float [ %17, %11 ], [ %4, %2 ]
%10 = icmp slt i64 %7, %5
br i1 %10, label %11, label %19
11: ; preds = %6
%12 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %7, i32 0
%13 = load float, float* %12, align 4
%14 = fcmp olt float %9, %13
%15 = select i1 %14, float %13, float %9
%16 = fcmp ogt float %13, %8
%17 = select i1 %16, float %13, float %8
%18 = add nuw nsw i64 %7, 1
br label %6
19: ; preds = %23, %6
%20 = phi i64 [ %28, %23 ], [ 0, %6 ]
%21 = icmp slt i64 %20, %5
br i1 %21, label %23, label %22
22: ; preds = %19
ret void
23: ; preds = %19
%24 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %20, i32 0
%25 = load float, float* %24, align 4
%26 = fsub float %25, %8
%27 = fdiv float %26, %9
store float %27, float* %24, align 4
%28 = add nuw nsw i64 %20, 1
br label %19
}
