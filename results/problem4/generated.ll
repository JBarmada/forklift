%struct.struct0 = type { i32 }
define dso_local i32 @func0(%struct.struct0* nocapture readonly %0, i32 %1) local_unnamed_addr {
%3 = icmp slt i32 %1, 1
br i1 %3, label %22, label 4
4: ; preds = %2
%5 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 0, i32 0
%6 = load i32, i32* %5, align 4
%7 = icmp slt i32 %6, 0
br i1 %7, label %22, label 8
8: ; preds = %4
%9 = zext i32 %1 to i64
br label %10
10: ; preds = %13, %8
%11 = phi i64 [ 0, %8 ], [ %19, %13 ]
%12 = icmp eq i64 %11, %9
br i1 %12, label %20, label 13
13: ; preds = %10
%14 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %11, i32 0
%15 = load i32, i32* %14, align 4
%16 = add nsw i32 %15, %6
%17 = icmp slt i32 %16, 0
%18 = add nuw nsw i64 %11, 1
br i1 %17, label %20, label 10
19: ; preds = %10
%20 = icmp ult i64 %11, %9
%21 = zext i1 %20 to i32
br label %22
22: ; preds = %19, %13, %4, %2
%23 = phi i32 [ 0, %2 ], [ 1, %4 ], [ %21, %19 ], [ 0, %13 ]
ret i32 %23
}
