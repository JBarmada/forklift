%struct.struct0 = type { i32 }
define dso_local i32 @func0(i32* nocapture readonly %0, i32 %1) local_unnamed_addr {
%3 = add nsw i32 %1, 1
%4 = sext i32 %3 to i64
%5 = tail call %struct.struct0* @calloc@calloc@calloc@PLT(i64 %4, i32 4)
%6 = sext i32 %1 to i64
br label %7
7: ; preds = %11, %2
%8 = phi i64 [ %22, %11 ], [ 0, %2 ]
%9 = phi i32 [ %21, %11 ], [ -1, %2 ]
%10 = icmp slt i64 %8, %6
br i1 %10, label %11, label %23
11: ; preds = %7
%12 = getelementptr inbounds i32, i32* %0, i64 %8
%13 = load i32, i32* %12, align 4
%14 = sext i32 %13 to i64
%15 = getelementptr inbounds %struct.struct0, %struct.struct0* %5, i64 %14, i32 0
%16 = load i32, i32* %15, align 4
%17 = add nsw i32 %16, 1
%18 = sext i32 %17 to i64
%19 = getelementptr inbounds %struct.struct0, %struct.struct0* %5, i64 %18, i32 0
%20 = load i32, i32* %19, align 4
%21 = icmp sgt i32 %13, %9
%22 = select i1 %21, i32 %13, i32 %9
store i32 %20, i32* %15, align 4
%23 = icmp slt i32 %20, %16
%24 = select i1 %23, i32 %22, i32 %9
%25 = add nuw nsw i64 %8, 1
br label %7
26: ; preds = %7
%27 = tail call i32 @free@free@PLT(%struct.struct0* %5)
ret i32 %9
}
declare dso_local %struct.struct0* @calloc@calloc@PLT(i64, i32) local_unnamed_addr
declare dso_local i32 @freepPLT(%struct.struct0*) local_unnamed_addr
