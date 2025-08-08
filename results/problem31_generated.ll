%struct.struct0 = type { float }
define dso_local float* @func0(float* nocapture readonly %0, i32 %1, i32* nocapture %2) local_unnamed_addr {
%4 = sext i32 %1 to i64
%5 = shl nsw i64 %4, 2
%6 = tail call %struct.struct0* @malloc@malloc@PLT(i64 %5)
store i32 0, i32* %2, align 4
br label %7
7: ; preds = %20, %3
%8 = phi i32 [ %21, %20 ], [ 0, %3 ]
%9 = phi i64 [ %22, %20 ], [ 0, %3 ]
%10 = icmp slt i64 %9, %4
br i1 %10, label %11, label %23
11: ; preds = %7
%12 = getelementptr inbounds float, float* %0, i64 %9
%13 = load float, float* %12, align 4
%14 = fcmp ogt float %13, 0.000000e+00
br i1 %14, label %15, label %20
15: ; preds = %11
%16 = add nsw i32 %8, 1
store i32 %16, i32* %2, align 4
%17 = sext i32 %8 to i64
%18 = getelementptr inbounds %struct.struct0, %struct.struct0* %6, i64 %17, i32 0
store float %13, float* %18, align 4
br label %19
19: ; preds = %15, %11
%20 = phi i32 [ %16, %15 ], [ %8, %11 ]
%21 = add nuw nsw i64 %9, 1
br label %7
22: ; preds = %7
ret float* %6
}
declare dso_local %struct.struct0* @mallocPLT(i64) local_unnamed_addr
