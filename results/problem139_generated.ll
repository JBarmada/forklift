%struct.struct0 = type { i32 }
define dso_local i32 @func0(i32 %0, %struct.struct0* nocapture readnone %1) local_unnamed_addr {
%3 = and i32 %0, 1
%4 = icmp eq i32 %3, 0
%5 = icmp sge i32 %0, 8
%6 = and i1 %5, %4
%7 = zext i1 %6 to i32
ret i32 %7
}
