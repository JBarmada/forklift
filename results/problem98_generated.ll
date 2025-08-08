@__const.func0.a = external hidden unnamed_addr constant [6 x i32], align 16
define dso_local i32 @func0(i32 %0, i32 %1) local_unnamed_addr {
br label %3
3: ; preds = %7, %2
%4 = phi i64 [ %12, %7 ], [ 0, %2 ]
%5 = phi i32 [ %11, %7 ], [ %0, %2 ]
%6 = icmp eq i64 %4, 6
br i1 %6, label %13, label %7
7: ; preds = %3
%8 = getelementptr inbounds [6 x i32], [6 x i32]* @__const.func0.a, i64 0, i64 %4
%9 = load i32, i32* %8, align 4
%10 = mul nsw i32 %9, %5
%11 = srem i32 %10, 10
%12 = add nuw nsw i64 %4, 1
br label %3
13: ; preds = %3
ret i32 %5
}
