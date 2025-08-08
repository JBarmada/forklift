@.str = external hidden unnamed_addr constant [3 x i8], align 1
@.str.1 = external hidden unnamed_addr constant [3 x i8], align 1
define dso_local i8* @func0(i32 %0, i32 %1, i32 %2, i32 %3) local_unnamed_addr {
%5 = icmp sgt i32 %0, %2
%6 = select i1 %5, i32 %0, i32 %2
%7 = icmp slt i32 %1, %3
%8 = select i1 %7, i32 %1, i32 %3
%9 = sub nsw i32 %8, %6
%10 = icmp sgt i32 %9, 1
%11 = getelementptr inbounds [3 x i8], [3 x i8]* @.str, i64 0, i64 0
br i1 %10, label %12, label %24
12: ; preds = %4
%13 = icmp ult i32 %9, 4
%14 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.1, i64 0, i64 %9
br i1 %13, label %24, label %15
15: ; preds = %19, %12
%16 = phi i32 [ %23, %19 ], [ 2, %12 ]
%17 = add nsw i32 %16, -1
%18 = urem i32 %9, %17
%19 = icmp eq i32 %18, 0
br i1 %19, label %24, label %20
20: ; preds = %15
%21 = mul nsw i32 %16, %16
%22 = icmp sgt i32 %21, %9
%23 = add nuw nsw i32 %16, 1
br i1 %22, label %24, label %15
24: ; preds = %20, %15, %12, %4
%25 = phi i8* [ %11, %4 ], [ %14, %12 ], [ %11, %15 ], [ %14, %20 ]
ret i8* %25
}
