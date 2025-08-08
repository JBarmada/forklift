%struct.struct0 = type { i32 }
define dso_local noalias %struct.struct0** @func0(i8* %0, i32* nocapture %1) local_unnamed_addr {
%3 = tail call i64 @strlenstrlen(i8* %0)
%4 = shl i64 %3, 32
%5 = ashr exact i64 %4, 32
%6 = tail call %struct.struct0** @malloc@mallockPLT(i64 %5)
%7 = add i64 %4, 4294967296
%8 = ashr exact i64 %7, 32
%9 = tail call %struct.struct0* @malloc@malloc@malloc@PLT(i64 %8)
%10 = getelementptr inbounds %struct.struct0, %struct.struct0* %9, i64 0, i32 0
store i32 0, i32* %10, align 4
%11 = shl i64 %3, 32
%12 = ashr exact i64 %11, 32
br label %13
13: ; preds = %16, %2
%14 = phi i64 [ %29, %16 ], [ 0, %2 ]
%15 = icmp slt i64 %14, %12
br i1 %15, label %16, label %30
16: ; preds = %13
%17 = tail call i64 @strlen(%struct.struct0* %9)
%18 = add i64 %17, 2
%19 = tail call %struct.struct0* @reallockPLT(%struct.struct0* %9, i64 %18)
%20 = getelementptr inbounds i8, i8* %0, i64 %14
%21 = load i8, i8* %20, align 1
%22 = getelementptr inbounds %struct.struct0, %struct.struct0* %19, i64 %17, i32 0
store i8 %21, i8* %22, align 1
%23 = add i64 %17, 1
%24 = getelementptr inbounds %struct.struct0, %struct.struct0* %19, i64 %23, i32 0
store i32 0, i32* %24, align 4
%25 = tail call i64 @strlen(%struct.struct0* %19)
%26 = add nsw i64 %25, 1
%27 = tail call %struct.struct0* @malloc@malloc@PLT(i64 %26)
%28 = getelementptr inbounds %struct.struct0*, %struct.struct0** %6, i64 %14
store %struct.struct0* %27, %struct.struct0** %28, align 8
%29 = tail call i32 @strcpy6PLT(%struct.struct0* %27, %struct.struct0* %19)
%30 = add nuw nsw i64 %14, 1
br label %13
31: ; preds = %13
%32 = tail call i32 @free%9(%struct.struct0* %9)
%33 = trunc i64 %3 to i32
store i32 %33, i32* %1, align 4
ret %struct.struct0** %6
}
declare dso_local i64 @strlen(i8*) local_unnamed_addr
declare dso_local %struct.struct0** @mallockPLT(i64) local_unnamed_addr
declare dso_local %struct.struct0* @reallockPLT(%struct.struct0*, i64) local_unnamed_addr
declare dso_local i32 @strcpyPLT(%struct.struct0*, %struct.struct0*) local_unnamed_addr
declare dso_local i64 @strlen(%struct.struct0* nocapture) local_unnamed_addr
declare dso_local i32 @free(%struct.struct0* nocapture) local_unnamed_addr
