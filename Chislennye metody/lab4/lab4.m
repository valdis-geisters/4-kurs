clear; clc; close all;

%f = -7*y + t;
h = 0.05;
y0 = 1;
interval = 2;

% f = 0.86*y - 0.23*y^2
%h = 0.05;
%y0 = 1;
%interval = 10;

% f = 0.25*y - 0.05*y^2
%h = 0.05;
%y0 = 1;
%interval = 30;

[t_e, y_e] = euler(h, y0, interval);
[t_ad, y_ad] = adams_bashforth(h, y0, interval);

%[t_a, y_a] = ode23('f', [0 interval], y0);

hold on;
grid on;

ezplot(dsolve('Dy = -7*y + t', 'y(0)=1'), [0, interval]);
plot(t_e, y_e, '-.g');
plot(t_ad, y_ad, '-.r');
legend('analytical', 'euler', 'adams-bashforth');
%plot(t_ad, y_ad, '-.c');