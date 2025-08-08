%struct.struct0 = type { i32, i32 }
define dso_local void @func0(i32* nocapture readonly %0, i32 %1, %struct.struct0* nocapture %2) local_unnamed_addr {
%4 = sext i32 %1 to i64
br label %5
5: ; preds = %29, %3
%6 = phi i64 [ %32, %29 ], [ 0, %3 ]
%7 = phi i32 [ %30, %29 ], [ 0, %3 ]
%8 = phi i32 [ %31, %29 ], [ 0, %3 ]
%9 = icmp slt i64 %6, %4
br i1 %9, label %13, label %10
10: ; preds = %5
%11 = trunc i64 %6 to i32
%12 = getelementptr inbounds %struct.struct0, %struct.struct0* %2, i64 0, i32 0
store i32 %7, i32* %12, align 4
%13 = getelementptr inbounds %struct.struct0, %struct.struct0* %2, i64 0, i32 1
store i32 %8, i32* %13, align 4
ret void
14: ; preds = %5
%15 = getelementptr inbounds i32, i32* %0, i64 %6
%16 = load i32, i32* %15, align 4
%17 = icmp slt i32 %16, 0
br i1 %17, label %18, label %22
18: ; preds = %14
%19 = icmp eq i32 %7, 0
%20 = icmp sgt i32 %16, %7
%21 = or i1 %19, %20
%22 = select i1 %21, i32 %16, i32 %7
br label %29
23: ; preds = %14
%24 = icmp eq i32 %16, 0
br i1 %24, label %29, label %25
25: ; preds = %23
%26 = icmp eq i32 %8, 0
%27 = icmp slt i32 %16, %8
%28 = or i1 %26, %27
%29 = select i1 %28, i32 %16, i32 %8
br label %30
30: ; preds = %25, %18
%31 = phi i32 [ %7, %18 ], [ %22, %25 ]
%32 = phi i32 [ %8, %18 ], [ %29, %25 ]
%33 = add nuw nsw i64 %6, 1
br label %5
}
