%struct.struct0 = type { i8 }
define dso_local void @func0(%struct.struct0* nocapture readonly %0) local_unnamed_addr {
br label %2
2: ; preds = %2, %1
%3 = phi i64 [ %7, %2 ], [ 0, %1 ]
%4 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %3, i32 0
%5 = load i8, i8* %4, align 1
%6 = icmp eq i8 %5, 0
%7 = add nuw i64 %3, 1
br i1 %6, label %8, label %2
8: ; preds = %2
ret void
}
