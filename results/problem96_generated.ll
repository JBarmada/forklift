%struct.struct0 = type { i8* }
define dso_local i32 @func0(%struct.struct0* %0, i32 %1) local_unnamed_addr {
%3 = icmp eq i32 %1, 0
br i1 %3, label %44, label %4
4: ; preds = %2
%5 = sext i32 %1 to i64
br label %6
6: ; preds = %39, %4
%7 = phi i64 [ 0, %4 ], [ %40, %39 ]
%8 = phi i32 [ 0, %4 ], [ %41, %39 ]
%9 = phi i32 [ 0, %4 ], [ %42, %39 ]
%10 = icmp slt i64 %7, %5
br i1 %10, label %11, label %44
11: ; preds = %6
%12 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %7, i32 0
%13 = load i8*, i8** %12, align 8
%14 = load i8, i8* %13, align 1
%15 = icmp eq i8 %14, 0
br i1 %15, label %16, label %18
16: ; preds = %11
%17 = zext i8 %14 to i32
br label %44
18: ; preds = %11
%19 = tail call %struct.struct0* @__ctype_b_loc@PLT(%struct.struct0* %0)
%20 = getelementptr inbounds %struct.struct0, %struct.struct0* %19, i64 0, i32 0
%21 = load i8*, i8** %20, align 8
%22 = add i8 %14, 1
%23 = zext i8 %22 to i64
%24 = getelementptr inbounds i8, i8* %21, i64 %23
%25 = load i8, i8* %24, align 1
%26 = zext i8 %25 to i32
%27 = and i32 %26, 1024
%28 = icmp eq i32 %27, 0
br i1 %28, label %44, label %29
29: ; preds = %18
%30 = and i32 %8, 256
%31 = icmp eq i32 %30, 0
%32 = and i32 %26, 512
%33 = icmp eq i32 %32, 0
%34 = or i1 %33, %31
br i1 %34, label %35, label %39
35: ; preds = %29
%36 = and i32 %26, 512
%37 = icmp eq i32 %36, 0
br i1 %37, label %38, label %39
38: ; preds = %35
store i8 %14, i8* %24, align 1
br label %39
39: ; preds = %38, %35
%40 = phi i32 [ %8, %35 ], [ 1, %38 ]
%41 = add nuw nsw i64 %7, 1
br label %6
42: ; preds = %6
%43 = and i32 %8, 1
ret i32 %43
44: ; preds = %18, %16, %2
ret i32 0
}
declare dso_local %struct.struct0* @__ctype_b_loc@PLT(%struct.struct0*) local_unnamed_addr
