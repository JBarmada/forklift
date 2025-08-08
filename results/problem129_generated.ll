%struct.struct0 = type { i32 }
define dso_local i32 @func0(%struct.struct0* nocapture readonly %0, i32 %1) local_unnamed_addr {
%3 = icmp eq i32 %1, 0
br i1 %3, label %32, label %4
4: ; preds = %2
%5 = sext i32 %1 to i64
br label %6
6: ; preds = %11, %4
%7 = phi i64 [ 0, %4 ], [ %24, %11 ]
%8 = phi i32 [ 0, %4 ], [ %23, %11 ]
%9 = phi i32 [ 1, %4 ], [ %22, %11 ]
%10 = icmp slt i64 %7, %5
br i1 %10, label %11, label %25
11: ; preds = %6
%12 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %7, i32 0
%13 = load i32, i32* %12, align 4
%14 = icmp eq i32 %13, 0
%15 = select i1 %14, i32 0, i32 %9
%16 = icmp slt i32 %13, 0
%17 = sub nsw i32 0, %15
%18 = select i1 %16, i32 %17, i32 %15
%19 = icmp slt i32 %18, 0
%20 = sub nsw i32 0, %18
%21 = select i1 %19, i32 %20, i32 %18
%22 = add i32 %21, %8
%23 = add nuw nsw i64 %7, 1
br label %6
24: ; preds = %6
%25 = mul nsw i32 %8, %9
br label %26
26: ; preds = %24, %2
%27 = phi i32 [ %25, %24 ], [ -32768, %2 ]
ret i32 %27
}
