%struct.struct0 = type { i32 }
define dso_local i32 @func0(i32 %0, i32 %1, %struct.struct0* nocapture readnone %2) local_unnamed_addr {
br label %4
4: ; preds = %11, %3
%5 = phi i32 [ 0, %3 ], [ %13, %11 ]
%6 = phi i32 [ 0, %3 ], [ %14, %11 ]
%7 = icmp ult i32 %6, 100
%8 = icmp ult i32 %5, 100
%9 = and i1 %8, %7
br i1 %9, label %10, label %15
10: ; preds = %4
%11 = icmp eq i32 %6, %0
br i1 %11, label %15, label %12
12: ; preds = %10
%13 = mul nsw i32 %6, %1
%14 = icmp sgt i32 %13, %0
%15 = add nuw nsw i32 %6, 1
br i1 %14, label %16, label %4
16: ; preds = %12, %10, %4
%17 = phi i32 [ 1, %10 ], [ 0, %12 ], [ 0, %4 ]
ret i32 %17
}
