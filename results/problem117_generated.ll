%struct.struct0 = type { i32 }
define dso_local void @func0(%struct.struct0* nocapture %0, i32 %1) local_unnamed_addr {
%3 = sext i32 %1 to i64
br label %4
4: ; preds = %42, %2
%5 = phi i64 [ %43, %42 ], [ 0, %2 ]
%6 = icmp slt i64 %5, %3
br i1 %6, label %7, label %44
7: ; preds = %4
%8 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %5, i32 0
%9 = load i32, i32* %8, align 4
%10 = icmp sgt i32 %9, 0
br i1 %10, label %11, label %42
11: ; preds = %7
%12 = and i64 %5, 4294967295
br label %13
13: ; preds = %17, %11
%14 = phi i32 [ %20, %17 ], [ 0, %11 ]
%15 = phi i32 [ %19, %17 ], [ 0, %11 ]
%16 = icmp sgt i32 %15, 0
br i1 %16, label %17, label %21
17: ; preds = %13
%18 = and i32 %15, 1
%19 = add nuw nsw i32 %18, %14
%20 = lshr i32 %15, 1
br label %13
21: ; preds = %13
%22 = zext i32 %9 to i64
%23 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %22, i32 0
%24 = load i32, i32* %23, align 4
br label %25
25: ; preds = %29, %21
%26 = phi i32 [ %24, %21 ], [ %32, %29 ]
%27 = phi i32 [ 0, %21 ], [ %33, %29 ]
%28 = icmp sgt i32 %26, 0
br i1 %28, label %29, label %34
29: ; preds = %25
%30 = and i32 %26, 1
%31 = add nuw nsw i32 %30, %27
%32 = lshr i32 %26, 1
br label %25
33: ; preds = %25
%34 = icmp ult i32 %27, %9
br i1 %34, label %35, label %37
35: ; preds = %33
store i32 %26, i32* %8, align 4
%36 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %22, i32 0
store i32 %24, i32* %36, align 4
br label %37
37: ; preds = %35, %33
%38 = add nuw nsw i64 %5, 1
br label %4
39: ; preds = %4
ret void
}
