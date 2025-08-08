%struct.struct0 = type { i8 }
define dso_local zeroext i8 @func0(%struct.struct0* %0, %struct.struct0* %1) local_unnamed_addr {
%3 = tail call i64 @strlen5(%struct.struct0* %0)
%4 = tail call i64 @strlen@strlen@strlen@PLT(%struct.struct0* %1)
%5 = shl i64 %4, 32
%6 = ashr exact i64 %5, 32
%7 = and i64 %4, 4294967295
%8 = shl i64 %3, 32
%9 = ashr exact i64 %8, 32
br label %10
10: ; preds = %19, %2
%11 = phi i64 [ %20, %19 ], [ 0, %2 ]
%12 = icmp slt i64 %11, %9
br i1 %12, label %13, label %16
13: ; preds = %10
%14 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %11, i32 0
%15 = load i8, i8* %14, align 1
br label %21
16: ; preds = %10
%17 = getelementptr inbounds %struct.struct0, %struct.struct0* %1, i64 %11, i32 0
%18 = load i8, i8* %17, align 1
%19 = icmp eq i8 %15, %18
%20 = add nuw nsw i64 %11, 1
br i1 %19, label %21, label %10
21: ; preds = %16, %13
%22 = and i64 %11, 4294967295
%23 = getelementptr inbounds %struct.struct0, %struct.struct0* %1, i64 %22, i32 0
br label %24
24: ; preds = %27, %21
%25 = phi i64 [ %32, %27 ], [ 0, %21 ]
%26 = icmp slt i64 %25, %6
br i1 %26, label %27, label %33
27: ; preds = %24
%28 = load i8, i8* %23, align 1
%29 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %25, i32 0
%30 = load i8, i8* %29, align 1
%31 = icmp eq i8 %15, %30
%32 = add nuw nsw i64 %25, 1
br i1 %31, label %33, label %24
33: ; preds = %27, %24
%34 = phi i64 [ %22, %24 ], [ 0, %27 ]
%35 = icmp slt i64 %34, %9
br i1 %35, label %36, label %44
36: ; preds = %33
%37 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %34, i32 0
%38 = load i8, i8* %37, align 1
%39 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %34, i32 0
%40 = load i8, i8* %39, align 1
%41 = icmp eq i8 %15, %40
%42 = add nuw nsw i64 %34, 1
br i1 %41, label %43, label %33
43: ; preds = %36
%44 = icmp slt i32 %3, 1
%45 = zext i1 %44 to i8
br label %46
46: ; preds = %43, %33
%47 = phi i8 [ %45, %43 ], [ 0, %33 ]
ret i8 %47
}
declare dso_local i64 @strlen5(%struct.struct0*) local_unnamed_addr
