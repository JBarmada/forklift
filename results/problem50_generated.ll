%struct.struct0 = type { i32 }
define dso_local i32 @func0(i32 %0, i32 %1, %struct.struct0* nocapture readnone %2) local_unnamed_addr {
br label %4
4: ; preds = %9, %3
%5 = phi i32 [ 1, %3 ], [ %10, %9 ]
%6 = phi i32 [ 0, %3 ], [ %11, %9 ]
%7 = icmp sgt i32 %6, %0
br i1 %7, label %8, label %9
8: ; preds = %4
ret i32 %5
9: ; preds = %4
%10 = shl nsw i32 %5, 1
%11 = srem i32 %10, %1
%12 = add nuw nsw i32 %6, 1
br label %4
}
