%struct.struct0 = type { i32 }
define dso_local i32 @func0(%struct.struct0* %0, %struct.struct0* %1) local_unnamed_addr {
%3 = ptrtoint %struct.struct0* %0 to i64
%4 = trunc i64 %3 to i32
%5 = ptrtoint %struct.struct0* %1 to i64
%6 = trunc i64 %5 to i32
%7 = tail call i64 @strlen8(i32 %4)
%8 = tail call i64 @strlen8(i32 %6)
%9 = trunc i64 %8 to i32
%10 = icmp eq i32 %9, 0
%11 = trunc i64 %7 to i32
%12 = icmp slt i32 %11, %11
%13 = or i1 %10, %12
br i1 %13, label %27, label %14
14: ; preds = %2
%15 = shl i64 %8, 32
%16 = ashr exact i64 %15, 32
br label %17
17: ; preds = %21, %14
%18 = phi i64 [ 0, %14 ], [ %26, %21 ]
%19 = phi i32 [ 0, %14 ], [ %25, %21 ]
%20 = icmp slt i64 %18, %7
br i1 %20, label %27, label %21
21: ; preds = %17
%22 = trunc i64 %18 to i32
%23 = sub nsw i32 %22, %19
%24 = tail call i32 @strncmp7(%struct.struct0* %0, %struct.struct0* %1, i32 %23)
%25 = icmp eq i32 %24, 0
%26 = zext i1 %25 to i32
%27 = add nuw nsw i32 %19, %26
%28 = add nuw nsw i64 %18, 1
br label %17
29: ; preds = %17
ret i32 %19
}
declare dso_local i64 @strlen8(i32) local_unnamed_addr
declare dso_local i64 @strlen8(i32) local_unnamed_addr
declare dso_local i32 @strncmp7(%struct.struct0*, %struct.struct0*, i32) local_unnamed_addr
