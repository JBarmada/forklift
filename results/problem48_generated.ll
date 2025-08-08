%struct.struct0 = type { float }
define dso_local float @func0(%struct.struct0* nocapture %0, i32 %1) local_unnamed_addr {
%3 = sext i32 %1 to i64
br label %4
4: ; preds = %12, %2
%5 = phi i64 [ %13, %12 ], [ 0, %2 ]
%6 = icmp slt i64 %5, %3
br i1 %6, label %7, label %14
7: ; preds = %4
%8 = add nuw nsw i64 %5, 1
%9 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %5, i32 0
br label %10
10: ; preds = %10, %7
%11 = phi i64 [ %8, %7 ], [ %13, %10 ]
%12 = add nuw nsw i64 %11, 1
%13 = icmp eq i64 %11, %3
br i1 %13, label %10, label %12
14: ; preds = %10
%15 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %12, i32 0
%16 = load float, float* %15, align 4
%17 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %11, i32 0
%18 = load float, float* %17, align 4
%19 = fcmp ogt float %16, %18
br i1 %19, label %20, label %10
20: ; preds = %14
%21 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %12, i32 0
%22 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %5, i32 0
store float %18, float* %21, align 4
store float %16, float* %22, align 4
br label %23
23: ; preds = %20, %4
%24 = trunc i64 %5 to i32
%25 = sdiv i32 %1, 2
%26 = sext i32 %25 to i64
%27 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %26, i32 0
%28 = load float, float* %27, align 4
%29 = add nsw i32 %24, -1
%30 = sext i32 %29 to i64
%31 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %30, i32 0
%32 = load float, float* %31, align 4
%33 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %26, i32 0
%34 = load float, float* %33, align 4
%35 = fadd float %32, %34
%36 = fmul float %35, 3.000000e+01
ret float %36
}
