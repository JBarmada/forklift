%struct.struct0 = type { i32 }
define dso_local i32 @func0(i32 %0, i32 %1, %struct.struct0* nocapture readnone %2) local_unnamed_addr {
%4 = add nsw i32 %1, %0
ret i32 %4
}
