%struct.struct0 = type { i32 }
define dso_local %struct.struct0* @func0(i32 %0) local_unnamed_addr {
%2 = sext i32 %0 to i64
%3 = shl nsw i64 %2, 2
%4 = tail call %struct.struct0* @malloc@malloc@malloc@PLT(i64 %3)
%5 = getelementptr inbounds %struct.struct0, %struct.struct0* %4, i64 0, i32 0
store i32 %0, i32* %5, align 4
br label %6
6: ; preds = %10, %1
%7 = phi i64 [ %14, %10 ], [ 1, %1 ]
%8 = icmp slt i64 %7, %2
br i1 %8, label %10, label %9
9: ; preds = %6
ret %struct.struct0* %4
10: ; preds = %6
%11 = add nsw i64 %7, -1
%12 = getelementptr inbounds %struct.struct0, %struct.struct0* %4, i64 %11, i32 0
%13 = load i32, i32* %12, align 4
%14 = getelementptr inbounds %struct.struct0, %struct.struct0* %4, i64 %7, i32 0
store i32 %13, i32* %14, align 4
%15 = add nuw nsw i64 %7, 1
br label %6
}
declare dso_local %struct.struct0* @mallocPLT(i64) local_unnamed_addr
