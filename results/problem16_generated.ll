@.str = external hidden unnamed_addr constant [4 x i8], align 1
@.str.1 = external hidden unnamed_addr constant [2 x i8], align 1
define dso_local i8* @func0(i32 %0) local_unnamed_addr {
br label %2
2: ; preds = %6, %1
%3 = phi i32 [ 1, %1 ], [ %9, %6 ]
%4 = phi i32 [ 0, %1 ], [ %10, %6 ]
%5 = icmp slt i32 %3, %0
br i1 %5, label %6, label %11
6: ; preds = %2
%7 = tail call i64 (i8*, i32, ...) @snprintf(i8* null, i32 0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %3)
%8 = trunc i64 %7 to i32
%9 = add i32 %4, %8
%10 = add nuw nsw i32 %3, 1
br label %2
11: ; preds = %2
%12 = sext i32 %4 to i64
%13 = tail call i8* @malloc (i64 %12)
%14 = icmp eq i8* %13, null
br i1 %14, label %32, label %15
15: ; preds = %11
store i8 48, i8* %13, align 1
%16 = getelementptr inbounds i8, i8* %13, i64 1
store i8 0, i8* %16, align 1
%17 = getelementptr inbounds i8, i8* %13, i64 2
br label %18
18: ; preds = %22, %15
%19 = phi i8* [ %17, %15 ], [ %25, %22 ]
%20 = phi i32 [ 1, %15 ], [ %26, %22 ]
%21 = icmp sgt i32 %20, %0
br i1 %21, label %27, label %22
22: ; preds = %18
%23 = load i8, i8* %19, align 1
%24 = tail call i32 (i8*, i8*, ...) @sprintf(i8* nonnull dereferenceable(1) %19, i8* nonnull %16, i32 %20)
%25 = sext i32 %24 to i64
%26 = getelementptr inbounds i8, i8* %19, i64 %25
%27 = add nuw nsw i32 %20, 1
br label %18
28: ; preds = %31, %18
%29 = phi i8* [ %19, %18 ], [ null, %31 ]
ret i8* %29
}
declare dso_local i64 @snprintf(i8*, i32, ...) local_unnamed_addr
declare dso_local i8* @malloc(i64) local_unnamed_addr
declare dso_local i32 @sprintf(i8* noalias nocapture, i8* nocapture readonly, ...) local_unnamed_addr
