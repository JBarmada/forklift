%struct.struct0 = type { i32 }
define dso_local i32 @func0(%struct.struct0** nocapture readonly %0, i32 %1, i32 %2, i32 %3) local_unnamed_addr {
%5 = add nsw i32 %3, -1
%6 = sext i32 %2 to i64
%7 = sext i32 %1 to i64
br label %8
8: ; preds = %28, %4
%9 = phi i64 [ %30, %28 ], [ 0, %4 ]
%10 = phi i32 [ %29, %28 ], [ 0, %4 ]
%11 = icmp slt i64 %9, %7
br i1 %11, label %12, label %31
12: ; preds = %8
%13 = getelementptr inbounds %struct.struct0*, %struct.struct0** %0, i64 %9
br label %14
14: ; preds = %17, %12
%15 = phi i64 [ 0, %12 ], [ %22, %17 ]
%16 = phi i32 [ 0, %12 ], [ %21, %17 ]
%17 = icmp slt i64 %15, %6
br i1 %17, label %18, label %23
18: ; preds = %14
%19 = load %struct.struct0*, %struct.struct0** %13, align 8
%20 = getelementptr inbounds %struct.struct0, %struct.struct0* %19, i64 %15, i32 0
%21 = load i32, i32* %20, align 4
%22 = add nsw i32 %21, %16
%23 = add nuw nsw i64 %15, 1
br label %14
24: ; preds = %14
%25 = icmp sgt i32 %16, 0
br i1 %25, label %26, label %28
26: ; preds = %24
%27 = sdiv i32 %5, %3
br label %28
28: ; preds = %26, %24
%29 = phi i32 [ %27, %26 ], [ %10, %24 ]
%30 = add nsw i32 %29, %16
br label %8
31: ; preds = %8
ret i32 %10
}
