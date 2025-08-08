%struct.struct0 = type { i32 }
%struct.struct1 = type { i32* }
define dso_local i32 @func0(%struct.struct0* %0) local_unnamed_addr {
%2 = ptrtoint %struct.struct0* %0 to i64
%3 = trunc i64 %2 to i32
%4 = tail call i64 @strlen@strlen@7(i32 %3)
%5 = trunc i64 %4 to i32
%6 = icmp eq i32 %3, 0
br i1 %6, label %35, label %7
7: ; preds = %1
%8 = shl i64 %4, 32
%9 = add i64 %8, -4294967296
%10 = ashr exact i64 %9, 32
%11 = inttoptr i64 %10 to %struct.struct1*
%12 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 0, i32 0
%13 = load i32, i32* %12, align 4
%14 = and i32 %13, 255
%15 = tail call %struct.struct1* @__ctype_b_loc@PLT(%struct.struct0* %0)
%16 = getelementptr inbounds %struct.struct1, %struct.struct1* %15, i64 0, i32 0
%17 = load i32*, i32** %16, align 8
%18 = zext i32 %14 to i64
%19 = getelementptr inbounds i32, i32* %17, i64 %18
%20 = load i32, i32* %19, align 4
%21 = and i32 %20, 1024
%22 = icmp eq i32 %21, 0
br i1 %22, label %35, label %23
23: ; preds = %7
%24 = icmp eq i32 %5, 1
br i1 %24, label %35, label %25
25: ; preds = %23
%26 = shl i64 %4, 32
%27 = add i64 %26, -8589934592
%28 = ashr exact i64 %27, 32
%29 = getelementptr inbounds i8, i8* %11, i64 %28
%30 = load i8, i8* %29, align 1
%31 = zext i8 %30 to i64
%32 = getelementptr inbounds i32, i32* %17, i64 %31
%33 = load i32, i32* %32, align 4
%34 = lshr i32 %33, 2
%35 = and i32 %34, 1024
%36 = xor i32 %35, 1
br label %37
37: ; preds = %25, %23, %7, %1
%38 = phi i32 [ 0, %1 ], [ 0, %7 ], [ 1, %23 ], [ %36, %25 ]
ret i32 %38
}
declare dso_local i64 @strlen(i32) local_unnamed_addr
declare dso_local %struct.struct1* @__ctype_b_loc@PLT(%struct.struct0*) local_unnamed_addr
