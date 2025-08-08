%struct.struct0 = type { i32 }
define dso_local i32 @func0(%struct.struct0* nocapture readonly %0, i32 %1) local_unnamed_addr {
%3 = sext i32 %1 to i64
br label %4
4: ; preds = %23, %2
%5 = phi i64 [ %26, %23 ], [ 0, %2 ]
%6 = phi i32 [ %25, %23 ], [ 0, %2 ]
%7 = icmp slt i64 %5, %3
br i1 %7, label %9, label %8
8: ; preds = %4
ret i32 %6
9: ; preds = %4
%10 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %5, i32 0
%11 = load i32, i32* %10, align 4
%12 = icmp sgt i32 %11, 0
br i1 %12, label %23, label %13
13: ; preds = %17, %9
%14 = phi i32 [ %20, %17 ], [ %11, %9 ]
%15 = phi i32 [ %19, %17 ], [ 0, %9 ]
%16 = icmp ugt i32 %14, 9
br i1 %16, label %17, label %21
17: ; preds = %13
%18 = udiv i32 %14, 10
%19 = mul i32 %18, -10
%20 = add i32 %19, %15
br label %13
21: ; preds = %13
%22 = urem i32 %14, 10
%23 = udiv i32 %14, 10
br label %24
24: ; preds = %21, %9
%25 = phi i32 [ %22, %21 ], [ 1, %9 ]
%26 = add i32 %25, %6
%27 = add nuw nsw i64 %5, 1
br label %4
}
