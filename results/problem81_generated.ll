@.str = external hidden unnamed_addr constant [4 x i8], align 1
define dso_local signext i8 @func0(i8* %0) local_unnamed_addr {
%2 = tail call i64 @strlen void (i8* %0)
%3 = icmp ult i64 %2, 3
br i1 %3, label %20, label %4
4: ; preds = %18, %1
%5 = phi i64 [ %19, %18 ], [ 2, %1 ]
%6 = icmp eq i64 %5, %2
br i1 %6, label %20, label %7
7: ; preds = %4
%8 = getelementptr inbounds i8, i8* %0, i64 %5
%9 = load i8, i8* %8, align 1
br label %10
10: ; preds = %13, %7
%11 = phi i64 [ %17, %13 ], [ 0, %7 ]
%12 = icmp eq i64 %11, %2
br i1 %12, label %20, label %13
13: ; preds = %10
%14 = getelementptr inbounds [4 x i8], [4 x i8]* @.str, i64 0, i64 %11
%15 = load i8, i8* %14, align 1
%16 = getelementptr inbounds i8, i8* %0, i64 %11
%17 = load i8, i8* %16, align 1
%18 = icmp eq i8 %9, %15
%19 = add nuw i64 %11, 1
br i1 %18, label %20, label %10
20: ; preds = %13, %10, %4, %1
%21 = phi i8 [ 0, %1 ], [ 1, %4 ], [ 0, %10 ], [ 0, %13 ]
ret i8 %21
}
declare dso_local i64 @strlen void(i8*) local_unnamed_addr
