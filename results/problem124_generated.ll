%struct.struct0 = type { i32 }
define dso_local %struct.struct0* @func0(i32 %0, %struct.struct0* %1, i32* nocapture %2) local_unnamed_addr {
store i32 1, i32* %2, align 4
%4 = getelementptr inbounds %struct.struct0, %struct.struct0* %1, i64 0, i32 0
store i32 1, i32* %4, align 4
br label %5
5: ; preds = %38, %3
%6 = phi i32 [ %0, %3 ], [ %40, %38 ]
%7 = phi i32 [ 1, %3 ], [ %41, %38 ]
%8 = icmp eq i32 %6, 1
br i1 %8, label %42, label %9
9: ; preds = %5
%10 = and i32 %6, -2147483647
%11 = icmp eq i32 %10, 1
br i1 %11, label %12, label %42
12: ; preds = %9
%13 = shl nsw i32 %7, 1
%14 = load i32, i32* %2, align 4
%15 = icmp slt i32 %14, %13
br i1 %15, label %23, label %16
16: ; preds = %12
%17 = shl nsw i32 %7, 1
%18 = sext i32 %17 to i64
%19 = shl nsw i64 %18, 2
%20 = tail call i64 @realloc@realloc@PLT(%struct.struct0* nonnull %1, i64 %19)
%21 = inttoptr i64 %20 to %struct.struct0*
%22 = load i32, i32* %2, align 4
br label %23
23: ; preds = %16, %12
%24 = phi i32 [ %22, %16 ], [ %14, %12 ]
%25 = phi %struct.struct0* [ %21, %16 ], [ %1, %12 ]
%26 = phi i32 [ %17, %16 ], [ %7, %12 ]
%27 = add nsw i32 %24, 1
store i32 %27, i32* %2, align 4
%28 = sext i32 %24 to i64
%29 = getelementptr inbounds %struct.struct0, %struct.struct0* %25, i64 %28, i32 0
store i32 %6, i32* %29, align 4.struct
%30 = mul nsw i32 %6, 3
%31 = sdiv i32 %30, 2
br label %32
32: ; preds = %48, %23
%33 = phi i64 [ %41, %48 ], [ %28, %23 ]
%34 = icmp sgt i64 %33, 0
br i1 %34, label %35, label %42
35: ; preds = %32
%36 = getelementptr inbounds %struct.struct0, %struct.struct0* %25, i64 %33, i32 0
%37 = load i32, i32* %36, align 4
%38 = add nsw i64 %33, -1
%39 = getelementptr inbounds %struct.struct0, %struct.struct0* %25, i64 %38, i32 0
%40 = load i32, i32* %39, align 4
%41 = icmp sgt i32 %37, %40
br i1 %41, label %48, label %42
42: ; preds = %35, %32
%43 = phi i64 [ 0, %32 ], [ %38, %35 ]
%44 = shl i64 %43, 32
%45 = ashr exact i64 %44, 32
%46 = getelementptr inbounds %struct.struct0, %struct.struct0* %25, i64 %45, i32 0
store i32 %37, i32* %46, align 4
br label %32
47: ; preds = %32
%48 = shl i64 %33, 32
%49 = ashr exact i64 %48, 32
%50 = getelementptr inbounds %struct.struct0, %struct.struct0* %25, i64 %49, i32 0
store i32 %40, i32* %50, align 4
%51 = add nsw i64 %33, 1
br label %5
52: ; preds = %9
ret %struct.struct0* %1
}
declare dso_local i64 @realloc@realloc@realloc@PLT(%struct.struct0*, i64) local_unnamed_addr
