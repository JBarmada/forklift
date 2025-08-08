%struct.struct0 = type { i32 }
define dso_local i32 @func0(i32 %0, %struct.struct0* nocapture readnone %1) local_unnamed_addr {
%3 = mul nsw i32 %0, %0
ret i32 %3
}
