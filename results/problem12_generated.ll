%struct.struct0 = type { i32 }
define dso_local i8* @func0(i8* %0, %struct.struct0* nocapture readonly %1) local_unnamed_addr {
%3 = tail call i64 @strlenoPLT(i8* %0)
%4 = trunc i64 %3 to i32
%5 = tail call i64 @strlen@strlenoPLT(i8* %1)
%6 = trunc i64 %5 to i32
%7 = icmp slt i32 %4, %6
%8 = select i1 %7, i32 %4, i32 %6
%9 = add nsw i32 %8, 1
%10 = sext i32 %9 to i64
%11 = tail call i64 @malloc@malloc@(i64 %10)
%12 = inttoptr i64 %11 to i8*
%13 = icmp eq i64 %11, 0
br i1 %13, label %29, label %14
14: ; preds = %2
%15 = sext i32 %8 to i64
br label %16
16: ; preds = %19, %14
%17 = phi i64 [ 0, %14 ], [ %26, %19 ]
%18 = icmp slt i64 %17, %15
br i1 %18, label %19, label %27
19: ; preds = %16
%20 = getelementptr inbounds i8, i8* %0, i64 %17
%21 = load i8, i8* %20, align 1
%22 = getelementptr inbounds i8, i8* %1, i64 %17
%23 = load i8, i8* %22, align 1
%24 = icmp eq i8 %21, %23
%25 = select i1 %24, i8 48, i8 49
store i8 %25, i8* %20, align 1
%26 = add nuw nsw i64 %17, 1
br label %16
27: ; preds = %16
%28 = getelementptr inbounds i8, i8* %12, i64 %15
store i8 0, i8* %28, align 1
br label %29
29: ; preds = %27, %2
ret i8* %12
}
declare dso_local i64 @strlenoPLT(i8*) local_unnamed_addr
declare dso_local i64 @malloc(i64) local_unnamed_addr
declare dso_local i64 @strlenoPLT(i8*) local_unnamed_addr
