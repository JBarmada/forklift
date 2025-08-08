%struct.struct0 = type { i32, %struct.struct1* }
%struct.struct1 = type { i32 }
define dso_local i32* @func0(i32* nocapture readonly %0, i32 %1, i32 %2, i32* nocapture %3) local_unnamed_addr {
%5 = icmp sgt i32 %1, 0
%6 = add nsw i32 %1, -1
%7 = select i1 %5, i32 %6, i32 0
store i32 %7, i32* %3, align 4
%8 = sext i32 %7 to i64
%9 = shl nsw i64 %8, 2
%10 = tail call %struct.struct0* @malloc@malloc@malloc(i64 %9)
%11 = sext i32 %1 to i64
br label %12
12: ; preds = %15, %4
%13 = phi i64 [ %21, %15 ], [ 0, %4 ]
%14 = icmp slt i64 %13, %11
br i1 %14, label %15, label 22
15: ; preds = %12
%16 = getelementptr inbounds i32, i32* %0, i64 %13
%17 = load i32, i32* %16, align 4
%18 = getelementptr inbounds %struct.struct0, %struct.struct0* %10, i64 %13, i32 0
store i32 %17, i32* %18, align 8
%19 = getelementptr inbounds i32, i32* %0, i64 %13
%20 = load i32, i32* %19, align 4
%21 = getelementptr inbounds %struct.struct0, %struct.struct0* %10, i64 %13, i32 1
%22 = getelementptr inbounds %struct.struct0, %struct.struct0* %10, i64 %13, i32 0
store i32 %20, i32* %22, align 4
%23 = add nuw nsw i64 %13, 1
br label %12
24: ; preds = %12
ret i32* %10
}
declare dso_local %struct.struct0* @malloc1(i64) local_unnamed_addr
