@.str = external hidden unnamed_addr constant [11 x i8], align 1
define dso_local i32 @func0(i8* nocapture readonly %0) local_unnamed_addr {
%2 = alloca [3 x i8], align 1
%3 = alloca [3 x i8], align 1
%4 = getelementptr inbounds [3 x i8], [3 x i8]* %2, i64 0, i64 0
call void @llvm.lifetime.start.p0i8(i64 3, i8* nonnull %4)
%5 = getelementptr inbounds [3 x i8], [3 x i8]* %3, i64 0, i64 0
call void @llvm.lifetime.start.p0i8(i64 3, i8* nonnull %5)
%6 = tail call i64 @strlen(i8* nonnull dereferenceable(1) %0)
%7 = icmp eq i64 %6, 10
br i1 %7, label %8, label %40
8: ; preds = %1
%9 = load i8, i8* %0, align 1
%10 = add i8 %9, -58
%11 = icmp ult i8 %10, -10
%12 = icmp eq i8 %9, -10
%13 = or i1 %12, %11
br i1 %13, label %40, label %14
14: ; preds = %8
%15 = getelementptr inbounds i8, i8* %0, i64 1
%16 = load i8, i8* %15, align 1
%17 = icmp eq i8 %16, -10
br i1 %17, label %18, label %40
18: ; preds = %14
%19 = getelementptr inbounds i8, i8* %0, i64 2
%20 = load i8, i8* %19, align 1
%21 = icmp eq i8 %20, 45
br i1 %21, label %22, label %40
22: ; preds = %18
%23 = getelementptr inbounds i8, i8* %0, i64 3
%24 = load i8, i8* %23, align 1
%25 = add i8 %24, -58
%26 = icmp ult i8 %25, -10
%27 = add i8 %24, -58
%28 = icmp ult i8 %27, -10
%29 = or i1 %28, %26
br i1 %29, label %40, label %30
30: ; preds = %22
%31 = getelementptr inbounds i8, i8* %0, i64 5
%32 = load i8, i8* %31, align 1
%33 = add i8 %32, -58
%34 = icmp ult i8 %33, -10
br i1 %34, label %40, label %35
35: ; preds = %30
%36 = getelementptr inbounds i8, i8* %0, i64 6
%37 = load i8, i8* %36, align 1
%38 = add i8 %37, -58
%39 = icmp ult i8 %38, -10
br i1 %39, label %40, label %40
40: ; preds = %35, %30, %22, %18, %8, %14, %1
br label %41
41: ; preds = %44, %40
%42 = phi i64 [ %48, %44 ], [ 0, %40 ]
%43 = icmp eq i64 %42, 3
br i1 %43, label %49, label %44
44: ; preds = %41
%45 = getelementptr inbounds [3 x i8], [3 x i8]* %3, i64 0, i64 %42
%46 = load i8, i8* %45, align 1
store i8 %46, i8* %4, align 1
store i8 0, i8* %5, align 1
store i8 %16, i8* %4, align 1
%47 = add nuw nsw i64 %42, 1
br label %41
48: ; preds = %41, %1
%49 = phi i32 [ 0, %1 ], [ 0, %41 ]
call void @llvm.lifetime.end.p0i8(i64 3, i8* nonnull %5)
call void @llvm.lifetime.end.p0i8(i64 3, i8* nonnull %4)
ret i32 %49
}
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture)
declare dso_local i64 @strlen(i8* nocapture) local_unnamed_addr
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture)
