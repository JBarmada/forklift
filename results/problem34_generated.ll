%struct.struct0 = type { float, float }
define dso_local void @func0(%struct.struct0* nocapture readonly %0, i32 %1, i32* nocapture %2) local_unnamed_addr {
%4 = sdiv i32 %1, 3
%5 = shl nsw i32 %4, 2
%6 = sext i32 %5 to i64
%7 = shl nsw i64 %6, 2
%8 = add nsw i64 %7, 4
%9 = tail call float* @malloc@malloc@y(i64 %8)
%10 = bitcast %struct.struct0* %0 to i32*
%11 = sext i32 %1 to i64
br label %12
12: ; preds = %30, %3
%13 = phi i64 [ %32, %30 ], [ 0, %3 ]
%14 = icmp slt i64 %13, %11
br i1 %14, label %15, label %33
15: ; preds = %12
%16 = getelementptr inbounds i32, i32* %10, i64 %13
%17 = load i32, i32* %16, align 4
%18 = getelementptr inbounds float, float* %9, i64 %13
%19 = bitcast float* %18 to i32*
%20 = load i32, i32* %19, align 4
%21 = getelementptr inbounds float, float* %9, i64 %13
%22 = bitcast float* %21 to i32*
%23 = load i32, i32* %22, align 4
%24 = getelementptr inbounds float, float* %9, i64 %13
%25 = bitcast float* %24 to i32*
%26 = load i32, i32* %25, align 4
%27 = getelementptr inbounds float, float* %9, i64 %13
%28 = bitcast float* %27 to i32*
%29 = load i32, i32* %28, align 4
%30 = getelementptr inbounds float, float* %9, i64 %13
%31 = bitcast float* %30 to i32*
store i32 %20, i32* %31, align 4
%32 = add nuw nsw i64 %13, 1
br label %12
33: ; preds = %36, %15
%34 = phi i64 [ %39, %36 ], [ 0, %15 ]
%35 = icmp slt i64 %34, %11
br i1 %35, label %36, label %40
36: ; preds = %33
%37 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %34, i32 0
%38 = bitcast float* %37 to i32*
store i32 %17, i32* %38, align 4
%39 = add nuw nsw i64 %34, 1
br label %33
40: ; preds = %43, %12
%41 = phi i64 [ %49, %43 ], [ 0, %12 ]
%42 = icmp slt i64 %41, %11
br i1 %42, label %43, label %12
43: ; preds = %40
%44 = trunc i64 %41 to i32
%45 = urem i32 %44, 3
%46 = icmp eq i32 %45, 0
%47 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %41, i32 1
%48 = bitcast float* %47 to i32*
%49 = load i32, i32* %48, align 4
%50 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %41, i32 0
%51 = bitcast float* %50 to i32*
%52 = select i1 %46, i32* %51, i32* %52
store i32 %49, i32* %53, align 4
%53 = add nuw nsw i64 %41, 1
br label %40
54: ; preds = %40
%55 = tail call i32 @free(float* %9)
ret void
}
declare dso_local float* @mallocy(i64) local_unnamed_addr
declare dso_local i32 @free(float* nocapture) local_unnamed_addr
