%struct.struct0 = type { i8 }
define dso_local signext i8 @func0(%struct.struct0* nocapture readonly %0) local_unnamed_addr {
%2 = tail call i32 @strlenpPLT(%struct.struct0* %0)
%3 = icmp slt i32 %2, 2
br i1 %3, label %24, label %4
4: ; preds = %1
%5 = trunc i32 %2 to i8
%6 = add nsw i32 %2, -1
%7 = sext i32 %6 to i64
%8 = zext i32 %2 to i64
br label %9
9: ; preds = %19, %4
%10 = phi i64 [ 0, %4 ], [ %23, %19 ]
%11 = phi i64 [ %7, %4 ], [ %22, %19 ]
%12 = icmp eq i64 %10, %8
br i1 %12, label %24, label %13
13: ; preds = %9
%14 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %10, i32 0
%15 = load i8, i8* %14, align 1
%16 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %11, i32 0
%17 = load i8, i8* %16, align 1
%18 = icmp eq i8 %15, %17
br i1 %18, label %19, label %24
19: ; preds = %13
%20 = icmp ult i64 %11, %10
%21 = zext i1 %20 to i8
%22 = add i64 %11, %21
%23 = add nuw nsw i64 %10, 1
br label %9
24: ; preds = %13, %9, %1
%25 = phi i8 [ 1, %1 ], [ 0, %9 ], [ %15, %13 ]
ret i8 %25
}
declare dso_local i32 @strlenpPLT(%struct.struct0*) local_unnamed_addr
