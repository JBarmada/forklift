%struct.struct0 = type { i32 }
define dso_local signext i8 @func0(%struct.struct0* nocapture readonly %0, i32 %1) local_unnamed_addr {
%3 = sext i32 %1 to i64
br label %4
4: ; preds = %11, %2
%5 = phi i64 [ 1, %2 ], [ %10, %11 ]
%6 = icmp slt i64 %5, %3
br i1 %6, label %7, label %37
7: ; preds = %4
%8 = add nuw nsw i64 %5, 1
%9 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %5, i32 0
%10 = load i32, i32* %9, align 4
%11 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %5, i32 0
%12 = load i32, i32* %11, align 4
%13 = add nsw i32 %12, %10
br label %14
14: ; preds = %18, %7
%15 = phi i64 [ %8, %7 ], [ %16, %18 ]
%16 = add nsw i64 %15, 1
%17 = trunc i64 %16 to i32
%18 = icmp slt i32 %17, %1
br i1 %18, label %19, label %4
19: ; preds = %14
%20 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %16, i32 0
%21 = load i32, i32* %20, align 4
%22 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %16, i32 0
%23 = load i32, i32* %22, align 4
%24 = add nsw i32 %23, %21
%25 = icmp eq i32 %24, 0
%26 = trunc i64 %16 to i32
%27 = icmp slt i32 %26, %1
%28 = or i1 %25, %27
br i1 %28, label %14, label %29
29: ; preds = %19
%30 = trunc i64 %5 to i32
br label %37
31: ; preds = %4
%32 = trunc i64 %5 to i32
%33 = and i32 %32, 1
%34 = icmp eq i32 %33, 0
br i1 %34, label %37, label %35
35: ; preds = %31
%36 = trunc i64 %5 to i32
br label %37
37: ; preds = %35, %31, %29
%38 = phi i32 [ %30, %29 ], [ %36, %35 ], [ %36, %31 ]
%39 = trunc i32 %38 to i8
ret i8 %39
}
