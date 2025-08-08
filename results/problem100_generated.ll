%struct.struct0 = type { i32 }
define dso_local i32 @func0(%struct.struct0* %0) local_unnamed_addr {
%2 = tail call double @strtod@strtod@strtod(%struct.struct0* %0, i32 0)
%3 = fcmp olt double %2, 0.000000e+00
br i1 %3, label %4, label %7
4: ; preds = %1
%5 = fadd double %2, 1.000000e+00
%6 = tail call double @llvm.ceil.f64(double %5)
br label %10
7: ; preds = %1
%8 = fadd double %2, 1.000000e+00
%9 = tail call double @llvm.floor.f64(double %8)
br label %10
10: ; preds = %7, %4
%11 = phi double [ %6, %4 ], [ %9, %7 ]
%12 = fptosi double %11 to i32
ret i32 %12
}
declare dso_local double @strtod(%struct.struct0*, i32) local_unnamed_addr
declare double @llvm.ceil.f64(double)
declare double @llvm.floor.f64(double)
