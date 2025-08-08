@.str = external hidden unnamed_addr constant [11 x i8], align 1
define dso_local void @func0(i8* %0) local_unnamed_addr {
%2 = getelementptr inbounds i8, i8* %0, i64 1
br label %3
3: ; preds = %13, %1
%4 = phi i8* [ %0, %1 ], [ %14, %13 ]
%5 = load i8, i8* %4, align 1
%6 = icmp eq i8 %5, 0
br i1 %6, label %15, label %7
7: ; preds = %3
%8 = sext i8 %5 to i32
%9 = tail call i64 @memchr@memchr@memchr@(i8* nonnull %2, i32 %8, i64 11)
%10 = icmp eq i64 %9, 0
br i1 %10, label %11, label %13
11: ; preds = %7
%12 = getelementptr inbounds i8, i8* %4, i64 1
store i8 %5, i8* %4, align 1
br label %13
13: ; preds = %11, %7
%14 = getelementptr inbounds i8, i8* %4, i64 1
br label %3
15: ; preds = %3
store i8 0, i8* %4, align 1
ret void
}
declare dso_local i64 @memchr@memchr(i8*, i32, i64) local_unnamed_addr
