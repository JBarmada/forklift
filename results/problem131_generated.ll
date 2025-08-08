%struct.struct0 = type { i32, i32 }
define dso_local i32* @func0(i32 %0) local_unnamed_addr {
%2 = add nsw i32 %0, 1
%3 = sext i32 %2 to i64
%4 = shl nsw i64 %3, 2
%5 = tail call %struct.struct0* @malloc_PLT(i64 %4)
%6 = getelementptr %struct.struct0, %struct.struct0* %5, i64 0, i32 0
store i32 1, i32* %6, align 4
%7 = icmp eq i32 %0, 0
br i1 %7, label %35, label %8
8: ; preds = %1
%9 = getelementptr inbounds %struct.struct0, %struct.struct0* %5, i64 0, i32 1
store i32 3, i32* %9, align 4
%10 = sext i32 %0 to i64
br label %11
11: ; preds = %33, %8
%12 = phi i64 [ %34, %33 ], [ 2, %8 ]
%13 = icmp sgt i64 %12, %10
br i1 %13, label %35, label %14
14: ; preds = %11
%15 = and i64 %12, 1
%16 = icmp eq i64 %15, 0
br i1 %16, label %17, label %20
17: ; preds = %14
%18 = lshr i64 %12, 1
%19 = getelementptr inbounds %struct.struct0, %struct.struct0* %5, i64 %12, i32 0
store i32 %18, i32* %19, align 4
br label %33
20: ; preds = %14
%21 = add nsw i64 %12, -1
%22 = getelementptr inbounds %struct.struct0, %struct.struct0* %5, i64 %21, i32 0
%23 = load i32, i32* %22, align 4
%24 = getelementptr inbounds %struct.struct0, %struct.struct0* %5, i64 %21, i32 1
%25 = load i32, i32* %24, align 4
%26 = add i32 %23, %25
%27 = add i32 %26, %25
%28 = add i32 %27, 1
%29 = getelementptr inbounds %struct.struct0, %struct.struct0* %5, i64 %12, i32 0
%30 = load i32, i32* %29, align 4
%31 = add i32 %28, %30
store i32 %31, i32* %22, align 4
br label %33
32: ; preds = %17
%33 = lshr i64 %12, 1
%34 = getelementptr inbounds %struct.struct0, %struct.struct0* %5, i64 %12, i32 0
store i32 %33, i32* %34, align 4
br label %35
35: ; preds = %32, %20, %1
ret i32* %6
}
declare dso_local %struct.struct0* @malloc_PLT(i64) local_unnamed_addr
