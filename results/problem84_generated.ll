%struct.struct0 = type { i32 }
define dso_local i32 @func0(i32 %0) local_unnamed_addr {
%2 = icmp slt i32 %0, 1
br i1 %2, label %13, label %3
3: ; preds = %8, %1
%4 = phi i32 [ %9, %8 ], [ 1, %1 ]
%5 = phi i32 [ %10, %8 ], [ 18, %1 ]
%6 = icmp eq i32 %5, %0
br i1 %6, label %7, label %8
7: ; preds = %3
ret i32 %4
8: ; preds = %3
%9 = mul nsw i32 %4, 10
%10 = add nuw i32 %5, 1
br label %3
11: ; preds = %11, %1
%12 = phi i32 [ %14, %11 ], [ 0, %1 ]
%13 = mul i32 %12, 10
%14 = icmp eq i32 %13, %4
br i1 %14, label %15, label %11
15: ; preds = %11
ret i32 %13
}
