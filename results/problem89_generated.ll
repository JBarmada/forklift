%struct.struct0 = type { i32 }
define dso_local void @func0(%struct.struct0* %0, i32 %1, %struct.struct0** nocapture %2, i32* nocapture %3) local_unnamed_addr {
store i32 %1, i32* %3, align 4
%5 = icmp eq i32 %1, 0
br i1 %5, label %6, label %7
6: ; preds = %4
store %struct.struct0* null, %struct.struct0** %2, align 8
ret void
7: ; preds = %4
%8 = sext i32 %1 to i64
%9 = shl nsw i64 %8, 2
%10 = tail call %struct.struct0* @mallocoPLT(i64 %9)
store %struct.struct0* %10, %struct.struct0** %2, align 8
%11 = icmp eq %struct.struct0* %10, null
br i1 %11, label %14, label %12
12: ; preds = %7
%13 = sext i32 %1 to i64
br label %16
14: ; preds = %7
%15 = tail call i32 @exit(i32 1)
unreachable
16: ; preds = %29, %12
%17 = phi i64 [ 0, %12 ], [ %30, %29 ]
%18 = icmp slt i64 %17, %13
br i1 %18, label %19, label %31
19: ; preds = %16
%20 = getelementptr inbounds %struct.struct0, %struct.struct0* %10, i64 %17, i32 0
%21 = load i32, i32* %20, align 4
%22 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %17, i32 0
%23 = load i32, i32* %22, align 4
%24 = add nsw i32 %23, %21
%25 = and i32 %24, -2147483647
%26 = icmp eq i32 %25, 0
br i1 %26, label %27, label %29
27: ; preds = %19
%28 = tail call i32 @exit(i32 1)
unreachable
29: ; preds = %19
%30 = getelementptr inbounds %struct.struct0, %struct.struct0* %10, i64 %17, i32 0
store i32 %25, i32* %30, align 4
%31 = add nuw nsw i64 %17, 1
br label %16
32: ; preds = %39, %16
%33 = phi i64 [ %40, %39 ], [ 0, %16 ]
%34 = icmp slt i64 %33, %13
br i1 %34, label %35, label %16
35: ; preds = %32
%36 = getelementptr inbounds %struct.struct0, %struct.struct0* %10, i64 %33, i32 0
%37 = load i32, i32* %36, align 4
%38 = getelementptr inbounds %struct.struct0, %struct.struct0* %10, i64 %33, i32 0
%39 = load i32, i32* %38, align 4
%40 = icmp sgt i32 %37, %39
br i1 %40, label %41, label %39
41: ; preds = %35
store i32 %39, i32* %36, align 4
store i32 %37, i32* %38, align 4
br label %42
42: ; preds = %41, %35
%43 = add nuw nsw i64 %33, 1
br label %32
}
declare dso_local %struct.struct0* @mallocoPLT(i64) local_unnamed_addr
declare dso_local i32 @exit(i32) local_unnamed_addr
