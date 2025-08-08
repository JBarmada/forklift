%struct.struct0 = type { i32 }
define dso_local i32 @func0(%struct.struct0* nocapture readonly %0, i32 %1) local_unnamed_addr {
%3 = icmp slt i32 %1, 1
br i1 %3, label %27, label %4
4: ; preds = %2
%5 = zext i32 %1 to i64
%6 = shl nuw nsw i64 %5, 2
%7 = tail call i32* @mallocpPLT(i64 %6)
%8 = icmp eq i32* %7, null
br i1 %8, label %27, label %9
9: ; preds = %4
%10 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 0, i32 0
br label %11
11: ; preds = %14, %9
%12 = phi i64 [ %21, %14 ], [ 0, %9 ]
%13 = icmp eq i64 %12, %5
br i1 %13, label %22, label %14
14: ; preds = %11
%15 = getelementptr inbounds i32, i32* %7, i64 %12
%16 = load i32, i32* %15, align 4
%17 = load i32, i32* %10, align 4
%18 = icmp sgt i32 %16, %17
%19 = select i1 %18, i32 %16, i32 %17
%20 = getelementptr inbounds i32, i32* %7, i64 %12
store i32 %19, i32* %20, align 4
%21 = add nuw nsw i64 %12, 1
br label %11
22: ; preds = %11
%23 = zext i32 %1 to i64
%24 = getelementptr inbounds i32, i32* %7, i64 %23
%25 = load i32, i32* %24, align 4
br label %26
26: ; preds = %22, %4, %2
%27 = phi i32 [ %25, %22 ], [ 0, %2 ], [ 0, %4 ]
ret i32 %27
}
declare dso_local i32* @mallocpPLT(i64) local_unnamed_addr
