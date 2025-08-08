%struct.struct0 = type { i8 }
define dso_local zeroext i8 @func0(%struct.struct0* nocapture readonly %0) local_unnamed_addr {
%2 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 0, i32 0
br label %3
3: ; preds = %12, %1
%4 = phi i32 [ 0, %1 ], [ %17, %12 ]
%5 = icmp sgt i32 %4, -1
br i1 %5, label %6, label %18
6: ; preds = %3
%7 = load i8, i8* %2, align 1
%8 = zext i8 %7 to i32
switch i32 %8, label %12 [
i32 0, label %9
i32 60, label %12
]
9: ; preds = %6
%10 = icmp eq i32 %4, 0
%11 = zext i1 %10 to i8
br label %18
12: ; preds = %6
%13 = add nuw nsw i32 %4, 1
br label %14
14: ; preds = %12, %3
%15 = phi i8 [ %11, %3 ], [ %13, %12 ]
%16 = icmp eq i8 %7, 62
%17 = sext i1 %16 to i32
%18 = add nsw i32 %4, %17
br label %3
19: ; preds = %9, %6
%20 = phi i8 [ %15, %9 ], [ 0, %6 ]
ret i8 %20
}
