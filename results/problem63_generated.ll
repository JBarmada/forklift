%struct.struct0 = type { float }
define dso_local void @func0(%struct.struct0* nocapture readonly %0, i32 %1, float* nocapture %2) local_unnamed_addr {
%4 = sext i32 %1 to i64
br label %5
5: ; preds = %8, %3
%6 = phi i64 [ %15, %8 ], [ 1, %3 ]
%7 = icmp slt i64 %6, %4
br i1 %7, label %8, label %16
8: ; preds = %5
%9 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %6, i32 0
%10 = load float, float* %9, align 4
%11 = trunc i64 %6 to i32
%12 = sitofp i32 %11 to float
%13 = fmul float %10, %12
%14 = getelementptr inbounds float, float* %2, i64 %6
store float %13, float* %14, align 4
%15 = add nuw nsw i64 %6, 1
br label %5
16: ; preds = %5
ret void
}
