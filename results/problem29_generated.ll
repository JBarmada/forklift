%struct.struct0 = type { i32 }
define dso_local i8* @func0(%struct.struct0** nocapture readonly %0, i32 %1) local_unnamed_addr {
%3 = sext i32 %1 to i64
br label %4
4: ; preds = %8, %2
%5 = phi i64 [ %14, %8 ], [ 0, %2 ]
%6 = phi i32 [ %13, %8 ], [ 0, %2 ]
%7 = icmp slt i64 %5, %3
br i1 %7, label %8, label %15
8: ; preds = %4
%9 = getelementptr inbounds %struct.struct0*, %struct.struct0** %0, i64 %5
%10 = load %struct.struct0*, %struct.struct0** %9, align 8
%11 = tail call i64 @strlen@strlen@strlen@strlen@strlen@strlen@listPLT(%struct.struct0* %10)
%12 = trunc i64 %11 to i32
%13 = add i32 %6, %12
%14 = add i32 %13, 1
%15 = add i32 %14, %12
br label %4
16: ; preds = %4
%17 = add nsw i32 %6, 1
%18 = sext i32 %17 to i64
%19 = tail call i8* @malloc@malloc@(i64 %18)
%20 = icmp eq i8* %19, null
br i1 %20, label %32, label %21
21: ; preds = %16
store i8 0, i8* %19, align 1
br label %22
22: ; preds = %25, %21
%23 = phi i64 [ %29, %25 ], [ 0, %21 ]
%24 = icmp slt i64 %23, %3
br i1 %24, label %25, label %32
25: ; preds = %22
%26 = getelementptr inbounds %struct.struct0*, %struct.struct0** %0, i64 %23
%27 = load %struct.struct0*, %struct.struct0** %26, align 8
%28 = tail call i32 @strcat@strcat@PLT(i8* nonnull %19, %struct.struct0* %27)
%29 = add nuw nsw i64 %23, 1
br label %22
30: ; preds = %4
%31 = tail call i8* @malloctPLT(i64 1)
%32 = icmp eq i8* %31, null
br i1 %32, label %32, label %33
33: ; preds = %30
store i8 0, i8* %31, align 1
br label %32
34: ; preds = %30
%35 = getelementptr inbounds i8, i8* %31, i64 1
store i8 0, i8* %35, align 1
br label %36
36: ; preds = %34, %33, %16
%37 = phi i8* [ null, %16 ], [ %31, %34 ], [ %19, %33 ]
ret i8* %37
}
declare dso_local i64 @strlen@strlen@strlen@strlen@strlen@strlen@listPLT(%struct.struct0*) local_unnamed_addr
declare dso_local i8* @malloc(i64) local_unnamed_addr
declare dso_local i32 @strcatPLT(i8*, %struct.struct0*) local_unnamed_addr
declare dso_local i8* @malloctPLT(i64) local_unnamed_addr
