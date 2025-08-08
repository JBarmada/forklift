@.str = external hidden unnamed_addr constant [7 x i8], align 1
define dso_local i32 @func0(i32 %0) local_unnamed_addr {
br label %2
2: ; preds = %7, %1
%3 = phi i32 [ %0, %1 ], [ %14, %7 ]
%4 = phi i32 [ 1, %1 ], [ %15, %7 ]
%5 = phi i32 [ 0, %1 ], [ %13, %7 ]
%6 = icmp sgt i32 %3, 0
br i1 %6, label %7, label %16
7: ; preds = %2
%8 = and i32 %3, 1
%9 = icmp eq i32 %8, 0
%10 = urem i32 %3, 10
%11 = udiv i32 %3, 10
%12 = select i1 %9, i32 1, i32 %10
%13 = select i1 %9, i32 %5, i32 0
%14 = mul nsw i32 %12, %4
br label %2
15: ; preds = %2
%16 = icmp eq i32 %5, 0
%17 = select i1 %16, i32 0, i32 %4
ret i32 %17
}
