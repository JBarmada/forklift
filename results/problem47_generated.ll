%struct.struct0 = type { i32, i32, i32, i32, i32, i32 }
define dso_local i32 @func0(i32 %0) local_unnamed_addr {
%2 = alloca <4 x i32>, align 16
%3 = bitcast <4 x i32>* %2 to %struct.struct0*
%4 = alloca [4 x i32], align 16
%5 = bitcast <4 x i32>* %2 to i8*
call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %5)
%6 = bitcast [4 x i32]* %4 to i8*
call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %6)
store <4 x i32> <i32 0, i32 0, i32 1, i32 0>, <4 x i32>* %2, align 16
%7 = icmp sgt i32 %0, 3
br i1 %7, label %8, label %26
8: ; preds = %1
%9 = add nuw nsw i32 %0, 1
%10 = zext i32 %9 to i64
br label %11
11: ; preds = %16, %8
%12 = phi i64 [ 0, %8 ], [ %25, %16 ]
%13 = phi i32 [ 0, %8 ], [ %17, %16 ]
%14 = phi i32 [ 0, %8 ], [ %20, %16 ]
%15 = icmp eq i64 %12, %10
br i1 %15, label %26, label %16
16: ; preds = %11
%17 = add nsw i64 %12, -1
%18 = getelementptr inbounds [4 x i32], [4 x i32]* %4, i64 0, i64 %17
%19 = load i32, i32* %18, align 4
%20 = add nsw i32 %19, %13
%21 = getelementptr inbounds [4 x i32], [4 x i32]* %4, i64 0, i64 %12
%22 = load i32, i32* %21, align 4
%23 = add nsw i32 %22, %14
%24 = getelementptr inbounds [4 x i32], [4 x i32]* %4, i64 0, i64 %17
store i32 %23, i32* %24, align 4
%25 = add nuw nsw i64 %12, 1
br label %11
26: ; preds = %11, %1
%27 = phi i32 [ 0, %1 ], [ %13, %11 ]
%28 = sext i32 %0 to i64
%29 = getelementptr inbounds [4 x i32], [4 x i32]* %2, i64 0, i64 %28
%30 = load i32, i32* %29, align 4
call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %6)
call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %5)
ret i32 %30
}
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture)
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture)
