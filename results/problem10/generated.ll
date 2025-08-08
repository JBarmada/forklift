%struct.struct0 = type { i32 }
define dso_local %struct.struct0* @func0(i32* nocapture readonly %0, i32 %1) local_unnamed_addr {
%3 = icmp slt i32 %1, 1
br i1 %3, label %22, label 4
4: ; preds = %2
%5 = zext i32 %1 to i64
%6 = shl nuw nsw i64 %5, 2
%7 = tail call %struct.struct0* @malloc@mallocpPLT(i64 %6)
%8 = icmp eq %struct.struct0* %7, null
br i1 %8, label %22, label 9
9: ; preds = %4
%10 = load i32, i32* %0, align 4
%11 = getelementptr inbounds %struct.struct0, %struct.struct0* %7, i64 0, i32 0
store i32 %10, i32* %11, align 4
br label %12
12: ; preds = %16, %9
%13 = phi i32 [ %10, %9 ], [ %19, %16 ]
%14 = phi i64 [ 0, %9 ], [ %21, %16 ]
%15 = icmp eq i64 %14, %5
br i1 %15, label %22, label 16
16: ; preds = %12
%17 = getelementptr inbounds i32, i32* %0, i64 %14
%18 = load i32, i32* %17, align 4
%19 = icmp sgt i32 %18, %13
%20 = select i1 %19, i32 %18, i32 %13
%21 = getelementptr inbounds %struct.struct0, %struct.struct0* %7, i64 %14, i32 0
store i32 %20, i32* %21, align 4
%22 = add nuw nsw i64 %14, 1
br label %12
23: ; preds = %12, %4, %2
%24 = phi %struct.struct0* [ null, %2 ], [ null, %4 ], [ %7, %12 ]
ret %struct.struct0* %24
}
declare dso_local %struct.struct0* @mallocpPLT(i64) local_unnamed_addr
