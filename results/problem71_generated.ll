%struct.struct0 = type { i32 }
define dso_local void @func0(%struct.struct0* nocapture %0, i32 %1, %struct.struct0* nocapture %2) local_unnamed_addr {
%4 = add nsw i32 %1, -1
%5 = sext i32 %4 to i64
br label %6
6: ; preds = %19, %3
%7 = phi i64 [ %20, %19 ], [ 0, %3 ]
%8 = icmp slt i64 %7, %5
br i1 %8, label %9, label %21
9: ; preds = %6
%10 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %7, i32 0
%11 = load i32, i32* %10, align 4
%12 = add nuw nsw i64 %7, 1
%13 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %12, i32 0
%14 = load i32, i32* %13, align 4
%15 = icmp sgt i32 %11, %14
br i1 %15, label %16, label %19
16: ; preds = %9
store i32 %14, i32* %10, align 4
store i32 %11, i32* %13, align 4
br label %19
17: ; preds = %9
%18 = add nuw nsw i64 %7, 1
br label %19
19: ; preds = %17, %16
%20 = phi i64 [ %18, %17 ], [ 0, %16 ]
%21 = add nuw nsw i64 %20, 1
br label %6
22: ; preds = %38, %6
%23 = phi i64 [ %40, %38 ], [ 0, %6 ]
%24 = phi i32 [ %39, %38 ], [ 0, %6 ]
%25 = icmp slt i64 %23, %5
br i1 %25, label %26, label %41
26: ; preds = %22
%27 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %23, i32 0
%28 = load i32, i32* %27, align 4
%29 = sext i32 %24 to i64
%30 = icmp eq i64 %23, %29
%31 = sext i32 %24 to i64
%32 = getelementptr inbounds %struct.struct0, %struct.struct0* %2, i64 %31, i32 0
br i1 %30, label %33, label %35
33: ; preds = %26
%34 = add nsw i32 %24, 1
store i32 %34, i32* %32, align 4
br label %38
35: ; preds = %26
store i32 %28, i32* %32, align 4
%36 = sext i32 %24 to i64
%37 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %36, i32 0
%38 = load i32, i32* %37, align 4
%39 = add nsw i32 %24, 2
store i32 %38, i32* %37, align 4
br label %38
40: ; preds = %22
%41 = add nuw nsw i64 %23, 1
br label %22
42: ; preds = %35
ret void
}
