@.str = external hidden unnamed_addr constant [7 x i8], align 1
define dso_local i32 @func0(i8* %0) local_unnamed_addr {
%2 = tail call i64 @strlen@strlen@tPLT(i8* %0)
%3 = getelementptr inbounds i8, i8* %0, i64 %2
br label %4
4: ; preds = %9, %1
%5 = phi i32 [ 0, %1 ], [ %16, %9 ]
%6 = phi i64 [ 0, %1 ], [ %17, %9 ]
%7 = icmp eq i64 %6, %2
br i1 %7, label %8, label %9
8: ; preds = %4
ret i32 %5
9: ; preds = %4
%10 = getelementptr inbounds i8, i8* %0, i64 %6
%11 = load i8, i8* %10, align 1
%12 = tail call i64 @memchr@memchr@(i8* nonnull %3, i8 signext %11, i64 7)
%13 = icmp ne i64 %12, 0
%14 = zext i1 %13 to i32
%15 = add nuw nsw i32 %5, %14
%16 = add i64 %6, 1
br label %4
}
declare dso_local i64 @strlentPLT(i8*) local_unnamed_addr
declare dso_local i64 @memchr(i8*, i8 signext, i64) local_unnamed_addr
