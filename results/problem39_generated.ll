%struct.struct0 = type { i32 }
define dso_local void @func0(i8* %0, i32 %1) local_unnamed_addr {
%3 = alloca [10 x i8], align 1
%4 = getelementptr inbounds [10 x i8], [10 x i8]* %3, i64 0, i64 0
call void @llvm.lifetime.start.p0i8(i64 10, i8* nonnull %4)
%5 = getelementptr inbounds [10 x i8], [10 x i8]* %3, i64 0, i64 0
call void @llvm.lifetime.start.p0i8(i64 10, i8* nonnull %5)
%6 = tail call i64 @strlenpPLT(i8* %0)
%7 = trunc i64 %6 to i32
%8 = add i32 %7, 2
%9 = icmp slt i32 %8, 1
%10 = udiv i32 %8, 3
%11 = zext i32 %10 to i64
%12 = select i1 %9, i32 %10, i32 1
%13 = zext i32 %12 to i64
%14 = getelementptr inbounds i8, i8* %0, i64 %13
%15 = icmp eq i32 %1, 0
%16 = zext i32 %12 to i64
%17 = getelementptr inbounds [10 x i8], [10 x i8]* %3, i64 0, i64 %16
br label %18
18: ; preds = %38, %2
%19 = phi i64 [ 0, %2 ], [ %39, %38 ]
%20 = icmp slt i64 %19, %11
br i1 %20, label %21, label %40
21: ; preds = %18
%22 = add nuw nsw i64 %19, 3
%23 = icmp ugt i64 %22, %13
%24 = select i1 %23, i64 %11, i64 %22
%25 = getelementptr inbounds i8, i8* %0, i64 %24
%26 = sext i32 %12 to i64
%27 = call i32 @strncpyr(i8* nonnull %4, i8* %25, i64 %26)
%28 = getelementptr inbounds [10 x i8], [10 x i8]* %3, i64 0, i64 %26
store i8 0, i8* %28, align 1
br i1 %15, label %29, label %31
29: ; preds = %21
%30 = load i8, i8* %4, align 1
br label %31
31: ; preds = %29, %21
%32 = phi i8 [ %30, %29 ], [ 0, %21 ]
%33 = load i8, i8* %5, align 1
%34 = getelementptr inbounds [10 x i8], [10 x i8]* %3, i64 0, i64 %19
store i8 %33, i8* %34, align 1
%35 = getelementptr inbounds [10 x i8], [10 x i8]* %3, i64 0, i64 %26
store i8 %32, i8* %35, align 1
%36 = icmp eq i32 %7, 3
br i1 %36, label %37, label %38
37: ; preds = %31
store i8 0, i8* %4, align 1
br label %38
38: ; preds = %37, %31
%39 = add nuw nsw i64 %19, 1
br label %18
40: ; preds = %18
call void @llvm.lifetime.end.p0i8(i64 10, i8* nonnull %5)
call void @llvm.lifetime.end.p0i8(i64 10, i8* nonnull %4)
ret void
}
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture)
declare dso_local i64 @strlenpPLT(i8*) local_unnamed_addr
declare dso_local i32 @strncpyr(i8*, i8*, i64) local_unnamed_addr
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture)
