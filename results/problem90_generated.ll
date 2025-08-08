%struct.struct0 = type { i8 }
define dso_local void @func0(%struct.struct0* nocapture readonly %0, i8* nocapture %1) local_unnamed_addr {
br label %3
3: ; preds = %9, %2
%4 = phi i64 [ %17, %9 ], [ 0, %2 ]
%5 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %4, i32 0
%6 = load i8, i8* %5, align 1
%7 = icmp eq i8 %6, 0
br i1 %7, label %8, label %9
8: ; preds = %3
store i8 0, i8* %1, align 1
ret void
9: ; preds = %3
%10 = sext i8 %6 to i32
%11 = add nsw i32 %10, -93
%12 = srem i32 %11, 26
%13 = trunc i32 %12 to i8
%14 = add nsw i8 %13, 97
%15 = getelementptr inbounds i8, i8* %1, i64 %4
store i8 %14, i8* %15, align 1
%16 = add nuw i64 %4, 1
br label %3
}
