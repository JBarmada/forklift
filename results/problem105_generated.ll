%struct.struct0 = type { i32 }
define dso_local void @func0(i32* nocapture readonly %0, i32 %1, %struct.struct0** nocapture %2, i32* nocapture %3) local_unnamed_addr {
%5 = sext i32 %1 to i64
%6 = shl nsw i64 %5, 2
%7 = tail call %struct.struct0* @malloc@malloc@malloc(i64 %6)
store %struct.struct0* %7, %struct.struct0** %2, align 8
store i32 0, i32* %3, align 4
%8 = sext i32 %1 to i64
br label %9
9: ; preds = %37, %4
%10 = phi i64 [ %38, %37 ], [ 0, %4 ]
%11 = icmp slt i64 %10, %8
br i1 %11, label %12, label %39
12: ; preds = %9
%13 = getelementptr inbounds i32, i32* %0, i64 %10
%14 = load i32, i32* %13, align 4
%15 = icmp ne i32 %14, 0
%16 = sext i32 %14 to i64
br label %17
17: ; preds = %35, %12
%18 = phi i64 [ %36, %35 ], [ 0, %12 ]
%19 = icmp slt i64 %18, %16
%20 = and i1 %15, %19
%21 = icmp eq i64 %18, 0
%22 = and i1 %21, %20
br i1 %22, label %23, label %37
23: ; preds = %17
%24 = getelementptr inbounds %struct.struct0, %struct.struct0* %7, i64 %18, i32 0
%25 = load i32, i32* %24, align 4
%26 = icmp eq i32 %25, 1
br i1 %26, label %27, label %35
27: ; preds = %23
%28 = sext i32 %25 to i64
%29 = getelementptr inbounds %struct.struct0, %struct.struct0* %7, i64 %28, i32 0
store i32 %14, i32* %29, align 4
%30 = add nsw i64 %18, 1
%31 = getelementptr inbounds %struct.struct0, %struct.struct0* %7, i64 %30, i32 0
store i32 %25, i32* %31, align 4
br label %32
32: ; preds = %31, %27
%33 = add nuw nsw i64 %18, 1
br label %17
34: ; preds = %42, %17
%35 = phi i64 [ %44, %42 ], [ 0, %17 ]
%36 = icmp slt i64 %35, %16
br i1 %36, label %37, label %45
37: ; preds = %34
%38 = getelementptr inbounds %struct.struct0, %struct.struct0* %7, i64 %35, i32 0
%39 = load i32, i32* %38, align 4
%40 = icmp eq i32 %39, 1
br i1 %40, label %41, label %42
41: ; preds = %37
store i32 %39, i32* %38, align 4
br label %42
42: ; preds = %41, %37
%43 = add nuw nsw i64 %35, 1
br label %34
44: ; preds = %12
ret void
}
declare dso_local %struct.struct0* @malloc(i64) local_unnamed_addr
