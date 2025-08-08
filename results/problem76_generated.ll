%struct.struct0 = type { i32 }
define dso_local i32 @func0(%struct.struct0* %0) local_unnamed_addr {
%2 = ptrtoint %struct.struct0* %0 to i64
%3 = trunc i64 %2 to i32
br label %4
4: ; preds = %18, %1
%5 = phi i32 [ 0, %1 ], [ %19, %18 ]
%6 = phi i32 [ 2, %1 ], [ %20, %18 ]
%7 = mul nsw i32 %6, %6
%8 = icmp sgt i32 %7, %5
br i1 %8, label %21, label %9
9: ; preds = %14, %4
%10 = phi i32 [ %15, %14 ], [ %5, %4 ]
%11 = srem i32 %10, %6
%12 = sdiv i32 %10, %6
%13 = icmp eq i32 %11, 0
br i1 %13, label %14, label %16
14: ; preds = %9
%15 = add nsw i32 %10, 1
br label %9
16: ; preds = %9
%17 = add nsw i32 %6, 1
br label %4
18: ; preds = %4
%19 = icmp slt i32 %5, 2
%20 = select i1 %19, i32 0, i32 2
%21 = icmp eq i32 %20, 3
%22 = zext i1 %21 to i32
ret i32 %22
}
