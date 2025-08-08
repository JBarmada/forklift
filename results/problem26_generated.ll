%struct.struct0 = type { i32 }
define dso_local %struct.struct0* @func0(i32 %0, i32* nocapture %1) local_unnamed_addr {
%3 = tail call %struct.struct0* @malloc@malloc@malloc@PLT(i32 256)
store i32 0, i32* %1, align 4
br label %4
4: ; preds = %24, %2
%5 = phi i32 [ %0, %2 ], [ %25, %24 ]
%6 = phi i32 [ 2, %2 ], [ %26, %24 ]
%7 = phi i32 [ 0, %2 ], [ %27, %24 ]
%8 = icmp sgt i32 %6, 3
br i1 %8, label %28, label %9
9: ; preds = %4
%10 = srem i32 %5, %6
%11 = icmp eq i32 %10, 0
br i1 %11, label %12, label %24
12: ; preds = %9
%13 = sext i32 %7 to i64
br label %14
14: ; preds = %14, %12
%15 = phi i64 [ %13, %12 ], [ %19, %14 ]
%16 = phi i32 [ %5, %12 ], [ %17, %14 ]
%17 = srem i32 %16, %6
%18 = sdiv i32 %16, %6
%19 = icmp eq i32 %17, 0
br i1 %19, label %14, label %20
20: ; preds = %14
%21 = getelementptr inbounds %struct.struct0, %struct.struct0* %3, i64 %15, i32 0
store i32 %6, i32* %21, align 4
%22 = add i64 %15, 1
br label %14
23: ; preds = %4
%24 = icmp sgt i32 %5, 1
br i1 %24, label %28, label %24
25: ; preds = %23
%26 = add nsw i32 %7, 1
store i32 %26, i32* %1, align 4
%27 = sext i32 %7 to i64
%28 = getelementptr inbounds %struct.struct0, %struct.struct0* %3, i64 %27, i32 0
store i32 %5, i32* %28, align 4
br label %34
29: ; preds = %20
%30 = add nsw i32 %7, 1
store i32 %30, i32* %1, align 4
%31 = sext i32 %7 to i64
%32 = getelementptr inbounds %struct.struct0, %struct.struct0* %3, i64 %31, i32 0
store i32 %5, i32* %32, align 4
br label %34
33: ; preds = %23, %9
ret %struct.struct0* %3
}
declare dso_local %struct.struct0* @mallocPLT(i32) local_unnamed_addr
