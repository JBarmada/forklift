%struct.struct0 = type { i32 }
define dso_local i32* @func0(i32* nocapture readonly %0, i32 %1, %struct.struct0* nocapture readonly %2, i32 %3, i64 %4) local_unnamed_addr {
%6 = sext i32 %1 to i64
%7 = shl nsw i64 %6, 2
%8 = tail call i32* @mallocoPLT(i64 %7)
%9 = sext i32 %3 to i64
br label %10
10: ; preds = %39, %5
%11 = phi i64 [ %40, %39 ], [ 0, %5 ]
%12 = icmp slt i64 %11, %9
br i1 %12, label %13, label %41
13: ; preds = %10
%14 = getelementptr inbounds i32, i32* %0, i64 %11
%15 = load i32, i32* %14, align 4
%16 = getelementptr inbounds i32, i32* %8, i64 %11
%17 = sext i32 %15 to i64
br label %18
18: ; preds = %37, %13
%19 = phi i64 [ %38, %37 ], [ 0, %13 ]
%20 = icmp slt i64 %19, %6
br i1 %20, label %21, label %39
21: ; preds = %18
%22 = trunc i64 %19 to i32
br label %23
23: ; preds = %26, %21
%24 = phi i64 [ %31, %26 ], [ 0, %21 ]
%25 = icmp slt i64 %24, %17
br i1 %25, label %26, label %32
26: ; preds = %23
%27 = load i32, i32* %16, align 4
%28 = getelementptr inbounds i32, i32* %8, i64 %24
%29 = load i32, i32* %28, align 4
%30 = icmp eq i32 %27, %29
%31 = add nuw nsw i64 %24, 1
br i1 %30, label %32, label %23
32: ; preds = %26, %23
%33 = and i64 %19, 4294967295
%34 = sext i32 %22 to i64
%35 = getelementptr inbounds i32, i32* %8, i64 %33
store i32 %15, i32* %35, align 4
br label %36
36: ; preds = %32, %18
%37 = add nuw nsw i64 %19, 1
br label %18
38: ; preds = %48, %10
%39 = phi i64 [ %49, %48 ], [ 0, %10 ]
%40 = icmp slt i64 %39, %6
br i1 %40, label %41, label %50
41: ; preds = %38
%42 = getelementptr inbounds i32, i32* %8, i64 %39
%43 = load i32, i32* %42, align 4
%44 = icmp eq i32 %43, %15
br i1 %44, label %45, label %48
45: ; preds = %41
%46 = trunc i64 %39 to i32
%47 = getelementptr inbounds i32, i32* %8, i64 %39
store i32 %46, i32* %47, align 4
br label %48
48: ; preds = %45, %41
%49 = add nuw nsw i64 %39, 1
br label %38
50: ; preds = %38
ret i32* %8
}
declare dso_local i32* @mallocoPLT(i64) local_unnamed_addr
