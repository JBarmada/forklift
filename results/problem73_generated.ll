%struct.struct0 = type { i32 }
define dso_local zeroext i8 @func0(%struct.struct0* nocapture readonly %0, i32 %1, i32 %2) local_unnamed_addr {
%4 = sdiv i32 %1, 2
%5 = sext i32 %4 to i64
%6 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %5
%7 = getelementptr inbounds %struct.struct0, %struct.struct0* %6, i64 -1
br label %8
8: ; preds = %19, %3
%9 = phi i64 [ %21, %19 ], [ 0, %3 ]
%10 = phi i32 [ %20, %19 ], [ 0, %3 ]
%11 = icmp slt i64 %9, %5
br i1 %11, label %12, label %22
12: ; preds = %8
%13 = getelementptr inbounds %struct.struct0, %struct.struct0* %7, i64 %9, i32 0
%14 = load i32, i32* %13, align 4
%15 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %9, i32 0
%16 = load i32, i32* %15, align 4
%17 = icmp eq i32 %14, %16
br i1 %17, label %19, label %33
18: ; preds = %12
%19 = shl i32 %14, 1
%20 = add nsw i32 %19, %10
%21 = add nuw nsw i64 %9, 1
br label %8
22: ; preds = %8
%23 = and i32 %1, -2147483647
%24 = icmp eq i32 %23, 1
br i1 %24, label %25, label %30
25: ; preds = %22
%26 = zext i32 %4 to i64
%27 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %26, i32 0
%28 = load i32, i32* %27, align 4
%29 = add nsw i32 %28, %10
br label %30
30: ; preds = %25, %22
%31 = phi i32 [ %29, %25 ], [ %10, %22 ]
%32 = icmp sle i32 %31, %2
%33 = zext i1 %32 to i8
br label %34
34: ; preds = %30, %12
%35 = phi i8 [ %33, %30 ], [ 0, %12 ]
ret i8 %35
}
