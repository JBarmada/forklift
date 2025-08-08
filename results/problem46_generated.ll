@.str = external hidden unnamed_addr constant [12 x i8], align 1
define dso_local float @func0(float %0, float %1) local_unnamed_addr {
%3 = fmul float %0, %1
%4 = fmul float %3, 3.000000e+06
ret float %4
}
