@.str = external hidden unnamed_addr constant [12 x i8], align 1
define dso_local i8** @func0(i8* %0, i32 %1, i32* nocapture %2) local_unnamed_addr {
%4 = tail call i64 @strlen@strlen5PLT(i8* %0)
%5 = add nsw i64 %4, 1
%6 = tail call i8* @malloc@malloc@malloc@PLT(i64 %5)
%7 = tail call i8* @__ctype_b_loc@PLT(i8* %6)
br label %8
8: ; preds = %48, %3
%9 = phi i64 [ %50, %48 ], [ 0, %3 ]
%10 = phi i32 [ %49, %48 ], [ 0, %3 ]
%11 = phi i8 [ %51, %48 ], [ 0, %3 ]
%12 = phi i8 [ %52, %48 ], [ 0, %3 ]
br label %13
13: ; preds = %44, %8
%14 = phi i64 [ %9, %8 ], [ %45, %44 ]
%15 = icmp eq i64 %14, 0
br i1 %15, label %53, label %16
16: ; preds = %13
%17 = getelementptr inbounds i8, i8* %0, i64 %14
%18 = load i8, i8* %17, align 1
%19 = icmp eq i8 %18, 0
br i1 %19, label %44, label %20
20: ; preds = %16
%21 = load i8*, i8** %7, align 8
%22 = sext i8 %18 to i64
%23 = getelementptr inbounds i8, i8* %21, i64 %22
%24 = load i8, i8* %23, align 1
%25 = zext i8 %24 to i32
%26 = and i32 %25, 8192
%27 = icmp eq i32 %26, 0
br i1 %27, label %28, label %44
28: ; preds = %20
%29 = trunc i64 %14 to i32
%30 = sub nsw i32 %29, %10
%31 = sext i32 %30 to i64
%32 = getelementptr inbounds i8, i8* %6, i64 %31
store i8 %18, i8* %32, align 1
%33 = getelementptr inbounds i8, i8* %7, i64 1
%34 = load i8, i8* %33, align 1
%35 = zext i8 %34 to i32
%36 = shl nuw nsw i32 1, %35
%37 = and i32 %36, %34
%38 = icmp eq i32 %37, 0
%39 = zext i1 %38 to i8
%40 = add nuw nsw i8 %12, %39
br label %48
41: ; preds = %16
%42 = icmp eq i32 %10, %1
br i1 %42, label %43, label %44
43: ; preds = %41, %28
br label %13
44: ; preds = %41, %20
%45 = phi i8 [ %40, %41 ], [ %11, %20 ]
%46 = phi i8 [ %47, %41 ], [ %12, %20 ]
%47 = add nuw nsw i64 %14, 1
%48 = getelementptr inbounds i8, i8* %6, i64 %14
store i8 %46, i8* %48, align 1
br label %8
49: ; preds = %13
%50 = trunc i64 %14 to i32
%51 = icmp eq i32 %50, %1
br i1 %51, label %52, label %54
52: ; preds = %49
%53 = tail call i32 @free(i8* %6)
br label %54
54: ; preds = %52, %16
%55 = getelementptr inbounds i8*, i8** %7, i64 %14
%56 = bitcast i8** %55 to i32*
store i32 %1, i32* %2, align 4
ret i8** %7
}
declare dso_local i64 @strlen5PLT(i8*) local_unnamed_addr
declare dso_local i8* @mallocPLT(i64) local_unnamed_addr
declare dso_local i8* @malloc_(i64) local_unnamed_addr
declare dso_local i8* @__ctype_b_loc@PLT(i8*) local_unnamed_addr
declare dso_local i32 @free(i8* nocapture) local_unnamed_addr
