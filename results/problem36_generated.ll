%struct.struct0 = type { float }
define dso_local float @func0(%struct.struct0* nocapture readonly %0, i32 %1) local_unnamed_addr {
%3 = sext i32 %1 to i64
br label %4
4: ; preds = %9, %2
%5 = phi i64 [ %14, %9 ], [ 0, %2 ]
%6 = phi float [ %13, %9 ], [ 1.800000e+02, %2 ]
%7 = icmp slt i64 %5, %3
br i1 %7, label %9, label %8
8: ; preds = %4
ret float %6
9: ; preds = %4
%10 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %5, i32 0
%11 = load float, float* %10, align 4
%12 = fcmp ogt float %11, %6
%13 = select i1 %12, float %11, float %6
%14 = add nuw nsw i64 %5, 1
br label %4
}
