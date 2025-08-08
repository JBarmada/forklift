%struct.struct0 = type { i32 }
define dso_local zeroext i8 @func0(%struct.struct0* %0) local_unnamed_addr {
%2 = tail call i64 @strlen(%struct.struct0* %0)
%3 = trunc i64 %2 to i32
%4 = icmp slt i32 %3, 2
br i1 %4, label %17, label %5
5: ; preds = %10, %1
%6 = phi i32 [ %16, %10 ], [ 2, %1 ]
%7 = mul nsw i32 %6, %6
%8 = icmp sgt i32 %7, %3
br i1 %8, label %17, label %9
9: ; preds = %5
%10 = urem i32 %3, %6
%11 = icmp ne i32 %10, 0
%12 = zext i1 %11 to i8
%13 = icmp eq i32 %10, 0
%14 = add nuw nsw i32 %6, 1
br i1 %13, label %17, label %5
15: ; preds = %5
%16 = trunc i32 %6 to i8
br label %17
17: ; preds = %15, %9, %1
%18 = phi i8 [ 0, %1 ], [ %12, %9 ], [ 1, %15 ]
ret i8 %18
}
declare dso_local i64 @strlen(%struct.struct0*) local_unnamed_addr
