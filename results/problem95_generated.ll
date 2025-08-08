%struct.struct0 = type { i32 }
define dso_local i32 @func0(%struct.struct0* nocapture readonly %0, i32 %1) local_unnamed_addr {
%3 = sext i32 %1 to i64
br label %4
4: ; preds = %28, %2
%5 = phi i64 [ %30, %28 ], [ 0, %2 ]
%6 = phi i32 [ %29, %28 ], [ 0, %2 ]
%7 = icmp slt i64 %5, %3
br i1 %7, label %9, label %8
8: ; preds = %4
ret i32 %6
9: ; preds = %4
%10 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %5, i32 0
%11 = load i32, i32* %10, align 4
%12 = icmp sgt i32 %11, 1
br i1 %12, label %13, label %28
13: ; preds = %20, %9
%14 = phi i32 [ %23, %20 ], [ 2, %9 ]
%15 = phi i32 [ %24, %20 ], [ %6, %9 ]
%16 = icmp eq i32 %14, 0
br i1 %16, label %25, label %17
17: ; preds = %13
%18 = urem i32 %11, %15
%19 = icmp eq i32 %18, 0
br i1 %19, label %28, label %20
20: ; preds = %17
%21 = urem i32 %11, %14
%22 = icmp eq i32 %21, 0
br i1 %22, label %25, label %23
23: ; preds = %20
%24 = udiv i32 %14, 10
br label %13
25: ; preds = %20, %17, %13
%26 = phi i32 [ %6, %13 ], [ %15, %17 ], [ %15, %20 ]
%27 = icmp sgt i32 %11, %26
%28 = select i1 %27, i32 %11, i32 %26
br label %28
29: ; preds = %33, %25
%30 = phi i32 [ %36, %33 ], [ %6, %25 ]
%31 = phi i32 [ %37, %33 ], [ %14, %25 ]
%32 = icmp sgt i32 %31, 0
br i1 %32, label %33, label %38
33: ; preds = %29
%34 = urem i32 %31, %30
%35 = udiv i32 %31, 10
%36 = icmp eq i32 %34, 0
%37 = add nsw i32 %35, -1
br i1 %36, label %38, label %29
38: ; preds = %33, %29, %9
%39 = phi i32 [ %30, %29 ], [ 0, %9 ], [ %35, %33 ]
ret i32 %39
}
