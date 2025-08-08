%struct.struct0 = type { i8, i32 }
define dso_local void @func0(i8* nocapture readonly %0, i32* nocapture %1, i32* nocapture %2, %struct.struct0* nocapture %3) local_unnamed_addr {
%5 = alloca [26 x %struct.struct0], align 16
%6 = getelementptr inbounds [26 x %struct.struct0], [26 x %struct.struct0]* %5, i64 0, i64 0, i32 0
call void @llvm.lifetime.start.p0i8(i64 26, i8* nonnull %6)
call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(26) %6, i8 0, i64 26, i1 false)
br label %7
7: ; preds = %19, %4
%8 = phi i64 [ %20, %19 ], [ 0, %4 ]
%9 = icmp eq i64 %8, 26
br i1 %9, label %21, label %10
10: ; preds = %7
%11 = getelementptr inbounds [26 x %struct.struct0], [26 x %struct.struct0]* %5, i64 0, i64 %8, i32 0
%12 = load i8, i8* %11, align 1
%13 = icmp eq i8 %12, 0
br i1 %13, label %19, label %14
14: ; preds = %10
%15 = sext i8 %12 to i64
%16 = getelementptr inbounds [26 x %struct.struct0], [26 x %struct.struct0]* %5, i64 0, i64 %15, i32 0
%17 = load i8, i8* %16, align 4
%18 = zext i8 %17 to i32
store i32 %18, i32* %11, align 4
br label %19
19: ; preds = %14, %10
%20 = phi i32 [ %18, %14 ], [ 0, %10 ]
%21 = add nuw nsw i64 %8, 1
br label %7
22: ; preds = %38, %7
%23 = phi i64 [ %39, %38 ], [ 0, %7 ]
%24 = icmp eq i64 %23, 26
br i1 %24, label %40, label %25
25: ; preds = %22
%26 = getelementptr inbounds [26 x %struct.struct0], [26 x %struct.struct0]* %5, i64 0, i64 %23, i32 0
%27 = load i8, i8* %26, align 4
%28 = zext i8 %27 to i32
%29 = getelementptr inbounds i32, i32* %1, i64 %23
store i32 %28, i32* %29, align 4
%30 = icmp eq i32 %28, %20
br i1 %30, label %31, label %38
31: ; preds = %25
%32 = add nuw nsw i32 %20, 97
%33 = trunc i32 %32 to i8
%34 = add nuw nsw i8 %33, 98
%35 = and i64 %21, 4294967295
%36 = getelementptr inbounds %struct.struct0, %struct.struct0* %3, i64 %35, i32 1
store i8 %34, i8* %36, align 1
br label %38
37: ; preds = %25
store i32 %20, i32* %2, align 4
br label %38
38: ; preds = %37, %22
%39 = sext i32 %20 to i64
%40 = getelementptr inbounds %struct.struct0, %struct.struct0* %3, i64 %39, i32 0
store i8 0, i8* %40, align 1
call void @llvm.lifetime.end.p0i8(i64 26, i8* nonnull %6)
ret void
}
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture)
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg)
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture)
