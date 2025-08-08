@.str = external hidden unnamed_addr constant [9 x i8], align 1
define dso_local float @func0(float %0) local_unnamed_addr {
br label %2
2: ; preds = %6, %1
%3 = phi i64 [ %10, %6 ], [ 0, %1 ]
%4 = icmp eq i64 %3, 8
br i1 %4, label %5, label %6
5: ; preds = %2
ret float %0
6: ; preds = %2
%7 = getelementptr inbounds [9 x i8], [9 x i8]* @.str, i64 0, i64 %3
%8 = load i8, i8* %7, align 1
%9 = fptrunc i8 %8 to float
%10 = fsub float %0, %9
%11 = add nuw nsw i64 %3, 1
br label %2
}
