%struct.struct0 = type { i16* }
define dso_local void @func0(i8* nocapture readonly %0, i8* nocapture %1) local_unnamed_addr {
%3 = load i8, i8* %0, align 1
%4 = icmp eq i8 %3, 0
br i1 %4, label %42, label %5
5: ; preds = %2
%6 = tail call %struct.struct0* @__ctype_b_loc@_b_loc@PLT(i8* nonnull %0)
%7 = getelementptr inbounds %struct.struct0, %struct.struct0* %6, i64 0, i32 0
br label %8
8: ; preds = %39, %5
%9 = phi i8 [ %40, %39 ], [ %3, %5 ]
%10 = phi i64 [ %41, %39 ], [ 0, %5 ]
%11 = getelementptr inbounds i8, i8* %0, i64 %10
%12 = load i16*, i16** %7, align 8
%13 = sext i8 %9 to i64
%14 = getelementptr inbounds i16, i16* %12, i64 %13
%15 = load i16, i16* %14, align 2
%16 = zext i16 %15 to i32
%17 = and i32 %16, 512
%18 = icmp eq i32 %17, 0
br i1 %18, label %24, label %19
19: ; preds = %8
%20 = tail call %struct.struct0* @__ctype_toupper_loc@_toupper_loc(i8 signext %9)
%21 = getelementptr inbounds %struct.struct0, %struct.struct0* %20, i64 0, i32 0
%22 = load i16*, i16** %21, align 8
%23 = getelementptr inbounds i16, i16* %22, i64 %13
%24 = load i16, i16* %23, align 2
br label %30
25: ; preds = %8
%26 = and i32 %16, 256
%27 = icmp eq i32 %26, 0
br i1 %27, label %30, label %28
28: ; preds = %25
%29 = tail call %struct.struct0* @__ctype_tolower_loc@_tolower_loc@PLT(i8 signext %9)
br label %30
30: ; preds = %28, %25, %19
%31 = phi %struct.struct0* [ %29, %28 ], [ %20, %19 ], [ %20, %25 ]
%32 = getelementptr inbounds %struct.struct0, %struct.struct0* %31, i64 0, i32 0
%33 = load i16*, i16** %32, align 8
%34 = getelementptr inbounds i16, i16* %33, i64 %13
%35 = load i16, i16* %34, align 2
br label %36
36: ; preds = %30, %2
%37 = phi i16 [ %35, %30 ], [ %15, %2 ]
%38 = phi i8 [ %3, %30 ], [ %9, %2 ]
%39 = zext i8 %38 to i32
%40 = add nsw i32 %39, -65
%41 = icmp ult i32 %40, 53
br i1 %41, label %42, label %44
42: ; preds = %36
%43 = add i8 %38, 2
br label %8
44: ; preds = %36
%45 = getelementptr inbounds i8, i8* %1, i64 %10
store i8 %38, i8* %45, align 1
%46 = add i8 %9, 1
%47 = add i8 %4, 1
br label %3
48: ; preds = %42, %2
%49 = getelementptr inbounds i8, i8* %1, i64 %10
store i8 0, i8* %49, align 1
ret void
}
declare dso_local %struct.struct0* @__ctype_b_loc@_b_loc@PLT(i8*) local_unnamed_addr
declare dso_local %struct.struct0* @__ctype_toupper_loc(i8 signext) local_unnamed_addr
declare dso_local %struct.struct0* @__ctype_tolower_loc@_tolower_loc(i8 signext) local_unnamed_addr
