%struct.struct0 = type { i32 }
define dso_local i32 @func0(%struct.struct0* %0, i32 %1) local_unnamed_addr {
br label %3
3: ; preds = %7, %2
%4 = phi i32 [ %1, %2 ], [ %8, %7 ]
%5 = phi i32 [ %1, %2 ], [ %4, %7 ]
%6 = icmp eq i32 %4, 0
br i1 %6, label %9, label %7
7: ; preds = %3
%8 = srem i32 %5, %4
br label %3
9: ; preds = %3
ret i32 %5
}
