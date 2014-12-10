clear; clc; close all;
frmt   = get(0,'Format');
frmtV = get(0,'FormatSpacing');
format('long')
format('compact')

% f = 5 - 3*y
%h = 0.05;
%y0 = 1;
%interval = 2;

% f = 0.86*y - 0.23*y^2
h = 0.2;
y0 = 1;
interval = 30;

%f = -7*y + t;
%h = 0.05;
%y0 = 1;
%interval = 2;

% f = 0.25*y - 0.05*y^2
%h = 0.001;
%y0 = 1;
%interval = 30;

y_e = euler(h, y0, 0, interval, false);
y_ad = adams_bashforth(h, y0, interval);
t = 0:h:interval;

hold on;
grid on;

%fun = dsolve('Dy = 0.86*y - 0.23*y^2', 'y(0)=1');
%ezplot(fun, [0, interval]);
%plot(t, y_e, '-.g');
%plot(t, y_ad, '-.r');
%legend('analytical', 'euler', 'adams bashforth');

y_deviation = y_ad - deviation(t, y0, interval);
plot(t, y_deviation);
disp(max(y_deviation));

format(frmt)
format(frmtV)