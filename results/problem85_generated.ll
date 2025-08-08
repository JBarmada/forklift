@.str = external hidden unnamed_addr constant [3 x i8], align 1
define dso_local i8* @func0(i32 %0) local_unnamed_addr {
%2 = alloca [6 x i8], align 1
%3 = getelementptr inbounds [6 x i8], [6 x i8]* %2, i64 0, i64 0
call void @llvm.lifetime.start.p0i8(i64 6, i8* nonnull %3)
%4 = load i8, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), align 1
%5 = getelementptr inbounds [6 x i8], [6 x i8]* %2, i64 0, i64 1
%6 = call i32 (i8*, i8*, ...) @sprintf(i8* nonnull %3, i8* nonnull %5, i32 %0)
br label %7
7: ; preds = %12, %1
%8 = phi i8* [ %3, %1 ], [ %16, %12 ]
%9 = phi i32 [ 0, %1 ], [ %15, %12 ]
%10 = load i8, i8* %8, align 1
%11 = icmp eq i8 %10, 0
br i1 %11, label %17, label %12
12: ; preds = %7
%13 = sext i8 %10 to i32
%14 = add i32 %9, -48
%15 = add i32 %14, %13
%16 = getelementptr inbounds i8, i8* %8, i64 1
br label %7
17: ; preds = %7
%18 = call i8* @malloc@malloc@(i32 33)
%19 = icmp eq i32 %9, 0
br i1 %19, label %20, label %22
20: ; preds = %17
%21 = zext i32 %9 to i64
br label %24
22: ; preds = %17
%23 = getelementptr inbounds i8, i8* %18, i64 %21
store i8 48, i8* %23, align 1
br label %45
24: ; preds = %30, %20
%25 = phi i64 [ 0, %20 ], [ %36, %30 ]
%26 = phi i32 [ %9, %20 ], [ %35, %30 ]
%27 = icmp eq i64 %25, %21
br i1 %27, label %37, label %28
28: ; preds = %24
%29 = getelementptr inbounds i8, i8* %18, i64 %25
%30 = load i8, i8* %29, align 1
%31 = and i8 %30, 1
%32 = or i8 %31, 48
%33 = getelementptr inbounds i8, i8* %18, i64 %25
store i8 %32, i8* %33, align 1
%34 = lshr i32 %26, 1
%35 = add nuw nsw i64 %25, 1
br label %24
36: ; preds = %39, %22
%37 = phi i64 [ 0, %22 ], [ %44, %39 ]
%38 = icmp eq i64 %37, %21
br i1 %38, label %45, label %39
39: ; preds = %36
%40 = getelementptr inbounds i8, i8* %18, i64 %37
%41 = load i8, i8* %40, align 1
%42 = add nsw i64 %37, -1
%43 = getelementptr inbounds i8, i8* %18, i64 %42
%44 = load i8, i8* %43, align 1
store i8 %41, i8* %40, align 1
store i8 %44, i8* %43, align 1
%45 = add nuw nsw i64 %37, 1
br label %36
46: ; preds = %36, %28
%47 = phi i8* [ %18, %28 ], [ %18, %36 ]
call void @llvm.lifetime.end.p0i8(i64 6, i8* nonnull %3)
ret i8* %47
}
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture)
declare dso_local i32 @sprintf(i8* noalias nocapture, i8* nocapture readonly, ...) local_unnamed_addr
declare dso_local i8* @malloc(i32) local_unnamed_addr
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture)
