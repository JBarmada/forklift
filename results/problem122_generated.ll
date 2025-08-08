%struct.struct0 = type { i64 }
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
%10 = load i64, i64* %9, align 8
%11 = trunc i64 %10 to i32
%12 = and i32 %11, -2147483647
%13 = icmp eq i32 %12, 1
%14 = select i1 %13, i32 1, i32 0
%15 = add nsw i32 %14, %6
%16 = add nuw nsw i64 %5, 1
br label %4
17: ; preds = %4
ret i32 %6
}
