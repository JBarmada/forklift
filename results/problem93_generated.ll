%struct.struct0 = type { i32 }
define dso_local i32 @func0(float %0, float %1, float %2) local_unnamed_addr {
%4 = alloca [4 x float], align 16
%5 = bitcast [4 x float]* %4 to i8*
call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %5)
%6 = bitcast [4 x float]* %4 to %struct.struct0*
%7 = tail call float @roundf@PLT(float %0)
%8 = getelementptr inbounds [4 x float], [4 x float]* %4, i64 0, i64 0
store float %1, float* %8, align 16
%9 = tail call float @roundf@PLT(float %2)
%10 = getelementptr inbounds [4 x float], [4 x float]* %4, i64 0, i64 1
store float %9, float* %10, align 4
%11 = tail call float @roundfoPLT(float %0)
%12 = getelementptr inbounds [4 x float], [4 x float]* %4, i64 0, i64 2
store float %11, float* %12, align 8
%13 = getelementptr inbounds [4 x float], [4 x float]* %4, i64 0, i64 3
store float %7, float* %13, align 4
%14 = fcmp oeq float %0, %1
br i1 %14, label %15, label %28
15: ; preds = %3
%16 = fcmp oeq float %9, %2
%17 = load float, float* %8, align 8
%18 = fcmp oeq float %11, %17
%19 = and i1 %16, %18
br i1 %19, label %20, label %28
20: ; preds = %15
%21 = fadd float %9, %1
%22 = fcmp oeq float %21, %1
%23 = load float, float* %10, align 16
%24 = fcmp oeq float %23, %2
%25 = or i1 %22, %24
%26 = fadd float %9, %17
%27 = fcmp oeq float %26, %2
%28 = or i1 %25, %27
%29 = zext i1 %28 to i32
br label %30
30: ; preds = %20, %15
%31 = phi i32 [ 0, %15 ], [ %29, %20 ]
call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %5)
ret i32 %31
}
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture)
declare dso_local float @roundf@PLT(float) local_unnamed_addr
declare dso_local float @roundfoPLT(float) local_unnamed_addr
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture)
