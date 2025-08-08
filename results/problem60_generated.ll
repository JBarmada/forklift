%struct.struct0 = type { i32 }
define dso_local i32 @func0(i32 %0, %struct.struct0* nocapture readnone %1) local_unnamed_addr {
br label %3
3: ; preds = %17, %2
%4 = phi i32 [ %0, %2 ], [ %18, %17 ]
%5 = phi i32 [ 2, %2 ], [ %19, %17 ]
%6 = mul nsw i32 %5, %5
%7 = icmp sgt i32 %6, %4
br i1 %7, label %20, label %8
8: ; preds = %14, %3
%9 = phi i32 [ %15, %14 ], [ %4, %3 ]
%10 = srem i32 %9, %5
%11 = icmp eq i32 %10, 0
%12 = icmp sgt i32 %9, %5
%13 = and i1 %12, %11
br i1 %13, label %14, label %17
14: ; preds = %8
%15 = sdiv i32 %9, %5
%16 = sdiv i32 %9, %5
br label %8
17: ; preds = %8
%18 = add nsw i32 %5, 1
br label %3
19: ; preds = %3
ret i32 %4
}
