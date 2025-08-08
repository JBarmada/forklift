%struct.struct0 = type { i32, i32 }
define dso_local %struct.struct0* @func0(i32 %0) local_unnamed_addr {
%2 = tail call %struct.struct0* @mallocoPLT(i32 8)
%3 = getelementptr inbounds %struct.struct0, %struct.struct0* %2, i64 0, i32 0
store i32 0, i32* %3, align 4
%4 = getelementptr inbounds %struct.struct0, %struct.struct0* %2, i64 0, i32 1
store i32 0, i32* %4, align 4
%5 = getelementptr inbounds %struct.struct0, %struct.struct0* %2, i64 0, i32 1
store i32 0, i32* %5, align 4
br label %6
6: ; preds = %30, %1
%7 = phi i32 [ 1, %1 ], [ %31, %30 ]
%8 = phi i32 [ 0, %1 ], [ %32, %30 ]
%9 = icmp sgt i32 %7, %0
br i1 %9, label %33, label %10
10: ; preds = %14, %6
%11 = phi i32 [ %17, %14 ], [ %7, %6 ]
%12 = phi i32 [ %18, %14 ], [ 0, %6 ]
%13 = icmp eq i32 %12, 0
br i1 %13, label %19, label %14
14: ; preds = %10
%15 = mul nsw i32 %12, 10
%16 = srem i32 %11, 10
%17 = mul nsw i32 %16, 3
%18 = add nsw i32 %15, %17
%19 = sdiv i32 %11, 10
br label %10
20: ; preds = %10
%21 = icmp eq i32 %7, %12
br i1 %21, label %22, label %30
22: ; preds = %20
%23 = and i32 %7, 1
%24 = icmp eq i32 %23, 0
br i1 %24, label %25, label %27
25: ; preds = %22
%26 = add nsw i32 %8, 1
store i32 %26, i32* %4, align 4
br label %30
27: ; preds = %22
%28 = add nsw i32 %8, 1
store i32 %28, i32* %5, align 4
br label %30
29: ; preds = %6
ret %struct.struct0* %2
}
declare dso_local %struct.struct0* @mallocoPLT(i32) local_unnamed_addr
