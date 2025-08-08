%struct.struct0 = type { i32 }
define dso_local i32 @func0(%struct.struct0* nocapture readonly %0, i32 %1) local_unnamed_addr {
%3 = sext i32 %1 to i64
br label %4
4: ; preds = %8, %2
%5 = phi i64 [ %16, %8 ], [ 0, %2 ]
%6 = phi i32 [ %15, %8 ], [ 0, %2 ]
%7 = icmp slt i64 %5, %3
br i1 %7, label %8, label %17
8: ; preds = %4
%9 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %5, i32 0
%10 = load i32, i32* %9, align 4
%11 = add i32 %10, 99
%12 = icmp ult i32 %11, 199
%13 = add nsw i32 %10, 99
%14 = select i1 %12, i32 %13, i32 0
%15 = add nsw i32 %14, %6
%16 = add nuw nsw i64 %5, 1
br label %4
17: ; preds = %4
ret i32 %6
}
