%struct.struct0 = type { i32 }
define dso_local i8** @func0(i8** nocapture readonly %0, i32 %1, %struct.struct0* %2, i32* nocapture %3) local_unnamed_addr {
%5 = sext i32 %1 to i64
br label %6
6: ; preds = %29, %4
%7 = phi i64 [ %31, %29 ], [ 0, %4 ]
%8 = phi i8** [ %30, %29 ], [ null, %4 ]
%9 = phi i32 [ %32, %29 ], [ 0, %4 ]
%10 = icmp slt i64 %7, %5
br i1 %10, label %12, label %11
11: ; preds = %6
store i32 %9, i32* %3, align 4
ret i8** %8
12: ; preds = %6
%13 = getelementptr inbounds i8*, i8** %0, i64 %7
%14 = load i8*, i8** %13, align 8
%15 = tail call i64 @strstr@PLT(i8* %14, %struct.struct0* %2)
%16 = icmp eq i64 %15, 0
br i1 %16, label %29, label %17
17: ; preds = %12
%18 = add nsw i32 %9, 1
%19 = sext i32 %18 to i64
%20 = shl nsw i64 %19, 3
%21 = add nsw i64 %20, 8
%22 = tail call i64 @reallocdefPLT(i8** %8, i64 %21)
%23 = inttoptr i64 %22 to i8**
%24 = bitcast i8** %13 to i64*
%25 = load i64, i64* %24, align 8
%26 = sext i32 %9 to i64
%27 = getelementptr inbounds i8*, i8** %23, i64 %26
%28 = bitcast i8** %27 to i64*
store i64 %25, i64* %28, align 8
br label %29
29: ; preds = %17, %12
%30 = phi i8** [ %23, %17 ], [ %8, %12 ]
%31 = phi i32 [ %18, %17 ], [ %9, %12 ]
%32 = add nuw nsw i64 %7, 1
br label %6
}
declare dso_local i64 @strstrPLT(i8*, %struct.struct0*) local_unnamed_addr
declare dso_local i64 @reallocdefPLT(i8**, i64) local_unnamed_addr
