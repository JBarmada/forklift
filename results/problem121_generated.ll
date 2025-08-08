%struct.struct0 = type { i32 }
define dso_local void @func0(%struct.struct0* nocapture %0, i32 %1, i32 %2, %struct.struct0* nocapture %3) local_unnamed_addr {
%5 = add nsw i32 %1, -1
%6 = sext i32 %5 to i64
br label %7
7: ; preds = %19, %4
%8 = phi i64 [ %20, %19 ], [ 0, %4 ]
%9 = icmp slt i64 %8, %6
br i1 %9, label %10, label %21
10: ; preds = %7
%11 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %8, i32 0
%12 = load i32, i32* %11, align 4
%13 = getelementptr inbounds %struct.struct0, %struct.struct0* %3, i64 %8, i32 0
%14 = load i32, i32* %13, align 4
%15 = icmp sgt i32 %12, %14
br i1 %15, label %16, label %19
16: ; preds = %10
%17 = and i64 %8, 4294967295
%18 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %17, i32 0
store i32 %14, i32* %18, align 4
store i32 %12, i32* %13, align 4
br label %19
19: ; preds = %16, %10
%20 = add nuw nsw i64 %8, 1
br label %7
21: ; preds = %24, %7
%22 = phi i64 [ %27, %24 ], [ 0, %7 ]
%23 = icmp slt i64 %22, %6
br i1 %23, label %24, label %7
24: ; preds = %21
%25 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %22, i32 0
%26 = load i32, i32* %25, align 4
%27 = getelementptr inbounds %struct.struct0, %struct.struct0* %3, i64 %22, i32 0
store i32 %26, i32* %27, align 4
store i32 %12, i32* %25, align 4
%28 = add nuw nsw i64 %22, 1
br label %21
29: ; preds = %32, %10
%30 = phi i64 [ %36, %32 ], [ 0, %10 ]
%31 = icmp slt i64 %30, %6
br i1 %31, label %32, label %37
32: ; preds = %29
%33 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %30, i32 0
%34 = load i32, i32* %33, align 4
%35 = getelementptr inbounds %struct.struct0, %struct.struct0* %3, i64 %30, i32 0
store i32 %34, i32* %35, align 4
%36 = add nuw nsw i64 %30, 1
br label %29
37: ; preds = %29
ret void
}
