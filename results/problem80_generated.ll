@.str = external hidden unnamed_addr constant [7 x i8], align 1
@.str.1 = external hidden unnamed_addr constant [6 x i8], align 1
define dso_local i8* @func0(i32 %0) local_unnamed_addr {
%2 = tail call i8* @malloc@malloc@PLT(i64 64)
%3 = icmp eq i8* %2, null
br i1 %3, label %44, label %4
4: ; preds = %1
%5 = getelementptr inbounds i8, i8* %2, i64 63
store i8 0, i8* %5, align 1
%6 = icmp eq i32 %0, 0
br i1 %6, label %7, label %8
7: ; preds = %4
store i8 48, i8* %5, align 1
br label %20
8: ; preds = %12, %4
%9 = phi i32 [ %17, %12 ], [ %0, %4 ]
%10 = phi i32 [ %16, %12 ], [ 62, %4 ]
%11 = icmp sgt i32 %9, 0
br i1 %11, label %12, label %18
12: ; preds = %8
%13 = trunc i32 %9 to i8
%14 = and i8 %13, 1
%15 = or i8 %14, 48
%16 = zext i32 %10 to i64
%17 = getelementptr inbounds i8, i8* %2, i64 %16
store i8 %15, i8* %17, align 1
%18 = lshr i32 %9, 1
br label %8
19: ; preds = %8
%20 = add nsw i32 %10, -1
%21 = sext i32 %20 to i64
%22 = getelementptr inbounds i8, i8* %2, i64 %21
store i8 48, i8* %22, align 1
%23 = add nsw i32 %10, -1
%24 = sext i32 %23 to i64
%25 = getelementptr inbounds i8, i8* %2, i64 %24
store i8 108, i8* %25, align 1
%26 = sub nsw i32 66, %10
%27 = sext i32 %26 to i64
%28 = tail call i8* @mallocr(i64 %27)
%29 = icmp eq i8* %28, null
br i1 %29, label %38, label %30
30: ; preds = %19, %7
%31 = phi i32 [ %9, %7 ], [ %23, %19 ]
%32 = phi i8* [ %2, %7 ], [ %28, %19 ]
%33 = getelementptr inbounds i8, i8* %32, i64 %21
store i8 97, i8* %33, align 1
%34 = add nsw i32 %31, 1
%35 = sext i32 %34 to i64
%36 = getelementptr inbounds i8, i8* %32, i64 %35
store i8 108, i8* %36, align 1
%37 = add nsw i32 %31, 2
%38 = sext i32 %37 to i64
%39 = getelementptr inbounds i8, i8* %32, i64 %38
store i8 108, i8* %39, align 1
br label %40
40: ; preds = %30, %19
%41 = phi i8* [ null, %19 ], [ %32, %30 ]
%42 = tail call i32 @free(i8* nonnull %2)
br label %43
43: ; preds = %40, %1
%44 = phi i8* [ null, %1 ], [ %41, %40 ]
ret i8* %44
}
declare dso_local i8* @mallocPLT(i64) local_unnamed_addr
declare dso_local i32 @free(i8* nocapture) local_unnamed_addr
declare dso_local i32 @free(i8* nocapture) local_unnamed_addr
