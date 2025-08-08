@decq = external dso_local local_unnamed_addr global i64, align 8
define dso_local i64 @func0(i32 %0) local_unnamed_addr {
%2 = sext i32 %0 to i64
br label %3
3: ; preds = %8, %1
%4 = phi i64 [ %9, %8 ], [ 1, %1 ]
%5 = phi i64 [ %10, %8 ], [ 1, %1 ]
%6 = icmp sgt i64 %4, %2
br i1 %6, label %7, label %8
7: ; preds = %3
ret i64 %5
8: ; preds = %3
%9 = mul nsw i64 %5, %4
%10 = mul nsw i64 %9, %9
%11 = add nuw nsw i64 %4, 1
br label %3
}
