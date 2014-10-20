clc, clear, close all
x=[ -1 11 6 10 ];
y=[ 1 1 8 -2 ];

plot([-1:1e-2:11],interp1(x,y,[-1:1e-2:11],'spline'),'g',[-1:1e-2:11],polyval(polyfit(x,y,2),[-1:1e-2:11]),'r',x,y,'o'), grid on