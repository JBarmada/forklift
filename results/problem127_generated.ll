%struct.struct0 = type { i32, i32 }
define dso_local zeroext i8 @func0(%struct.struct0* nocapture readonly %0, i32 %1) local_unnamed_addr {
%3 = icmp slt i32 %1, 2
br i1 %3, label %34, label %4
4: ; preds = %2
%5 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 0, i32 1
%6 = load i32, i32* %5, align 4
%7 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 0, i32 0
%8 = load i32, i32* %7, align 4
%9 = icmp slt i32 %6, %8
br i1 %9, label %34, label %10
10: ; preds = %4
%11 = icmp eq i32 %1, 2
%12 = zext i1 %11 to i64
%13 = zext i32 %1 to i64
br label %14
14: ; preds = %32, %10
%15 = phi i64 [ 2, %10 ], [ %33, %32 ]
%16 = icmp eq i64 %15, %12
br i1 %16, label %34, label %17
17: ; preds = %14
%18 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %15, i32 0
%19 = load i32, i32* %18, align 4
%20 = add nsw i64 %15, -1
%21 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %20, i32 0
%22 = load i32, i32* %21, align 4
%23 = icmp slt i32 %19, %22
br i1 %23, label %34, label %24
24: ; preds = %17
%25 = icmp eq i32 %19, %22
br i1 %25, label %26, label %32
26: ; preds = %24
%27 = add nsw i64 %15, -2
%28 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %27, i32 1
%29 = load i32, i32* %28, align 4
%30 = icmp eq i32 %19, %29
br i1 %30, label %34, label %32
31: ; preds = %14
%32 = icmp ult i32 %19, %22
%33 = zext i1 %32 to i8
br label %34
34: ; preds = %31, %26, %24, %17, %4, %2
%35 = phi i8 [ 1, %2 ], [ 0, %4 ], [ 1, %24 ], [ 0, %26 ], [ 1, %17 ], [ %33, %31 ]
ret i8 %35
}
