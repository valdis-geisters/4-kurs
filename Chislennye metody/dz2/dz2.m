clc, clear, close all
x=[ -1 14 6 10 ];
y=[ 1 2 8 -2 ];

plot([-1:1e-2:14],interp1(x,y,[-1:1e-2:14],'spline'),'g',[-1:1e-2:14],polyval(polyfit(x,y,2),[-1:1e-2:14]),'r',x,y,'o'), grid on