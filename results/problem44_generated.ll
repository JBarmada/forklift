@restore = external dso_local local_unnamed_addr global i32, align 4
define dso_local signext i8 @func0(i32* nocapture readonly %0, i32 %1) local_unnamed_addr {
%3 = sext i32 %1 to i64
br label %4
4: ; preds = %22, %2
%5 = phi i64 [ %23, %22 ], [ 0, %2 ]
%6 = phi i32 [ %10, %22 ], [ 1, %2 ]
%7 = icmp slt i64 %5, %3
br i1 %7, label %8, label %24
8: ; preds = %4
%9 = getelementptr inbounds i32, i32* %0, i64 %5
%10 = load i32, i32* %9, align 4
%11 = add nsw i32 %6, 1
%12 = zext i32 %11 to i64
br label %13
13: ; preds = %16, %8
%14 = phi i64 [ %21, %16 ], [ %5, %8 ]
%15 = icmp eq i64 %14, %12
br i1 %15, label %22, label %16
16: ; preds = %13
%17 = getelementptr inbounds i32, i32* %0, i64 %14
%18 = load i32, i32* %17, align 4
%19 = sub nsw i32 0, %18
%20 = icmp eq i32 %19, %10
%21 = add nuw nsw i64 %14, 1
br i1 %20, label %24, label %13
22: ; preds = %13
%23 = add nuw nsw i64 %5, 1
br label %4
24: ; preds = %16, %4
%25 = trunc i64 %5 to i8
%26 = and i8 %25, 1
ret i8 %26
}
