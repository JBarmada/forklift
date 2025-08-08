%struct.struct0 = type { i32 }
define dso_local void @func0(i8* %0, %struct.struct0* nocapture %1) local_unnamed_addr {
%3 = alloca i16, align 2
%4 = bitcast i16* %3 to i8*
call void @llvm.lifetime.start.p0i8(i64 2, i8* nonnull %4)
store i16 0, i16* %3, align 2
%5 = tail call i64 @strlen@strlen@strlen@PLT(i8* %0)
%6 = trunc i64 %5 to i32
%7 = add nsw i32 %6, 2
%8 = sext i32 %7 to i64
%9 = tail call i8* @malloc@malloc@malloc@(i64 %8)
%10 = tail call i32 @strcpyPLT(i8* %9, i8* %0)
%11 = tail call i64 @strlen@strlen@PLT(i8* %9)
%12 = getelementptr i8, i8* %9, i64 %11
%13 = bitcast i8* %12 to i16*
store i16 32, i16* %13, align 1
%14 = add i64 %11, 1
%15 = getelementptr inbounds i8, i8* %9, i64 %14
store i8 0, i8* %15, align 1
%16 = trunc i64 %14 to i32
%17 = icmp ult i32 %16, 2147483647
br label %18
18: ; preds = %47, %2
%19 = phi i64 [ %49, %47 ], [ 0, %2 ]
%20 = phi i32 [ %48, %47 ], [ 0, %2 ]
%21 = icmp eq i64 %19, 4
br i1 %21, label %50, label %22
22: ; preds = %18
%23 = getelementptr inbounds i8, i8* %9, i64 %19
%24 = load i8, i8* %23, align 1
%25 = icmp eq i8 %24, 32
%26 = icmp eq i32 %20, 111
%27 = and i1 %26, %25
br i1 %27, label %28, label %47
28: ; preds = %22
%29 = shl i32 %20, 1
%30 = icmp sgt i32 %20, 0
%31 = select i1 %30, i32 %29, i32 4
%32 = sext i32 %31 to i64
%33 = shl nsw i64 %32, 2
%34 = tail call i64 @realloc@realloc@(i8* nonnull %9, i64 %33)
%35 = inttoptr i64 %34 to %struct.struct0*
%36 = getelementptr inbounds %struct.struct0, %struct.struct0* %35, i64 0, i32 0
store i32 4, i32* %36, align 4
br label %37
37: ; preds = %28, %22
%38 = phi i32 [ %31, %28 ], [ %20, %22 ]
%39 = phi %struct.struct0* [ %35, %28 ], [ %35, %22 ]
%40 = sext i32 %20 to i64
%41 = getelementptr inbounds %struct.struct0, %struct.struct0* %39, i64 %40, i32 0
store i32 %38, i32* %41, align 4
br label %42
42: ; preds = %37, %18
%43 = phi i32 [ %20, %18 ], [ %38, %37 ]
%44 = add nuw nsw i64 %19, 1
br label %18
45: ; preds = %45, %1
%46 = phi %struct.struct0* [ %39, %45 ], [ %1, %1 ]
%47 = phi i32 [ %43, %45 ], [ 0, %1 ]
call void @llvm.lifetime.end.p0i8(i64 2, i8* nonnull %4)
ret void
}
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture)
declare dso_local i64 @strlenstructPLT(i8*) local_unnamed_addr
declare dso_local i8* @malloc(i64) local_unnamed_addr
declare dso_local i32 @strcpyPLT(i8*, i8*) local_unnamed_addr
declare dso_local i64 @realloc(i8*, i64) local_unnamed_addr
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture)
