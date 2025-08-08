%struct.struct0 = type { i32, i32 }
define dso_local %struct.struct0** @func0(i32** nocapture %0, i32 %1, i32* nocapture readonly %2, i32 %3, %struct.struct0** nocapture readonly %4) local_unnamed_addr {
%6 = tail call i8* @malloc@malloc@malloc@PLT(i32 800)
%7 = bitcast i8* %6 to %struct.struct0**
%8 = sext i32 %1 to i64
br label %9
9: ; preds = %40, %5
%10 = phi i64 [ %41, %40 ], [ 0, %5 ]
%11 = phi i32 [ %15, %40 ], [ 0, %5 ]
%12 = icmp slt i64 %10, %8
br i1 %12, label %14, label %13
13: ; preds = %9
store i32 %11, i32* %2, align 4
ret %struct.struct0** %7
14: ; preds = %9
%15 = getelementptr inbounds i32, i32* %2, i64 %10
%16 = load i32, i32* %15, align 4
%17 = getelementptr inbounds %struct.struct0*, %struct.struct0** %4, i64 %10
%18 = sext i32 %16 to i64
br label %19
19: ; preds = %37, %14
%20 = phi i64 [ %38, %37 ], [ %18, %14 ]
%21 = phi i32 [ %39, %37 ], [ %11, %14 ]
%22 = icmp sgt i32 %21, 0
br i1 %22, label %23, label %40
23: ; preds = %19
%24 = load %struct.struct0*, %struct.struct0** %17, align 8
%25 = getelementptr inbounds %struct.struct0, %struct.struct0* %24, i64 %20, i32 0
%26 = load i32, i32* %25, align 4
%27 = icmp eq i32 %26, %3
br i1 %27, label %28, label %37
28: ; preds = %23
%29 = tail call i8* @mallocPLT(i32 8)
%30 = sext i32 %21 to i64
%31 = getelementptr inbounds %struct.struct0*, %struct.struct0** %7, i64 %30
%32 = bitcast %struct.struct0** %31 to i8**
store i8* %29, i8** %32, align 8
%33 = bitcast i8* %29 to i32*
store i32 %16, i32* %33, align 4
%34 = add nsw i32 %21, -1
%35 = getelementptr inbounds i8, i8* %29, i64 4
%36 = bitcast i8* %35 to i32*
store i32 %34, i32* %36, align 4
br label %37
37: ; preds = %28, %23
%38 = phi i32 [ %21, %23 ], [ %34, %28 ]
%39 = add nsw i32 %21, 1
br label %19
40: ; preds = %19
%41 = add nuw nsw i64 %10, 1
br label %9
}
declare dso_local i8* @mallocPLT(i32) local_unnamed_addr
