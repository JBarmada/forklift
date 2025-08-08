@.str = external hidden unnamed_addr constant [3 x i8], align 1
define dso_local i8* @func0(i32 %0, i32 %1) local_unnamed_addr {
%3 = alloca [50 x i8], align 16
%4 = getelementptr inbounds [50 x i8], [50 x i8]* %3, i64 0, i64 0
call void @llvm.lifetime.start.p0i8(i64 50, i8* nonnull %4)
%5 = getelementptr inbounds [50 x i8], [50 x i8]* %3, i64 0, i64 0
%6 = load i8, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), align 1
%7 = zext i32 %0 to i64
%8 = getelementptr inbounds [50 x i8], [50 x i8]* %3, i64 0, i64 %7
%9 = call i32 (i8*, i8*, ...) @sprintfpPLT(i8* nonnull %5, i8* nonnull %8, i32 %0)
%10 = call i32 @strlenpPLT(i8* nonnull %5)
%11 = icmp slt i32 %10, %1
br i1 %11, label %12, label %25
12: ; preds = %2
%13 = sdiv i32 %10, 2
%14 = sext i32 %13 to i64
br label %15
15: ; preds = %18, %12
%16 = phi i64 [ %24, %18 ], [ 0, %12 ]
%17 = icmp slt i64 %16, %14
br i1 %17, label %18, label %25
18: ; preds = %15
%19 = getelementptr inbounds [50 x i8], [50 x i8]* %3, i64 0, i64 %16
%20 = load i8, i8* %19, align 1
%21 = xor i64 %16, -1
%22 = add i64 %16, %21
%23 = getelementptr inbounds [50 x i8], [50 x i8]* %3, i64 0, i64 %22
%24 = load i8, i8* %23, align 1
store i8 %24, i8* %19, align 1
store i8 %20, i8* %23, align 1
%25 = add nuw nsw i64 %16, 1
br label %15
26: ; preds = %15, %2
call void @llvm.lifetime.end.p0i8(i64 50, i8* nonnull %4)
ret i8* %5
}
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture)
declare dso_local i32 @sprintfpPLT(i8* nocapture, i8* nocapture readonly, ...) local_unnamed_addr
declare dso_local i32 @strlenpPLT(i8*) local_unnamed_addr
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture)
