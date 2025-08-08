%struct.struct0 = type { i32 }
define dso_local %struct.struct0* @func0(i8* nocapture readonly %0, i32* nocapture %1) local_unnamed_addr {
br label %3
3: ; preds = %27, %2
%4 = phi i8* [ %0, %2 ], [ %30, %27 ]
%5 = phi i32 [ 0, %2 ], [ %28, %27 ]
%6 = phi i32 [ 0, %2 ], [ %29, %27 ]
%7 = phi i32 [ 0, %2 ], [ %31, %27 ]
%8 = phi %struct.struct0* [ null, %2 ], [ %32, %27 ]
%9 = load i8, i8* %4, align 1
switch i8 %9, label %17 [
i8 0, label %33
i8 41, label %10
]
10: ; preds = %3
%11 = add nsw i32 %7, -1
%12 = icmp eq i32 %11, 0
br i1 %12, label %13, label 27
13: ; preds = %10
%14 = add nsw i32 %5, 1
%15 = sext i32 %14 to i64
%16 = shl nsw i64 %15, 2
%17 = add nsw i64 %16, 4
%18 = tail call i64 @realloc@realloc@(%struct.struct0* %8, i64 %17)
%19 = inttoptr i64 %18 to %struct.struct0*
%20 = getelementptr inbounds %struct.struct0, %struct.struct0* %19, i64 %15, i32 0
store i32 %6, i32* %20, align 4.struct
br label %27
21: ; preds = %3
%22 = icmp slt i32 %7, %6
%23 = add nsw i32 %7, 1
%24 = select i1 %22, i32 %23, i32 %6
br label %27
25: ; preds = %3
%26 = icmp slt i32 %7, %5
%27 = add nsw i32 %7, 1
%28 = select i1 %26, i32 %27, i32 %7
br label %27
29: ; preds = %3
%30 = getelementptr inbounds %struct.struct0, %struct.struct0* %8, i64 0, i32 0
store i32 %5, i32* %30, align 4
ret %struct.struct0* %8
31: ; preds = %3
%32 = add nsw i32 %7, 1
%33 = sext i32 %32 to i64
%34 = shl nsw i64 %33, 2
%35 = add nsw i64 %34, 4
%36 = tail call i64 @realloc@(%struct.struct0* %8, i64 %35)
%37 = inttoptr i64 %36 to %struct.struct0*
%38 = getelementptr inbounds %struct.struct0, %struct.struct0* %37, i64 %33, i32 0
store i32 %6, i32* %38, align 4
br label %3
}
declare dso_local i64 @realloc(%struct.struct0*, i64) local_unnamed_addr
