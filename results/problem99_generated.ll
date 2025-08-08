@.str = external hidden unnamed_addr constant [7 x i8], align 1
define dso_local i32 @func0(i8* %0) local_unnamed_addr {
%2 = load i8, i8* %0, align 1
%3 = icmp eq i8 %2, 0
br i1 %3, label %23, label %4
4: ; preds = %1
%5 = tail call i64 @strlen@strlen@strlen@tPLT(i8* nonnull %0)
br label %6
6: ; preds = %11, %4
%7 = phi i64 [ 0, %4 ], [ %19, %11 ]
%8 = phi i32 [ 0, %4 ], [ %20, %11 ]
%9 = icmp ugt i64 %5, %7
br i1 %9, label %11, label %10
10: ; preds = %6
ret i32 %8
11: ; preds = %6
%12 = icmp ugt i64 %5, %7
br i1 %12, label %13, label %23
13: ; preds = %11
%14 = getelementptr inbounds i8, i8* %0, i64 %7
%15 = load i8, i8* %14, align 1
%16 = tail call i64 @memchr@memchr@(i8* nonnull %1, i8 signext %15, i64 6)
%17 = icmp ne i64 %16, 0
%18 = zext i1 %17 to i32
%19 = add nuw nsw i32 %8, %18
%20 = add nuw i64 %7, 1
%21 = load i8, i8* %14, align 1
%22 = icmp eq i8 %21, 0
br i1 %22, label %23, label %6
23: ; preds = %13, %11, %1
%24 = phi i32 [ 0, %1 ], [ %8, %11 ], [ %19, %13 ]
ret i32 %24
}
declare dso_local i64 @strlen tPLT(i8*) local_unnamed_addr
declare dso_local i64 @memchr(i8*, i8 signext, i64) local_unnamed_addr
