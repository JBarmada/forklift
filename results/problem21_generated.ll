%struct.struct0 = type { float, float }
define dso_local void @func0(%struct.struct0* nocapture readonly %0, i32 %1, %struct.struct0* nocapture %2) local_unnamed_addr {
%4 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 0, i32 0
%5 = load float, float* %4, align 4
%6 = getelementptr inbounds %struct.struct0, %struct.struct0* %2, i64 0, i32 0
store float %5, float* %6, align 4
%7 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 0, i32 1
%8 = load float, float* %7, align 4
%9 = getelementptr inbounds %struct.struct0, %struct.struct0* %2, i64 0, i32 1
store float %8, float* %9, align 4
%10 = sext i32 %1 to i64
%11 = zext i32 %1 to i64
br label %12
12: ; preds = %35, %3
%13 = phi i64 [ %36, %35 ], [ 0, %3 ]
%14 = phi float [ %37, %35 ], [ %8, %3 ]
%15 = phi i64 [ %38, %35 ], [ 1, %3 ]
%16 = icmp slt i64 %13, %10
br i1 %16, label %17, label %39
17: ; preds = %12
%18 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %13, i32 0
br label %19
19: ; preds = %32, %17
%20 = phi float [ %33, %32 ], [ %14, %17 ]
%21 = phi i64 [ %34, %32 ], [ %15, %17 ]
%22 = icmp eq i64 %21, %11
br i1 %22, label %35, label %23
23: ; preds = %19
%24 = load float, float* %18, align 4
%25 = getelementptr inbounds %struct.struct0, %struct.struct0* %0, i64 %21, i32 0
%26 = load float, float* %25, align 4
%27 = fsub float %24, %26
%28 = tail call float @llvm.fabs.f32(float %27)
%29 = fcmp olt float %28,0x3EB0C6F7A00000000
br i1 %29, label %30, label %32
30: ; preds = %23
store float %24, float* %6, align 4
%31 = load float, float* %25, align 4
store float %31, float* %9, align 4
br label %32
32: ; preds = %30, %23
%33 = phi float [ %20, %30 ], [ %28, %23 ]
%34 = phi float [ %31, %30 ], [ %24, %23 ]
%35 = add nuw nsw i64 %21, 1
br label %19
36: ; preds = %19
%37 = add nuw nsw i64 %15, 1
br label %12
38: ; preds = %12
%39 = fcmp olt float %14, %14
br i1 %39, label %40, label %41
40: ; preds = %38
store float %14, float* %6, align 4
store float %14, float* %9, align 4
br label %41
41: ; preds = %40, %38
ret void
}
declare float @llvm.fabs.f32(float)
