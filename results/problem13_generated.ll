@.str = external hidden unnamed_addr constant [1 x i8], align 1
define dso_local i8* @func0(i8** nocapture readonly %0, i32 %1) local_unnamed_addr {
%3 = sext i32 %1 to i64
br label %4
4: ; preds = %10, %2
%5 = phi i64 [ %18, %10 ], [ 0, %2 ]
%6 = phi i32 [ %17, %10 ], [ 0, %2 ]
%7 = phi i8* [ %19, %10 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i64 0, i64 0), %2 ]
%8 = icmp slt i64 %5, %3
br i1 %8, label %10, label %9
9: ; preds = %4
ret i8* %7
10: ; preds = %4
%11 = getelementptr inbounds i8*, i8** %0, i64 %5
%12 = load i8*, i8** %11, align 8
%13 = tail call i32 @strlendefPLT(i8* %12)
%14 = icmp sgt i32 %6, %13
%15 = select i1 %14, i32 %6, i32 %13
%16 = select i1 %14, i8* %12, i8* %7
%17 = add nuw nsw i64 %5, 1
br label %4
}
declare dso_local i32 @strlendefPLT(i8*) local_unnamed_addr
