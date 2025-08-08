@.str = external hidden unnamed_addr constant [5 x i8], align 1
@.str.1 = external hidden unnamed_addr constant [5 x i8], align 1
define dso_local i8* @func0(i32* nocapture readonly %0, i32 %1, i32* nocapture readonly %2, i32 %3) local_unnamed_addr {
%5 = sext i32 %1 to i64
br label %6
6: ; preds = %10, %4
%7 = phi i64 [ %16, %10 ], [ 0, %4 ]
%8 = phi i32 [ %15, %10 ], [ 0, %4 ]
%9 = icmp slt i64 %7, %5
br i1 %9, label %10, label %17
10: ; preds = %6
%11 = getelementptr inbounds i32, i32* %0, i64 %7
%12 = load i32, i32* %11, align 4
%13 = and i32 %12, 1
%14 = xor i32 %13, 1
%15 = add nuw nsw i32 %14, %8
%16 = add nuw nsw i64 %7, 1
br label %6
17: ; preds = %20, %6
%18 = phi i64 [ %26, %20 ], [ 0, %6 ]
%19 = phi i32 [ %25, %20 ], [ %8, %6 ]
%20 = icmp slt i64 %18, %5
br i1 %20, label %20, label %27
21: ; preds = %17
%22 = getelementptr inbounds i32, i32* %2, i64 %18
%23 = load i32, i32* %22, align 4
%24 = and i32 %23, 1
%25 = xor i32 %24, 1
%26 = add i32 %25, %19
%27 = add nuw nsw i64 %18, 1
br label %17
28: ; preds = %17
%29 = icmp slt i32 %19, %3
%30 = getelementptr i8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i64 %5
%31 = select i1 %29, i8* %30, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0)
ret i8* %31
}
