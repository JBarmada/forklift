%struct.struct0 = type { i32 }
define dso_local i32 @func0(%struct.struct0* %0) local_unnamed_addr {
%2 = ptrtoint %struct.struct0* %0 to i64
%3 = trunc i64 %2 to i32
br label %4
4: ; preds = %21, %1
%5 = phi i32 [ 2, %1 ], [ %22, %21 ]
%6 = phi i32 [ 1, %1 ], [ %23, %21 ]
%7 = icmp eq i32 %6, %3
br i1 %7, label %24, label %8
8: ; preds = %4
%9 = icmp slt i32 %6, %3
br i1 %9, label %10, label %24
10: ; preds = %17, %8
%11 = phi i32 [ %18, %17 ], [ 2, %8 ]
%12 = mul nsw i32 %11, %11
%13 = icmp sgt i32 %12, %5
br i1 %13, label %19, label %14
14: ; preds = %10
%15 = urem i32 %5, %11
%16 = icmp eq i32 %15, 0
br i1 %16, label %19, label %17
17: ; preds = %14
%18 = add nuw nsw i32 %11, 1
br label %10
19: ; preds = %14, %10
%20 = phi i32 [ 0, %14 ], [ 1, %10 ]
%21 = add nuw nsw i32 %11, %5
%22 = add nuw nsw i32 %6, %20
br label %4
23: ; preds = %4
ret i32 %5
}
