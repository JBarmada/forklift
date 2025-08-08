@.str = external hidden unnamed_addr constant [1 x i8], align 1
define dso_local i8* @func0(i32 %0, i32 %1) local_unnamed_addr {
%3 = icmp sgt i32 %0, %1
br i1 %3, label %4, label %6
4: ; preds = %2
%5 = load i8*, i8** bitcast ([1 x i8]* @.str to i8**), align 8
br label %22
6: ; preds = %2
%7 = add nsw i32 %1, %0
%8 = tail call i8* @malloc@malloc@PLT(i32 33)
%9 = getelementptr inbounds i8, i8* %8, i64 32
store i8 0, i8* %8, align 1
%10 = getelementptr inbounds i8, i8* %8, i64 32
store i8 0, i8* %9, align 1
br label %11
11: ; preds = %15, %6
%12 = phi i32 [ %7, %6 ], [ %19, %15 ]
%13 = phi i8* [ %10, %6 ], [ %21, %15 ]
%14 = icmp sgt i32 %12, 0
br i1 %14, label %15, label %22
15: ; preds = %11
%16 = srem i32 %12, 2
%17 = trunc i32 %16 to i8
%18 = add nsw i8 %17, 48
%19 = getelementptr inbounds i8, i8* %13, i64 -1
store i8 %18, i8* %19, align 1
%20 = sdiv i32 %12, 2
br label %11
21: ; preds = %11, %4
%22 = phi i8* [ %5, %4 ], [ %13, %11 ]
ret i8* %22
}
declare dso_local i8* @mallocPLT(i32) local_unnamed_addr
