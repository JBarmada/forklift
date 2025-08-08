%struct.struct0 = type { i32 }
define dso_local signext i8 @func0(%struct.struct0* nocapture readonly %0, i32 %1, i32 %2) local_unnamed_addr {
%4 = sext i32 %1 to i64
br label %5
5: ; preds = %13, %3
%6 = phi i64 [ %14, %13 ], [ 0, %3 ]
%7 = icmp slt i64 %6, %4
br i1 %7, label %8, label %15
8: ; preds = %5
%9 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %6, i32 0
%10 = load i32, i32* %9, align 4
%11 = icmp slt i32 %10, %2
br i1 %11, label %13, label %15
12: ; preds = %8
%13 = add nuw nsw i64 %6, 1
br label %5
14: ; preds = %5
%15 = icmp uge i64 %6, %4
%16 = zext i1 %15 to i8
br label %17
17: ; preds = %14, %8
%18 = phi i8 [ %16, %14 ], [ 1, %8 ]
ret i8 %18
}
