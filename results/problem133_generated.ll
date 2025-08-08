%struct.struct0 = type { i8 }
define dso_local i32 @func0(%struct.struct0* %0) local_unnamed_addr {
%2 = tail call i64 @strlenpPLT(%struct.struct0* %0)
%3 = icmp eq i64 %2, 0
br i1 %3, label %36, label %4
4: ; preds = %1
%5 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 0, i32 0
%6 = load i8, i8* %5, align 1
%7 = icmp eq i8 %6, 91
%8 = zext i1 %7 to i32
%9 = icmp eq i8 %6, 93
%10 = sext i1 %9 to i32
%11 = add nsw i32 %8, %10
%12 = select i1 %7, i32 0, i32 %11
%13 = select i1 %7, i32 %12, i32 0
br label %14
14: ; preds = %20, %4
%15 = phi i32 [ %13, %4 ], [ %32, %20 ]
%16 = phi i32 [ %13, %4 ], [ %33, %20 ]
%17 = phi i64 [ 0, %4 ], [ %34, %20 ]
%18 = icmp eq i64 %17, %2
br i1 %18, label %35, label %19
19: ; preds = %14
%20 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %17, i32 0
%21 = load i8, i8* %20, align 1
%22 = icmp eq i8 %21, 91
%23 = zext i1 %22 to i32
%24 = add nsw i32 %15, %23
%25 = icmp sgt i32 %24, 0
%26 = icmp eq i8 %21, 93
%27 = sext i1 %26 to i32
%28 = add nsw i32 %24, %27
%29 = icmp sgt i32 %28, %16
%30 = select i1 %29, i32 %28, i32 0
%31 = icmp sgt i32 %30, %15
%32 = select i1 %31, i32 %30, i32 %16
%33 = add nsw i64 %17, 1
br i1 %31, label %14, label %35
34: ; preds = %14
%35 = icmp ugt i64 %2, %17
%36 = zext i1 %35 to i32
br label %37
37: ; preds = %34, %19, %1
%38 = phi i32 [ %36, %34 ], [ 0, %1 ], [ 0, %19 ]
ret i32 %38
}
declare dso_local i64 @strlenpPLT(%struct.struct0*) local_unnamed_addr
