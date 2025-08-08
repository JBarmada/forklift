%struct.struct0 = type { i32* }
define dso_local signext i8 @func0(i8* nocapture readonly %0) local_unnamed_addr {
%2 = alloca [256 x i32], align 16
%3 = bitcast [256 x i32]* %2 to i8*
call void @llvm.lifetime.start.p0i8(i64 1024, i8* nonnull %3)
call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(1024) %3, i8 0, i64 1024, i1 false)
%4 = load i8, i8* %0, align 1
%5 = icmp eq i8 %4, 0
br i1 %5, label %40, label %6
6: ; preds = %1
%7 = tail call %struct.struct0* @__ctype_tolower_loc@PLT(i8 zeroext %4)
%8 = getelementptr inbounds %struct.struct0, %struct.struct0* %7, i64 0, i32 0
%9 = load i32*, i32** %8, align 8
%10 = getelementptr inbounds [256 x i32], [256 x i32]* %2, i64 0, i64 0
br label %11
11: ; preds = %36, %6
%12 = phi i8 [ %4, %6 ], [ %39, %36 ]
%13 = phi i8* [ %0, %6 ], [ %38, %36 ]
%14 = phi i8 [ 0, %6 ], [ %37, %36 ]
%15 = sext i8 %12 to i64
%16 = getelementptr inbounds i32, i32* %9, i64 %15
%17 = load i32, i32* %16, align 4
%18 = zext i32 %17 to i64
%19 = getelementptr inbounds i32, i32* %10, i64 %18
%20 = load i32, i32* %19, align 4
%21 = icmp eq i32 %20, 0
br i1 %21, label %22, label %36
22: ; preds = %11
%23 = tail call %struct.struct0* @__ctype_b_loc@_b_loc@PLT(i8 zeroext %14)
%24 = getelementptr inbounds %struct.struct0, %struct.struct0* %23, i64 0, i32 0
%25 = load i32*, i32** %24, align 8
%26 = zext i8 %14 to i64
%27 = getelementptr inbounds i32, i32* %25, i64 %26
%28 = load i32, i32* %27, align 4
%29 = and i32 %28, 1024
%30 = icmp eq i32 %29, 0
br i1 %30, label %36, label %31
31: ; preds = %22
store i32 1, i32* %19, align 4
%32 = add i8 %14, 1
br label %33
33: ; preds = %31, %22
%34 = phi i8 [ %32, %31 ], [ %14, %22 ]
%35 = getelementptr inbounds i8, i8* %13, i64 1
%36 = load i8, i8* %35, align 1
br label %11
37: ; preds = %11
call void @llvm.lifetime.end.p0i8(i64 1024, i8* nonnull %3)
ret i8 %14
}
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture)
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg)
declare dso_local %struct.struct0* @__ctype_tolower_loc@PLT(i8 zeroext) local_unnamed_addr
declare dso_local %struct.struct0* @__ctype_b_loc@PLT(i8 zeroext) local_unnamed_addr
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture)
