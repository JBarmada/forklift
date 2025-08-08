%struct.struct0 = type { i32, i32, i32, i32 }
define dso_local i32 @func0(%struct.struct0* nocapture readonly %0, i32 %1) local_unnamed_addr {
%3 = sext i32 %1 to i64
br label %4
4: ; preds = %7, %2
%5 = phi i64 [ %19, %7 ], [ 0, %2 ]
%6 = icmp slt i64 %5, %3
%7 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %5, i32 0
%8 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %5, i32 1
%9 = bitcast i32* %7 to <4 x i32>*
%10 = load <4 x i32>, <4 x i32>* %9, align 4
%11 = insertelement <4 x i32> undef, i32 %1, i32 0
%12 = shufflevector <4 x i32> %11, <4 x i32> undef, <4 x i32> zeroinitializer
%13 = add <4 x i32> %10, %12
%14 = shufflevector <4 x i32> %13, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
%15 = add <4 x i32> %13, %14
%16 = extractelement <4 x i32> %15, i32 0
store i32 %16, i32* %7, align 4
%17 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %5, i32 2
%18 = add nuw nsw i64 %5, 1
%19 = extractelement <4 x i32> %15, i32 1
store i32 %19, i32* %8, align 4
%20 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %5, i32 3
%21 = add nuw nsw i64 %5, 1
br label %4
22: ; preds = %25, %4
%23 = phi i64 [ %30, %25 ], [ 0, %4 ]
%24 = icmp eq i64 %23, 10
br i1 %24, label %31, label %25
25: ; preds = %22
%26 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %23, i32 0
%27 = bitcast i32* %26 to <4 x i32>*
%28 = load <4 x i32>, <4 x i32>* %27, align 4
%29 = mul nsw <4 x i32> %28, %28
%30 = load i32, i32* %20, align 4
%31 = mul nsw i32 %30, %30
store i32 %31, i32* %26, align 4
%32 = add nuw nsw i64 %23, 1
br label %22
33: ; preds = %22
ret i32 %16
}
