%struct.struct0 = type { i32 }
define dso_local signext i8 @func0(%struct.struct0* nocapture readonly %0, i32 %1) local_unnamed_addr {
%3 = icmp eq i32 %1, 0
br i1 %3, label %30, label %4
4: ; preds = %2
%5 = sext i32 %1 to i64
br label %6
6: ; preds = %10, %4
%7 = phi i64 [ 0, %4 ], [ %16, %10 ]
%8 = phi i32 [ 0, %4 ], [ %15, %10 ]
%9 = icmp slt i64 %7, %5
br i1 %9, label %10, label %17
10: ; preds = %6
%11 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %7, i32 0
%12 = load i32, i32* %11, align 4
%13 = add nsw i64 %7, -1
%14 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %13, i32 0
%15 = load i32, i32* %14, align 4
%16 = icmp slt i32 %12, %15
%17 = zext i1 %16 to i32
%18 = add nuw nsw i32 %8, %17
br label %6
19: ; preds = %6
%20 = add nsw i32 %1, -1
%21 = sext i32 %20 to i64
%22 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %21, i32 0
%23 = load i32, i32* %22, align 4
%24 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 0, i32 0
%25 = load i32, i32* %24, align 4
%26 = icmp sgt i32 %23, %25
%27 = zext i1 %26 to i32
%28 = add nuw nsw i32 %8, %27
%29 = icmp slt i32 %28, 2
%30 = zext i1 %29 to i8
br label %30
31: ; preds = %19, %2
%32 = phi i8 [ 1, %2 ], [ %30, %19 ]
ret i8 %32
}
