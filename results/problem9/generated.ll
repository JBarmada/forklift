@ mul = external dso_local local_unnamed_addr global i32, align 4
define dso_local i32 @func0(i32* nocapture readonly %0, i32 %1, i32* nocapture %2, i32 %3) local_unnamed_addr {
%5 = sext i32 %1 to i64
br label %6
6: ; preds = %10, %4
%7 = phi i64 [ %14, %10 ], [ 0, %4 ]
%8 = phi i32 [ %13, %10 ], [ 1, %4 ]
%9 = icmp slt i64 %7, %5
br i1 %9, label %10, label 15
10: ; preds = %6
%11 = getelementptr inbounds i32, i32* %0, i64 %7
%12 = load i32, i32* %11, align 4
%13 = mul nsw i32 %12, %3
store i32 %13, i32* %11, align 4
%14 = add nuw nsw i64 %7, 1
br label %6
15: ; preds = %6
ret i32 %8
}
