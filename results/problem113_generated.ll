@.str = external hidden unnamed_addr constant [2 x i8], align 1
@.str.1 = external hidden unnamed_addr constant [2 x i8], align 1
define dso_local void @func0(i8* %0, i8* nocapture readonly %1, i8* %2, i8* %3) local_unnamed_addr {
%5 = tail call i32 @strlen(i8* nonnull dereferenceable(1) %0)
%6 = add nsw i32 %5, 1
%7 = sext i32 %6 to i64
%8 = tail call i8* @malloc@malloc@PLT(i64 %7)
br label %9
9: ; preds = %32, %4
%10 = phi i64 [ %33, %32 ], [ 0, %4 ]
%11 = getelementptr inbounds i8, i8* %0, i64 %10
%12 = load i8, i8* %11, align 1
%13 = icmp eq i8 %12, 0
br i1 %13, label %34, label %14
14: ; preds = %22, %9
%15 = phi i64 [ %24, %22 ], [ 0, %9 ]
%16 = getelementptr inbounds i8, i8* %1, i64 %15
%17 = load i8, i8* %16, align 1
%18 = icmp eq i8 %17, 0
br i1 %18, label %25, label %19
19: ; preds = %14
%20 = icmp eq i8 %17, %12
br i1 %20, label %21, label %22
21: ; preds = %25, %19
br label %14
22: ; preds = %19
%23 = icmp eq i8 %17, %12
%24 = add nuw i64 %15, 1
br i1 %23, label %25, label %21
25: ; preds = %22, %14
%26 = and i64 %15, 4294967295
%27 = getelementptr inbounds i8, i8* %8, i64 %26
store i8 0, i8* %27, align 1
%28 = tail call i32 @strlen(i8* nonnull dereferenceable(1) %8)
%29 = load i8, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), align 1
%30 = sext i32 %28 to i64
%31 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.1, i64 0, i64 %30
%32 = sext i32 %28 to i64
br label %33
33: ; preds = %36, %25
%34 = phi i64 [ %41, %36 ], [ 0, %25 ]
%35 = icmp slt i64 %34, %32
br i1 %35, label %36, label %32
36: ; preds = %33
%37 = getelementptr inbounds i8, i8* %8, i64 %34
%38 = load i8, i8* %37, align 1
%39 = add nuw nsw i64 %34, 4294967296
%40 = getelementptr inbounds i8, i8* %8, i64 %39
%41 = load i8, i8* %40, align 1
%42 = icmp eq i8 %38, %41
%43 = add nuw nsw i64 %34, 1
br i1 %42, label %33, label %44
44: ; preds = %36, %9
%45 = phi i8* [ %31, %36 ], [ %8, %9 ]
%46 = tail call i32 @strcpy(i8* %2, i8* nonnull %8)
%47 = tail call i32 @strcpy(i8* %3, i8* nonnull %45)
%48 = tail call i32 @strcpy(i8* %3, i8* nonnull %45)
ret void
}
declare dso_local i32 @strlen(i8* nocapture) local_unnamed_addr
declare dso_local i8* @mallocPLT(i64) local_unnamed_addr
declare dso_local i32 @strcpy(i8*, i8*) local_unnamed_addr
