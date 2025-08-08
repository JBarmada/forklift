%struct.struct0 = type { i32 }
define dso_local i32 @func0(i32 %0, i32 %1, %struct.struct0* nocapture %2) local_unnamed_addr {
%4 = alloca [32 x i8], align 16
%5 = getelementptr inbounds [32 x i8], [32 x i8]* %4, i64 0, i64 0
call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %5)
br label %6
6: ; preds = %10, %3
%7 = phi i64 [ %14, %10 ], [ 0, %3 ]
%8 = phi i32 [ %13, %10 ], [ 0, %3 ]
%9 = icmp sgt i32 %8, 0
br i1 %9, label %10, label %15
10: ; preds = %6
%11 = srem i32 %8, %1
%12 = trunc i32 %11 to i8
%13 = add i8 %12, 48
%14 = getelementptr inbounds [32 x i8], [32 x i8]* %4, i64 0, i64 %7
store i8 %13, i8* %14, align 1
%15 = add nuw i64 %7, 1
br label %6
16: ; preds = %19, %6
%17 = phi i64 [ %24, %19 ], [ 0, %6 ]
%18 = icmp slt i64 %17, %7
br i1 %18, label %19, label %25
19: ; preds = %16
%20 = getelementptr inbounds [32 x i8], [32 x i8]* %4, i64 0, i64 %17
%21 = load i8, i8* %20, align 1
%22 = zext i8 %21 to i32
%23 = getelementptr inbounds [32 x i8], [32 x i8]* %4, i64 0, i64 %17
store i8 %21, i8* %23, align 1
%24 = add nuw nsw i64 %17, 1
br label %16
25: ; preds = %16
%26 = and i64 %17, 4294967295
%27 = getelementptr inbounds [32 x i8], [32 x i8]* %4, i64 0, i64 %26
store i8 0, i8* %27, align 1
call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %5)
ret i32 %8
}
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture)
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture)
