%struct.struct0 = type { i32 }
define dso_local i8** @func0(i8** nocapture readonly %0, i32 %1, %struct.struct0* %2, i32* nocapture %3) local_unnamed_addr {
%5 = sext i32 %1 to i64
br label %6
6: ; preds = %29, %4
%7 = phi i64 [ %31, %29 ], [ 0, %4 ]
%8 = phi i8** [ %30, %29 ], [ null, %4 ]
%9 = phi i32 [ %32, %29 ], [ 0, %4 ]
%10 = phi i32 [ %33, %29 ], [ 0, %4 ]
%11 = icmp slt i64 %7, %5
br i1 %11, label %13, label 12
12: ; preds = %6
store i32 %9, i32* %3, align 4
ret i8** %8
13: ; preds = %6
%14 = getelementptr inbounds i8*, i8** %0, i64 %7
%15 = load i8*, i8** %14, align 8
%16 = tail call i64 @strstr@, i8* %15)
%17 = icmp eq i64 %16, 0
br i1 %17, label %29, label 18
18: ; preds = %13
%19 = add nsw i32 %10, 1
%20 = sext i32 %19 to i64
%21 = shl nsw i64 %20, 3
%22 = add nsw i64 %21, 8
%23 = tail call i8** @realloc5PLT(i8** %8, i64 %22)
%24 = bitcast i8** %14 to i64*
%25 = load i64, i64* %24, align 8
%26 = zext i32 %10 to i64
%27 = getelementptr inbounds i8*, i8** %23, i64 %26
%28 = bitcast i8** %27 to i64*
store i64 %25, i64* %28, align 8
br label %29
29: ; preds = %18, %13
%30 = phi i8** [ %23, %18 ], [ %8, %13 ]
%31 = phi i32 [ %19, %18 ], [ %9, %13 ]
%32 = phi i32 [ %10, %18 ], [ %10, %13 ]
%33 = add nuw nsw i64 %7, 1
br label %6
}
declare dso_local i64 @strstr@reallocPLT(i8**, i64) local_unnamed_addr
declare dso_local i8** @realloc5PLT(i8**, i64) local_unnamed_addr
