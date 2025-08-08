%struct.struct0 = type { i32 }
define dso_local i32 @func0(i32 %0) local_unnamed_addr {
br label %2
2: ; preds = %6, %1
%3 = phi i32 [ 2, %1 ], [ %9, %6 ]
%4 = mul nsw i32 %3, %3
%5 = icmp sgt i32 %4, %0
br i1 %5, label %10, label %6
6: ; preds = %2
%7 = urem i32 %0, %3
%8 = icmp eq i32 %7, 0
%9 = add nuw nsw i32 %3, 1
br i1 %8, label %10, label %2
10: ; preds = %6, %2
%11 = phi i32 [ 1, %2 ], [ 0, %6 ]
ret i32 %11
}
