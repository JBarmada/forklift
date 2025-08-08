%struct.struct0 = type { i32 }
define dso_local %struct.struct0* @func0(i32 %0) local_unnamed_addr {
%2 = sext i32 %0 to i64
%3 = shl nsw i64 %2, 2
%4 = tail call %struct.struct0* @malloc@malloc@malloc(i64 %3)
br label %5
5: ; preds = %14, %1
%6 = phi i64 [ %22, %14 ], [ 0, %1 ]
%7 = phi i32 [ %20, %14 ], [ 0, %1 ]
%8 = phi i32 [ %21, %14 ], [ 1, %1 ]
%9 = icmp slt i64 %6, %2
br i1 %9, label %10, label %23
10: ; preds = %5
%11 = and i64 %6, 1
%12 = icmp eq i64 %11, 0
br i1 %12, label %14, label %13
13: ; preds = %10
ret %struct.struct0* %4
14: ; preds = %10
%15 = trunc i64 %6 to i32
%16 = shl nuw nsw i32 %15, 1
%17 = and i32 %16, 1
%18 = icmp eq i32 %17, 0
%19 = mul nsw i32 %8, %7
%20 = select i1 %18, i32 %19, i32 %16
%21 = getelementptr inbounds %struct.struct0, %struct.struct0* %4, i64 %6, i32 0
store i32 %20, i32* %21, align 4
%22 = add nuw nsw i64 %6, 1
br label %5
23: ; preds = %5
ret %struct.struct0* %4
}
declare dso_local %struct.struct0* @malloc(i64) local_unnamed_addr
