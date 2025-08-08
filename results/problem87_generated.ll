%struct.struct0 = type { i32 }
define dso_local void @func0(i8* %0) local_unnamed_addr {
%2 = alloca [4 x i8], align 1
%3 = getelementptr inbounds [4 x i8], [4 x i8]* %2, i64 0, i64 0
call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3)
%4 = tail call i64 @strlen(i8* nonnull dereferenceable(1) %0)
%5 = shl i64 %4, 32
%6 = add i64 %5, 8589934592
%7 = ashr exact i64 %6, 32
%8 = tail call %struct.struct0* @malloc<i64 %7, i64 %4)
%9 = trunc i64 %4 to i32
%10 = sext i32 %9 to i64
br label %11
11: ; preds = %47, %1
%12 = phi i64 [ %49, %47 ], [ 0, %1 ]
%13 = phi i32 [ %48, %47 ], [ 0, %1 ]
%14 = icmp sgt i64 %12, %10
br i1 %14, label %15, label %18
15: ; preds = %11
%16 = sext i32 %13 to i64
%17 = getelementptr inbounds i8, i8* %0, i64 %16
store i8 0, i8* %17, align 1
call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3)
ret void
18: ; preds = %11
%19 = getelementptr inbounds i8, i8* %0, i64 %12
%20 = load i8, i8* %19, align 1
%21 = and i8 %20, -33
%22 = icmp eq i8 %21, 0
br i1 %22, label %23, label %47
23: ; preds = %18
%24 = add nsw i32 %13, -1
%25 = sext i32 %24 to i64
br label %26
26: ; preds = %45, %23
%27 = phi i64 [ 0, %23 ], [ %46, %45 ]
%28 = icmp slt i64 %27, %25
br i1 %28, label %29, label %47
29: ; preds = %26
%30 = getelementptr inbounds [4 x i8], [4 x i8]* %2, i64 0, i64 %27
%31 = load i8, i8* %30, align 1
%32 = add nuw nsw i64 %27, 1
%33 = getelementptr inbounds i8, i8* %0, i64 %32
%34 = load i8, i8* %33, align 1
%35 = icmp sgt i8 %31, %34
br i1 %35, label %36, label %38
36: ; preds = %29
store i8 %34, i8* %30, align 1
store i8 %31, i8* %33, align 1
br label %45
37: ; preds = %29
%38 = icmp sgt i32 %13, 0
br i1 %38, label %39, label %42
39: ; preds = %37
%40 = getelementptr inbounds %struct.struct0, %struct.struct0* %8, i64 %25, i32 0
store i32 32, i32* %40, align 4
br label %41
41: ; preds = %39, %37
%42 = icmp sgt i32 %13, 0
br i1 %42, label %43, label %47
43: ; preds = %41
%44 = sext i32 %13 to i64
%45 = getelementptr inbounds %struct.struct0, %struct.struct0* %8, i64 %44, i32 0
%46 = call i32 @memcpy(i32* %45, i8* nonnull %3, i32 %13)
br label %47
47: ; preds = %43, %41, %18
%48 = phi i32 [ %24, %43 ], [ %13, %41 ], [ %13, %18 ]
%49 = add nuw nsw i64 %12, 1
br label %11
}
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture)
declare dso_local i64 @strlen(i8* nocapture) local_unnamed_addr
declare dso_local %struct.struct0* @malloc<i64(i64) local_unnamed_addr
declare dso_local i32 @memcpy(i32*, i8*, i32) local_unnamed_addr
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture)
