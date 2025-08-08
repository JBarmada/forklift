%struct.struct0 = type { i32 }
define dso_local i32 @func0(i32 %0, %struct.struct0* nocapture readnone %1) local_unnamed_addr {
br label %3
3: ; preds = %21, %2
%4 = phi i32 [ 0, %2 ], [ %22, %21 ]
%5 = phi i32 [ 0, %2 ], [ %23, %21 ]
%6 = icmp slt i32 %5, %0
br i1 %6, label %8, label %7
7: ; preds = %3
ret i32 %4
8: ; preds = %3
%9 = urem i32 %5, 5
%10 = icmp eq i32 %9, 0
%11 = urem i32 %5, 5
%12 = icmp eq i32 %11, 0
%13 = or i1 %10, %12
br i1 %13, label %21, label %14
14: ; preds = %18, %8
%15 = phi i32 [ %20, %18 ], [ %4, %8 ]
%16 = phi i32 [ %24, %18 ], [ %5, %8 ]
%17 = icmp eq i32 %15, 0
br i1 %17, label %21, label %18
18: ; preds = %14
%19 = urem i32 %15, 10
%20 = icmp eq i32 %19, 7
br label %14
21: ; preds = %14, %8
%22 = phi i32 [ %4, %8 ], [ %15, %14 ]
%23 = phi i32 [ %5, %8 ], [ %16, %14 ]
%24 = urem i32 %23, 10
%25 = icmp eq i32 %24, 0
%26 = zext i1 %25 to i32
%27 = add nsw i32 %16, %26
%28 = udiv i32 %23, 10
br label %14
}
