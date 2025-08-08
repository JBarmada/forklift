%struct.struct0 = type { i32 }
define dso_local void @func0(%struct.struct0* nocapture readonly %0, i32 %1, i32* %2) local_unnamed_addr {
%4 = sext i32 %1 to i64
%5 = shl nsw i64 %4, 2
%6 = tail call i32* @malloc@malloc@PLT(i64 %5)
%7 = tail call i32* @calloc@calloc@PLT(i64 %4, i64 4)
%8 = tail call i32* @calloc@calloc@PLT(i64 %4, i64 4)
%9 = sext i32 %1 to i64
br label %10
10: ; preds = %36, %3
%11 = phi i64 [ %38, %36 ], [ 0, %3 ]
%12 = phi i32 [ %37, %36 ], [ 0, %3 ]
%13 = icmp slt i64 %11, %9
br i1 %13, label %14, label %39
14: ; preds = %10
%15 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %11, i32 0
%16 = load i32, i32* %15, align 4
%17 = sext i32 %12 to i64
br label %18
18: ; preds = %21, %14
%19 = phi i64 [ %25, %21 ], [ 0, %14 ]
%20 = icmp slt i64 %19, %17
br i1 %20, label %21, label %26
21: ; preds = %18
%22 = getelementptr inbounds i32, i32* %6, i64 %19
%23 = load i32, i32* %22, align 4
%24 = icmp eq i32 %23, %16
%25 = add nuw nsw i64 %19, 1
br i1 %24, label %26, label %18
26: ; preds = %21, %18
%27 = getelementptr inbounds i32, i32* %7, i64 %17
store i32 %16, i32* %27, align 4
%28 = sext i32 %12 to i64
%29 = getelementptr inbounds i32, i32* %8, i64 %28
store i32 %16, i32* %29, align 4
%30 = add nuw nsw i64 %11, 1
%31 = add nsw i32 %12, 1
br label %32
32: ; preds = %33, %26
%33 = phi i64 [ %30, %26 ], [ 0, %33 ]
%34 = phi i32 [ 0, %26 ], [ %31, %33 ]
br label %10
35: ; preds = %39, %10
%36 = phi i64 [ %44, %39 ], [ 0, %10 ]
%37 = icmp slt i64 %36, %9
br i1 %37, label %39, label %38
38: ; preds = %35
ret void
39: ; preds = %35
%40 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %36, i32 0
%41 = load i32, i32* %40, align 4
%42 = sext i32 %41 to i64
%43 = getelementptr inbounds i32, i32* %6, i64 %42
%44 = load i32, i32* %43, align 4
%45 = icmp eq i32 %44, %16
%46 = add nuw nsw i64 %36, 1
br i1 %45, label %35, label %35
}
declare dso_local i32* @mallocPLT(i64) local_unnamed_addr
declare dso_local i32* @callocPLT(i64, i64) local_unnamed_addr
