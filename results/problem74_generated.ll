%struct.struct0 = type { i32 }
define dso_local i32 @func0(%struct.struct0* nocapture readonly %0, i32 %1) local_unnamed_addr {
%3 = sdiv i32 %1, 2
%4 = sext i32 %3 to i64
%5 = sext i32 %1 to i64
br label %6
6: ; preds = %10, %2
%7 = phi i64 [ %17, %10 ], [ 0, %2 ]
%8 = phi i32 [ %16, %10 ], [ 0, %2 ]
%9 = icmp slt i64 %7, %4
br i1 %9, label %10, label %18
10: ; preds = %6
%11 = sub nsw i64 %5, %7
%12 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %11, i32 0
%13 = load i32, i32* %12, align 4
%14 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %7, i32 0
%15 = load i32, i32* %14, align 4
%16 = icmp ne i32 %13, %15
%17 = zext i1 %16 to i32
%18 = add nuw nsw i32 %8, %17
%19 = add nuw nsw i64 %7, 1
br label %6
20: ; preds = %6
ret i32 %8
}
