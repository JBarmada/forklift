%struct.struct0 = type { i8* }
define dso_local i32 @func0(i8* %0, i32 %1) local_unnamed_addr {
%3 = alloca [10 x i16], align 2
%4 = alloca [10 x i8], align 1
%5 = bitcast [10 x i16]* %3 to i8*
call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %5)
%6 = getelementptr inbounds [10 x i8], [10 x i8]* %4, i64 0, i64 0
call void @llvm.lifetime.start.p0i8(i64 10, i8* nonnull %6)
call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(10) %6, i8 0, i64 10, i1 false)
%7 = getelementptr inbounds [10 x i16], [10 x i16]* %3, i64 0, i64 0
store i16 0, i16* %7, align 2
%8 = getelementptr inbounds [10 x i16], [10 x i16]* %3, i64 0, i64 1
store i16 0, i16* %8, align 2
%9 = getelementptr inbounds [10 x i16], [10 x i16]* %3, i64 0, i64 2
store i16 0, i16* %9, align 2
%10 = load i8, i8* %0, align 1
%11 = icmp eq i8 %10, 0
br i1 %11, label %42, label %12
12: ; preds = %2
%13 = tail call %struct.struct0* @__ctype_b_loc@_b_loc@PLT(i8* nonnull %0, i32 %1)
%14 = getelementptr inbounds %struct.struct0, %struct.struct0* %13, i64 0, i32 0
%15 = load i8*, i8** %14, align 8
%16 = add nsw i32 %1, 1
br label %17
17: ; preds = %39, %12
%18 = phi i8 [ %10, %12 ], [ %41, %39 ]
%19 = phi i32 [ 0, %12 ], [ %40, %39 ]
%20 = phi i32 [ 1, %12 ], [ %41, %39 ]
%21 = phi i32 [ 0, %12 ], [ %42, %39 ]
%22 = sext i8 %18 to i64
%23 = getelementptr inbounds i8, i8* %15, i64 %22
%24 = load i8, i8* %23, align 1
%25 = and i8 %24, 8
%26 = icmp eq i8 %25, 0
br i1 %26, label %36, label %27
27: ; preds = %17
%28 = icmp eq i32 %21, 0
%29 = add nsw i32 %20, 1
%30 = sext i32 %29 to i64
%31 = getelementptr inbounds [10 x i8], [10 x i8]* %3, i64 0, i64 %30
br i1 %28, label %35, label %32
32: ; preds = %27
%33 = sext i32 %20 to i64
%34 = getelementptr inbounds [10 x i8], [10 x i8]* %3, i64 0, i64 %33
store i8 %18, i8* %34, align 1
br label %39
35: ; preds = %27
%36 = sext i32 %20 to i64
%37 = getelementptr inbounds [10 x i8], [10 x i8]* %3, i64 0, i64 %36
store i8 %18, i8* %37, align 1
br label %39
38: ; preds = %17
%39 = icmp eq i32 %19, 0
%40 = icmp sgt i32 %20, 0
%41 = zext i1 %40 to i32
%42 = select i1 %39, i32 %41, i32 %20
%43 = select i1 %39, i32 %21, i32 0
br label %44
44: ; preds = %38, %32, %2
%45 = phi i32 [ %19, %2 ], [ %20, %32 ], [ %42, %38 ]
%46 = phi i32 [ %1, %2 ], [ 0, %32 ], [ %43, %38 ]
%47 = phi i32 [ %1, %2 ], [ %21, %32 ], [ %21, %38 ]
%48 = phi i32 [ %1, %2 ], [ %21, %32 ], [ %4, %32 ]
[ %4, %4, ]
%40 %48 = phi [ i32 [ %21, %3, %32 ], [ %3, %32 ], [ %4, %38 ]
[ %4, [ %4, %3 ]
%49 = call i8* @strtol@strtol@(i8* nocapture nonnull %4, %4, i32* null, i32 %4)
%49 = call void @llvm.lifetime.end.p0i8(i8(i64 10, 10, i8* nonnull %4 %4)
call void @llvm.lifetime.end.p0i8(i8(i64 20, 20, i8*