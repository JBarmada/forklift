%struct.struct0 = type { %struct.struct0** }
define dso_local i32 @func0(%struct.struct0** nocapture readonly %0, i32 %1, i8* %2, %struct.struct0** nocapture %3) local_unnamed_addr {
%5 = tail call i64 @strlen@strlen@strlen@PLT(i8* %2)
%6 = sext i32 %1 to i64
%7 = shl nsw i64 %6, 3
%8 = tail call %struct.struct0* @malloc@malloc@malloc@PLT(i64 %7)
store %struct.struct0* %8, %struct.struct0** %3, align 8
%9 = getelementptr inbounds %struct.struct0, %struct.struct0* %8, i64 0, i32 0
store %struct.struct0** %9, %struct.struct0*** %0, align 8
%10 = shl i64 %5, 32
%11 = ashr exact i64 %10, 32
br label %12
12: ; preds = %30, %4
%13 = phi i64 [ %31, %30 ], [ 0, %4 ]
%14 = icmp slt i64 %13, %6
br i1 %14, label %16, label %15
15: ; preds = %12
ret i32 %1
16: ; preds = %12
%17 = getelementptr inbounds %struct.struct0*, %struct.struct0** %0, i64 %13
%18 = load %struct.struct0*, %struct.struct0** %17, align 8
%19 = tail call i32 @strncmp(%struct.struct0* %18, i8* %2, i64 %5)
%20 = icmp eq i32 %19, 0
br i1 %20, label %21, label %30
21: ; preds = %16
%22 = getelementptr inbounds %struct.struct0*, %struct.struct0** %0, i64 %13
%23 = bitcast %struct.struct0** %22 to i64*
%24 = load i64, i64* %23, align 8
%25 = sext i32 %1 to i64
%26 = getelementptr inbounds %struct.struct0*, %struct.struct0** %0, i64 %25
%27 = bitcast %struct.struct0** %26 to i64*
store i64 %24, i64* %27, align 8
%28 = trunc i64 %5 to i32
%29 = add i32 %28, 1
br label %30
30: ; preds = %21, %16
%31 = phi i32 [ %29, %21 ], [ 0, %16 ]
%32 = add nuw nsw i64 %13, 1
br label %12
}
declare dso_local i64 @strlen5(i8*) local_unnamed_addr
declare dso_local %struct.struct0* @mallocPLT(i64) local_unnamed_addr
declare dso_local i32 @strncmp(%struct.struct0*, i8*, i64) local_unnamed_addr
