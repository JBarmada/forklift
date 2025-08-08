%struct.struct0 = type { i32 }
define dso_local i32 @func0(%struct.struct0* nocapture readonly %0, i32 %1) local_unnamed_addr {
%3 = sext i32 %1 to i64
br label %4
4: ; preds = %9, %2
%5 = phi i64 [ %17, %9 ], [ 1, %2 ]
%6 = phi i32 [ %16, %9 ], [ -1, %2 ]
%7 = icmp slt i64 %5, %3
br i1 %7, label %9, label %8
8: ; preds = %4
ret i32 %6
9: ; preds = %4
%10 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %5, i32 0
%11 = load i32, i32* %10, align 4
%12 = add nsw i64 %5, -1
%13 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %12, i32 0
%14 = load i32, i32* %13, align 4
%15 = icmp slt i32 %11, %14
%16 = trunc i64 %5 to i32
%17 = select i1 %15, i32 %16, i32 %6
br label %4
}
