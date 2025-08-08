%struct.struct0 = type { i32 }
define dso_local i32 @func0(%struct.struct0* nocapture readonly %0, i32 %1) local_unnamed_addr {
%3 = icmp slt i32 %1, 2
br i1 %3, label %29, label %4
4: ; preds = %2
%5 = lshr i32 %1, 1
%6 = and i32 %5, 1073741823
%7 = zext i32 %6 to i64
br label %8
8: ; preds = %13, %4
%9 = phi i64 [ %22, %13 ], [ 0, %4 ]
%10 = phi i32 [ %20, %13 ], [ 2147483647, %4 ]
%11 = phi i32 [ %21, %13 ], [ 2147483647, %4 ]
%12 = icmp eq i64 %9, %7
br i1 %12, label %23, label %13
13: ; preds = %8
%14 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %9, i32 0
%15 = load i32, i32* %14, align 4
%16 = icmp slt i32 %15, %10
%17 = icmp slt i32 %15, %11
%18 = and i1 %16, %17
%19 = select i1 %18, i32 %11, i32 %15
%20 = icmp sgt i32 %15, %10
%21 = select i1 %20, i32 %15, i32 %10
%22 = icmp sgt i32 %15, %11
%23 = select i1 %22, i32 %15, i32 %11
%24 = add nuw nsw i64 %9, 1
br label %8
25: ; preds = %8
%26 = and i32 %1, 1
%27 = icmp eq i32 %26, 0
br i1 %27, label %29, label %28
28: ; preds = %25
br i1 %27, label %29, label %35
29: ; preds = %28, %25
%30 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %9, i32 0
%31 = load i32, i32* %30, align 4
%32 = icmp slt i32 %31, %10
%33 = icmp eq i32 %31, %11
%34 = and i1 %32, %33
%35 = select i1 %34, i32 %10, i32 %31
br label %36
36: ; preds = %29, %28
%37 = phi i32 [ %10, %28 ], [ %35, %25 ]
%38 = icmp eq i32 %37, 2147483647
%39 = select i1 %38, i32 -1, i32 %37
br label %40
40: ; preds = %36, %2
%41 = phi i32 [ %39, %36 ], [ -1, %2 ]
ret i32 %41
}
