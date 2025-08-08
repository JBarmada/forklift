%struct.struct0 = type { i32, i32 }
define dso_local noalias nonnull %struct.struct0* @func0(i32 %0) local_unnamed_addr {
%2 = alloca i16, align 2
%3 = bitcast i16* %2 to i8*
call void @llvm.lifetime.start.p0i8(i64 2, i8* nonnull %3)
call void @llvm.lifetime.end.p0i8(i64 2, i8* nonnull %3)
ret %struct.struct0* %2
}
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture)
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture)
