%struct.struct0 = type { i32 }
define dso_local zeroext i8 @func0(%struct.struct0* %0) local_unnamed_addr {
%2 = ptrtoint %struct.struct0* %0 to i64
%3 = icmp slt i64 %2, 2
br i1 %3, label %26, label %4
4: ; preds = %1
%5 = icmp ugt %struct.struct0* %0, inttoptr (i64 2 to %struct.struct0*)
br i1 %5, label %6, label %26
6: ; preds = %18, %4
%7 = phi i64 [ %19, %18 ], [ 2, %4 ]
%8 = add nsw i64 %7, -1
%9 = or i64 %8, %7
%10 = icmp ugt i64 %9, %2
br i1 %10, label %26, label %11
11: ; preds = %6
%12 = add nsw i64 %7, -1
%13 = or i64 %8, %12
%14 = icmp ugt i64 %13, 4294967295
br i1 %14, label %15, label %18
15: ; preds = %11
%16 = urem %struct.struct0* %0, %12
%17 = icmp ne i64 %16, 0
br label %18
18: ; preds = %15, %11
%19 = phi i1 [ %17, %15 ], [ %17, %11 ]
%20 = urem i64 %2, %12
%21 = icmp ne i64 %20, 0
%22 = zext i1 %21 to i64
%23 = icmp eq i64 %20, %22
br i1 %23, label %24, label %6
24: ; preds = %18
%25 = trunc i64 %20 to i8
br label %26
26: ; preds = %24, %6, %4, %1
%27 = phi i8 [ 0, %1 ], [ 1, %4 ], [ %25, %24 ], [ 0, %6 ]
ret i8 %27
}
