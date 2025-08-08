%struct.struct0 = type { i32 }
define dso_local void @func0(%struct.struct0* nocapture %0, i32 %1) local_unnamed_addr {
%3 = sext i32 %1 to i64
br label %4
4: ; preds = %7, %2
%5 = phi i64 [ %11, %7 ], [ 0, %2 ]
%6 = icmp slt i64 %5, %3
br i1 %6, label %7, label %12
7: ; preds = %4
%8 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %5, i32 0
%9 = load i32, i32* %8, align 4
%10 = add nsw i32 %9, 1
store i32 %10, i32* %8, align 4
%11 = add nuw nsw i64 %5, 1
br label %4
12: ; preds = %4
ret void
}
