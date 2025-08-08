%struct.struct0 = type { i32, i32 }
define dso_local i32 @func0(i32 %0) local_unnamed_addr {
%2 = alloca [1000 x %struct.struct0], align 16
%3 = bitcast [1000 x %struct.struct0]* %2 to i8*
call void @llvm.lifetime.start.p0i8(i64 4000, i8* nonnull %3)
call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(4000) %3, i8 0, i64 4000, i1 false)
%4 = getelementptr inbounds [1000 x %struct.struct0], [1000 x %struct.struct0]* %2, i64 0, i64 0, i32 1
store i32 1, i32* %4, align 4
%5 = sext i32 %0 to i64
br label %6
6: ; preds = %13, %1
%7 = phi i32 [ %17, %13 ], [ 1, %1 ]
%8 = phi i64 [ %18, %13 ], [ 2, %1 ]
%9 = icmp slt i64 %8, %5
br i1 %9, label %13, label %10
10: ; preds = %6
%11 = getelementptr inbounds [1000 x %struct.struct0], [1000 x %struct.struct0]* %2, i64 0, i64 0, i32 0
%12 = load i32, i32* %11, align 4
call void @llvm.lifetime.end.p0i8(i64 4000, i8* nonnull %3)
ret i32 %12
13: ; preds = %6
%14 = add nsw i64 %8, -2
%15 = getelementptr inbounds [1000 x %struct.struct0], [1000 x %struct.struct0]* %2, i64 0, i64 %14, i32 0
%16 = load i32, i32* %15, align 4
%17 = add nsw i32 %16, %7
%18 = getelementptr inbounds [1000 x %struct.struct0], [1000 x %struct.struct0]* %2, i64 0, i64 %8, i32 0
store i32 %17, i32* %18, align 4
%19 = add nuw nsw i64 %8, 1
br label %6
}
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture)
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg)
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture)
