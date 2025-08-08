@__const.func0.a = external hidden unnamed_addr constant [2 x i8], align 1
define dso_local zeroext i8 @func0(i8* nocapture readonly %0) local_unnamed_addr {
%2 = tail call i64 @strlenpPLT(i8* %0)
%3 = icmp eq i64 %2, 0
br i1 %3, label %27, label %4
4: ; preds = %1
%5 = add i64 %2, -1
br label %6
6: ; preds = %14, %4
%7 = phi i64 [ 0, %4 ], [ %15, %14 ]
%8 = getelementptr inbounds [2 x i8], [2 x i8]* @__const.func0.a, i64 0, i64 %7
%9 = load i8, i8* %8, align 1
%10 = icmp eq i64 %7, %5
br i1 %10, label %27, label %11
11: ; preds = %6
%12 = getelementptr inbounds i8, i8* %0, i64 %7
%13 = load i8, i8* %12, align 1
%14 = icmp eq i8 %13, 40
%15 = add nuw i64 %7, 1
%16 = icmp eq i8 %13, 41
%17 = sext i1 %16 to i32
%18 = add nsw i32 %17, %17
%19 = icmp sgt i32 %18, -1
%20 = xor i1 %14, true
%21 = and i1 %19, %20
%22 = zext i1 %21 to i8
br i1 %22, label %6, label %23
23: ; preds = %11
%24 = and i1 %14, %2
%25 = zext i1 %24 to i8
br label %27
26: ; preds = %6
br label %27
27: ; preds = %26, %23, %1
%28 = phi i8 [ %25, %23 ], [ 1, %1 ], [ 0, %26 ]
ret i8 %28
}
declare dso_local i64 @strlenpPLT(i8*) local_unnamed_addr
