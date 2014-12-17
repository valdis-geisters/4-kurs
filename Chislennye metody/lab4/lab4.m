clear; clc; close all;

% f = 0.25*y - 0.05*y^2
h = 0.001;
y0 = 1;
interval = 30;

y_e = euler(h, y0, interval);
y_ad = adams_bashforth(h, y0, interval);
t = 0:h:interval;

hold on;
grid on;

%fun = dsolve('Dy = 0.25*y - 0.05*y^2', 'y(0)=1');
%ezplot(fun, [0, interval]);
%plot(t, y_e, '-.g');
%plot(t, y_ad, '-.r');
%legend('analytical', 'adams-bashforth');


y_deviation = deviation(t, interval) - y_ad;
plot(t, y_deviation);
disp(max(y_deviation));