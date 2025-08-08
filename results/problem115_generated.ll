%struct.struct0 = type { i64 }
define dso_local i64 @func0(%struct.struct0* nocapture readonly %0, i32 %1) local_unnamed_addr {
%3 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 0, i32 0
%4 = load i64, i64* %3, align 8
%5 = sext i32 %1 to i64
br label %6
6: ; preds = %13, %2
%7 = phi i64 [ %21, %13 ], [ 1, %2 ]
%8 = phi i64 [ %22, %13 ], [ %4, %2 ]
%9 = phi i64 [ %20, %13 ], [ %4, %2 ]
%10 = icmp slt i64 %7, %5
br i1 %10, label %13, label %11
11: ; preds = %6
%12 = and i64 %7, 1
ret i64 %12
13: ; preds = %6
%14 = icmp slt i64 %9, 0
%15 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %7, i32 0
%16 = load i64, i64* %15, align 8
%17 = select i1 %14, i64 %9, i64 0
%18 = add nsw i64 %16, %17
%19 = icmp slt i64 %18, %8
%20 = select i1 %19, i64 %18, i64 %8
%21 = add nuw nsw i64 %7, 1
br label %6
}
