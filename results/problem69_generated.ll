%struct.struct0 = type { i32, i32 }
define dso_local %struct.struct0* @func0(i32* nocapture readonly %0, i32 %1, %struct.struct0* %2) local_unnamed_addr {
%4 = sext i32 %1 to i64
br label %5
5: ; preds = %23, %3
%6 = phi i64 [ %26, %23 ], [ 0, %3 ]
%7 = phi i32 [ %24, %23 ], [ 2147483647, %3 ]
%8 = phi i32 [ %25, %23 ], [ -1, %3 ]
%9 = phi i32 [ %25, %23 ], [ undef, %3 ]
%10 = icmp slt i64 %6, %4
br i1 %10, label %11, label %27
11: ; preds = %5
%12 = getelementptr inbounds i32, i32* %0, i64 %6
%13 = load i32, i32* %12, align 4
%14 = and i32 %13, 1
%15 = icmp eq i32 %14, 0
br i1 %15, label %16, label %23
16: ; preds = %11
%17 = icmp eq i32 %7, %8
%18 = icmp slt i32 %13, %9
%19 = or i1 %17, %18
%20 = select i1 %19, i32 %13, i32 %7
%21 = trunc i64 %6 to i32
%22 = select i1 %19, i32 %21, i32 %8
br label %23
23: ; preds = %16, %11
%24 = phi i32 [ %7, %11 ], [ %20, %16 ]
%25 = phi i32 [ %8, %11 ], [ %22, %16 ]
%26 = phi i32 [ %9, %11 ], [ %24, %16 ]
%27 = add nuw nsw i64 %6, 1
br label %5
28: ; preds = %5
%29 = icmp eq i32 %8, -1
br i1 %29, label %31, label %30
30: ; preds = %28
store i32 %7, i32* %9, align 4
store i32 %8, i32* %12, align 4
br label %31
31: ; preds = %30, %28
%32 = phi %struct.struct0* [ %2, %30 ], [ null, %28 ]
ret %struct.struct0* %32
}
