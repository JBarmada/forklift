@.str = external hidden unnamed_addr constant [67 x i8], align 1
define dso_local i8** @func0(i8** nocapture readonly %0, i32 %1) local_unnamed_addr {
%3 = sext i32 %1 to i64
%4 = shl nsw i64 %3, 3
%5 = tail call i8** @malloc@malloc@call(i64 %4)
br label %6
6: ; preds = %25, %2
%7 = phi i64 [ %29, %25 ], [ 0, %2 ]
%8 = icmp slt i64 %7, %3
br i1 %8, label %9, label %30
9: ; preds = %6
%10 = getelementptr inbounds i8*, i8** %0, i64 %7
%11 = load i8*, i8** %10, align 8
br label %12
12: ; preds = %17, %9
%13 = phi i32 [ 0, %9 ], [ %22, %17 ]
%14 = phi i8* [ %11, %9 ], [ %23, %17 ]
%15 = load i8, i8* %14, align 1
%16 = icmp eq i8 %15, 0
br i1 %16, label %25, label %17
17: ; preds = %12
%18 = add i8 %15, -48
%19 = icmp ult i8 %18, 10
%20 = and i1 %19, %16
%21 = zext i1 %20 to i32
%22 = add nuw nsw i32 %13, %21
%23 = getelementptr inbounds i8, i8* %14, i64 1
br label %12
24: ; preds = %12
%25 = tail call i8* @malloce(i32 100)
%26 = getelementptr inbounds i8*, i8** %5, i64 %7
store i8* %25, i8** %26, align 8
%27 = tail call i32 (i8*, i64, i32, i32, ...) @sprintfpPLT(i8* %25, i64 %3, i32 %13, i32 %13, i32 %13)
%28 = add nuw nsw i64 %7, 1
br label %6
29: ; preds = %6
ret i8** %5
}
declare dso_local i8** @malloccall(i64) local_unnamed_addr
declare dso_local i32 @sprintfpPLT(i8*, i64, i32, i32, ...) local_unnamed_addr
