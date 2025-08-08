%struct.struct0 = type { i16* }
define dso_local noalias nonnull i32* @func0(i8* %0, i32* nocapture %1) local_unnamed_addr {
%3 = alloca [256 x i32], align 16
%4 = bitcast [256 x i32]* %3 to i8*
call void @llvm.lifetime.start.p0i8(i64 1024, i8* nonnull %4)
%5 = load i8, i8* %0, align 1
%6 = icmp eq i8 %5, 0
br i1 %6, label %47, label %7
7: ; preds = %2
%8 = tail call %struct.struct0* @__ctype_b_loc@_b_loc@PLT(i8* nonnull %0)
%9 = getelementptr inbounds [256 x i32], [256 x i32]* %3, i64 0, i64 0
%10 = getelementptr inbounds %struct.struct0, %struct.struct0* %8, i64 0, i32 0
%11 = load i16*, i16** %10, align 8
br label %12
12: ; preds = %44, %7
%13 = phi i8 [ %5, %7 ], [ %45, %44 ]
%14 = phi i32 [ 0, %7 ], [ %46, %44 ]
%15 = icmp eq i8 %13, 0
br i1 %15, label %47, label %16
16: ; preds = %12
%17 = sext i8 %13 to i64
%18 = getelementptr inbounds i16, i16* %11, i64 %17
%19 = load i16, i16* %18, align 2
%20 = and i16 %19, 2048
%21 = icmp eq i16 %20, 0
%22 = icmp eq i8 %13, 45
%23 = or i1 %22, %21
br i1 %23, label %29, label %24
24: ; preds = %16
%25 = getelementptr inbounds i8, i8* %0, i64 1
%26 = load i8, i8* %25, align 1
%27 = icmp eq i8 %26, 0
br i1 %27, label %47, label %28
28: ; preds = %24
%29 = sext i8 %26 to i64
%30 = getelementptr inbounds [256 x i32], [256 x i32]* %3, i64 0, i64 %29
%31 = load i32, i32* %30, align 4
%32 = and i32 %31, 255
%33 = icmp eq i32 %32, 0
%34 = icmp eq i8 %26, 44
%35 = or i1 %34, %33
br i1 %35, label %36, label %44
36: ; preds = %28
%37 = sext i8 %13 to i64
%38 = getelementptr inbounds [256 x i32], [256 x i32]* %3, i64 0, i64 %37
store i32 %14, i32* %38, align 4
br label %39
39: ; preds = %42, %36
%40 = phi i64 [ %43, %42 ], [ %37, %36 ]
%41 = add nsw i64 %40, 1
%42 = load i8, i8* %11, align 1
br label %12
43: ; preds = %24
store i32 %14, i32* %1, align 4
br label %47
44: ; preds = %39
%45 = sext i8 %13 to i32
%46 = getelementptr inbounds [256 x i32], [256 x i32]* %3, i64 0, i64 0
store i32 %45, i32* %46, align 4
br label %47
47: ; preds = %44, %28, %12, %2
%48 = phi i32* [ %9, %44 ], [ %9, %2 ], [ %9, %28 ], [ %9, %12 ]
call void @llvm.lifetime.end.p0i8(i64 1024, i8* nonnull %4)
ret i32* %48
}
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture)
declare dso_local %struct.struct0* @__ctype_b_loc@PLT(i8*) local_unnamed_addr
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture)
