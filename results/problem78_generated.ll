%struct.struct0 = type { i32 }
define dso_local i32 @func0(%struct.struct0* %0) local_unnamed_addr {
%2 = ptrtoint %struct.struct0* %0 to i64
%3 = trunc i64 %2 to i32
%4 = icmp slt i32 %3, 0
%5 = sub nsw i32 0, %3
%6 = select i1 %4, i32 %5, i32 %3
br label %7
7: ; preds = %7, %1
%8 = phi i32 [ 0, %1 ], [ %12, %7 ]
%9 = mul i32 %8, %8
%10 = mul i32 %9, %8
%11 = icmp ult i32 %10, %6
%12 = add i32 %8, 1
br i1 %11, label %7, label %13
13: ; preds = %7
%14 = icmp ule i32 %10, %6
%15 = zext i1 %14 to i32
ret i32 %15
}
