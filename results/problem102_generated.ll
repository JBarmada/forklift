%struct.struct0 = type { i32 }
define dso_local i32 @func0(i32 %0, i32 %1, %struct.struct0* nocapture readnone %2) local_unnamed_addr {
%4 = icmp slt i32 %1, %0
br i1 %4, label %13, label %5
5: ; preds = %3
%6 = and i32 %1, -2147483647
%7 = icmp eq i32 %6, %0
%8 = icmp eq i32 %1, 1
%9 = and i1 %8, %7
br i1 %9, label %13, label %10
10: ; preds = %5
%11 = icmp eq i32 %6, 1
%12 = sext i1 %11 to i32
br label %13
13: ; preds = %10, %5, %3
%14 = phi i32 [ -1, %3 ], [ -1, %5 ], [ %12, %10 ]
ret i32 %14
}
