@.str = external hidden unnamed_addr constant [12 x i8], align 1
define dso_local i32 @func0(i8* %0) local_unnamed_addr {
%2 = tail call i64 @strlen(i8* nonnull dereferenceable(1) %0)
%3 = trunc i64 %2 to i32
%4 = getelementptr inbounds i8, i8* %0, i64 %2
%5 = shl i64 %2, 32
%6 = ashr exact i64 %5, 32
br label %7
7: ; preds = %12, %1
%8 = phi i64 [ %19, %12 ], [ 0, %1 ]
%9 = phi i32 [ %18, %12 ], [ 0, %1 ]
%10 = icmp slt i64 %8, %6
br i1 %10, label %12, label %11
11: ; preds = %7
ret i32 %9
12: ; preds = %7
%13 = getelementptr inbounds i8, i8* %0, i64 %8
%14 = load i8, i8* %13, align 1
%15 = tail call i64 @memchr@memchr(i8* nonnull %4, i8 signext %14, i64 11)
%16 = icmp ne i64 %15, 0
%17 = zext i1 %16 to i32
%18 = add nuw nsw i32 %9, %17
%19 = add nuw nsw i64 %8, 1
br label %7
}
declare dso_local i64 @strlen(i8* nocapture) local_unnamed_addr
declare dso_local i64 @memchr@memchr(i8*, i8 signext, i64) local_unnamed_addr
