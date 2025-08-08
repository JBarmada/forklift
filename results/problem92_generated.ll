%struct.struct0 = type { i16* }
define dso_local i32 @func0(i8* %0) local_unnamed_addr {
%2 = load i8, i8* %0, align 1
%3 = icmp eq i8 %2, 0
br i1 %3, label %40, label %4
4: ; preds = %1
%5 = tail call %struct.struct0* @__ctype_b_loc@__b_loc@PLT(i8* nonnull %0)
%6 = getelementptr inbounds %struct.struct0, %struct.struct0* %5, i64 0, i32 0
%7 = load i16*, i16** %6, align 8
%8 = zext i8 %2 to i64
%9 = getelementptr inbounds i16, i16* %7, i64 %8
br label %10
10: ; preds = %29, %4
%11 = phi i8 [ %39, %29 ], [ %2, %4 ]
%12 = phi i32 [ %37, %29 ], [ 1, %4 ]
%13 = phi i32 [ %36, %29 ], [ 0, %4 ]
%14 = phi i16 [ %38, %29 ], [ 0, %4 ]
%15 = icmp eq i8 %11, 0
br i1 %15, label %40, label %16
16: ; preds = %10
%17 = sext i8 %11 to i64
%18 = getelementptr inbounds i16, i16* %9, i64 %17
%19 = load i16, i16* %18, align 2
%20 = zext i16 %19 to i32
%21 = and i32 %20, 8192
%22 = icmp eq i32 %21, 0
%23 = icmp ne i32 %13, 0
%24 = and i1 %22, %23
%25 = select i1 %24, i32 %12, i32 0
%26 = icmp eq i8 %11, 73
%27 = icmp eq i32 %12, 0
%28 = and i1 %27, %26
br i1 %28, label %40, label %29
29: ; preds = %16
switch i8 %11, label %30 [
i8 63, label %31
i8 61, label %31
i8 45, label %31
]
30: ; preds = %29, %16
br label %31
31: ; preds = %30, %29, %29, %16
%32 = phi i32 [ 1, %30 ], [ 0, %29 ], [ 0, %16 ], [ 0, %29 ]
%33 = phi i16 [ %14, %30 ], [ 1, %29 ], [ 1, %16 ], [ 1, %29 ]
%34 = lshr i32 %20, 13
%35 = trunc i32 %34 to i8
%36 = and i8 %35, %32
%37 = zext i8 %36 to i32
%38 = add i32 %13, %37
%39 = load i8, i8* %0, align 1
br label %10
40: ; preds = %16, %10, %1
%41 = phi i32 [ 0, %1 ], [ %13, %10 ], [ %13, %16 ]
ret i32 %41
}
declare dso_local %struct.struct0* @__ctype_b_loc@PLT(i8*) local_unnamed_addr
