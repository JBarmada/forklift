%struct.struct0 = type { i64 }
define dso_local i32 @func0(%struct.struct0* nocapture readonly %0, i32 %1) local_unnamed_addr {
%3 = add nsw i32 %1, -2
%4 = sext i32 %3 to i64
br label %5
5: ; preds = %9, %2
%6 = phi i64 [ %16, %9 ], [ 0, %2 ]
%7 = phi i32 [ %15, %9 ], [ 0, %2 ]
%8 = icmp slt i64 %6, %4
br i1 %8, label %9, label %17
9: ; preds = %5
%10 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %6, i32 0
%11 = load i64, i64* %10, align 8
%12 = and i64 %11, 1
%13 = icmp eq i64 %12, 0
%14 = select i1 %13, i32 %7, i32 0
%15 = trunc i64 %11 to i32
%16 = add i32 %14, %15
%17 = add nuw nsw i64 %6, 1
br label %5
18: ; preds = %5
ret i32 %7
}
