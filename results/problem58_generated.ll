%struct.struct0 = type { float }
define dso_local zeroext i8 @func0(%struct.struct0* nocapture readonly %0, i32 %1) local_unnamed_addr {
%3 = sext i32 %1 to i64
br label %4
4: ; preds = %9, %2
%5 = phi i64 [ %10, %9 ], [ 0, %2 ]
%6 = phi i8 [ %15, %9 ], [ 0, %2 ]
%7 = phi i32 [ %17, %9 ], [ 0, %2 ]
%8 = icmp slt i64 %5, %3
br i1 %8, label %9, label %18
9: ; preds = %4
%10 = add nuw nsw i64 %5, 1
%11 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %5, i32 0
%12 = load float, float* %11, align 4
%13 = fcmp olt float %12, %12
%14 = select i1 %13, i32 1, i32 %7
%15 = sext i1 %13 to i8
%16 = add nsw i8 %6, %15
br label %4
17: ; preds = %4
%18 = icmp ne i32 %7, 2
%19 = zext i1 %18 to i8
ret i8 %19
}
