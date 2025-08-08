%struct.struct0 = type { i32, i32 }
define dso_local void @func0(i32* nocapture readonly %0, i32 %1, %struct.struct0* nocapture %2) local_unnamed_addr {
%4 = sext i32 %1 to i64
br label %5
5: ; preds = %10, %3
%6 = phi i64 [ %15, %10 ], [ 0, %3 ]
%7 = phi i32 [ %14, %10 ], [ 1, %3 ]
%8 = phi i32 [ %13, %10 ], [ 0, %3 ]
%9 = icmp slt i64 %6, %4
br i1 %9, label %10, label %16
10: ; preds = %5
%11 = getelementptr inbounds i32, i32* %0, i64 %6
%12 = load i32, i32* %11, align 4
%13 = add i32 %12, %8
%14 = add i32 %7, 1
%15 = mul i32 %13, %14
%16 = add nuw nsw i64 %6, 1
br label %5
17: ; preds = %5
%18 = getelementptr inbounds %struct.struct0, %struct.struct0* %2, i64 0, i32 0
store i32 %8, i32* %18, align 4
%19 = getelementptr inbounds %struct.struct0, %struct.struct0* %2, i64 0, i32 1
store i32 %7, i32* %19, align 4
ret void
}
