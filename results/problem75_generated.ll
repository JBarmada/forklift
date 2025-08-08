%struct.struct0 = type { i32 }
define dso_local %struct.struct0* @func0(%struct.struct0* readnone %0, i32 %1, %struct.struct0** readonly %2, i32 %3) local_unnamed_addr {
%5 = sext i32 %1 to i64
br label %6
6: ; preds = %10, %4
%7 = phi i64 [ %16, %10 ], [ 0, %4 ]
%8 = phi i32 [ %15, %10 ], [ 0, %4 ]
%9 = icmp slt i64 %7, %5
br i1 %9, label %10, label %17
10: ; preds = %6
%11 = getelementptr inbounds %struct.struct0*, %struct.struct0** %2, i64 %7
%12 = load %struct.struct0*, %struct.struct0** %11, align 8
%13 = tail call i64 @strlen_PLT(%struct.struct0* %12)
%14 = trunc i64 %13 to i32
%15 = add i32 %8, %14
%16 = add nuw nsw i64 %7, 1
br label %6
17: ; preds = %21, %6
%18 = phi i64 [ %27, %21 ], [ 0, %6 ]
%19 = phi i32 [ %26, %21 ], [ 0, %6 ]
%20 = icmp slt i64 %18, %5
br i1 %20, label %21, label %28
21: ; preds = %17
%22 = getelementptr inbounds %struct.struct0*, %struct.struct0** %2, i64 %18
%23 = load %struct.struct0*, %struct.struct0** %22, align 8
%24 = tail call i64 @strlen_PLT(%struct.struct0* %23)
%25 = trunc i64 %24 to i32
%26 = add i32 %19, %25
%27 = add nuw nsw i64 %18, 1
br label %17
28: ; preds = %17
%29 = icmp slt i32 %8, %19
%30 = select i1 %29, %struct.struct0* %0, %struct.struct0* %0
%31 = select i1 %29, %struct.struct0* %0, %struct.struct0* %30
ret %struct.struct0* %31
}
declare dso_local i64 @strlen_PLT(%struct.struct0*) local_unnamed_addr
