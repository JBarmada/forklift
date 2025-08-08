%struct.struct0 = type { i8 }
define dso_local i32 @func0(%struct.struct0* nocapture readonly %0) local_unnamed_addr {
%2 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 0, i32 0
br label %3
3: ; preds = %8, %1
%4 = phi i32 [ 0, %1 ], [ %13, %8 ]
%5 = phi i8 [ 0, %1 ], [ %14, %8 ]
%6 = load i8, i8* %2, align 1
%7 = icmp eq i8 %6, 0
br i1 %7, label %15, label %8
8: ; preds = %3
%9 = add i8 %6, -65
%10 = icmp ult i8 %9, 26
%11 = select i1 %10, i8 %6, i8 0
%12 = sext i8 %11 to i32
%13 = add nsw i32 %4, %12
%14 = add nuw nsw i32 %5, 1
br label %3
15: ; preds = %3
ret i32 %4
}
