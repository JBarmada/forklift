%struct.struct0 = type { i32 }
define dso_local %struct.struct0* @func0(i32 %0, i32* nocapture %1) local_unnamed_addr {
%3 = sext i32 %0 to i64
%4 = shl nsw i64 %3, 2
%5 = tail call %struct.struct0* @mallocoPLT(i64 %4)
store i32 0, i32* %1, align 4
br label %6
6: ; preds = %32, %2
%7 = phi i32 [ 2, %2 ], [ %33, %32 ]
%8 = phi i32 [ 0, %2 ], [ %34, %32 ]
%9 = icmp slt i32 %7, %0
br i1 %9, label %10, label %35
10: ; preds = %6
%11 = sext i32 %8 to i64
br label %12
12: ; preds = %21, %10
%13 = phi i64 [ 0, %10 ], [ %24, %21 ]
%14 = icmp slt i64 %13, %11
br i1 %14, label %15, label %25
15: ; preds = %12
%16 = getelementptr inbounds %struct.struct0, %struct.struct0* %5, i64 %13, i32 0
%17 = load i32, i32* %16, align 4
%18 = mul nsw i32 %17, %17
%19 = icmp ugt i32 %18, %7
br i1 %19, label %25, label %20
20: ; preds = %15
%21 = srem i32 %7, %17
%22 = icmp eq i32 %21, 0
%23 = add nuw nsw i64 %13, 1
br i1 %22, label %32, label %12
24: ; preds = %12
%25 = sext i32 %8 to i64
%26 = getelementptr inbounds %struct.struct0, %struct.struct0* %5, i64 %25, i32 0
store i32 %7, i32* %26, align 4
%27 = add nsw i32 %8, 1
store i32 %27, i32* %1, align 4
br label %32
28: ; preds = %15
%29 = getelementptr inbounds %struct.struct0, %struct.struct0* %5, i64 %11, i32 0
store i32 %7, i32* %29, align 4
%30 = add nsw i32 %7, 1
store i32 %30, i32* %1, align 4
br label %32
31: ; preds = %20
%32 = add nuw nsw i32 %7, 1
br label %6
33: ; preds = %28, %24
ret %struct.struct0* %5
}
declare dso_local %struct.struct0* @mallocoPLT(i64) local_unnamed_addr
