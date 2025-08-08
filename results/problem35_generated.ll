%struct.struct0 = type { i32 }
define dso_local i32* @func0(%struct.struct0* nocapture readonly %0, i32 %1, i32* nocapture %2) local_unnamed_addr {
%4 = sext i32 %1 to i64
%5 = shl nsw i64 %4, 2
%6 = tail call i32* @mallocoPLT(i64 %5)
%7 = sext i32 %1 to i64
br label %8
8: ; preds = %32, %3
%9 = phi i64 [ %33, %32 ], [ 0, %3 ]
%10 = icmp slt i64 %9, %7
br i1 %10, label %12, label %11
11: ; preds = %8
store i32 %1, i32* %2, align 4
ret i32* %6
12: ; preds = %8
%13 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %9, i32 0
%14 = load i32, i32* %13, align 4
%15 = getelementptr inbounds i32, i32* %6, i64 %9
%16 = sext i32 %1 to i64
br label %17
17: ; preds = %30, %12
%18 = phi i64 [ %31, %30 ], [ 0, %12 ]
%19 = icmp slt i64 %18, %16
br i1 %19, label %20, label %32
20: ; preds = %17
%21 = load i32, i32* %15, align 4
%22 = getelementptr inbounds i32, i32* %6, i64 %18
%23 = load i32, i32* %22, align 4
%24 = icmp eq i32 %14, %23
br i1 %24, label %25, label %30
25: ; preds = %20
%26 = trunc i64 %9 to i32
%27 = add nsw i32 %26, 1
%28 = sext i32 %27 to i64
%29 = getelementptr inbounds i32, i32* %6, i64 %28
store i32 %21, i32* %29, align 4
br label %32
30: ; preds = %20
%31 = add nuw nsw i64 %18, 1
br label %17
32: ; preds = %25, %17
%33 = add nuw nsw i64 %9, 1
br label %8
}
declare dso_local i32* @mallocoPLT(i64) local_unnamed_addr
