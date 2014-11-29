clear; clc; close all;

% f = -3*y + t;
h = 0.1;
y0 = 1;
interval = 2;

% f = 0.08*y - 0.01*y^2
%h = 0.08;
%y0 = 1;
%interval = 50;

% f = 0.25*y - 0.05*y^2
%h = 0.05;
%y0 = 1;
%interval = 30;

% f = 3*y^(2/3)
%h = 0.1;
%y0 = 1;
%interval = 1;

[t_e, y_e] = euler(h, y0, interval);
[t_ad, y_ad] = adams_bashforth(h, y0, interval);
[t_a, y_a] = ode23('f', [0 interval], y0);

hold on;
grid on;

plot(t_e, y_e, 'b');
plot(t_ad, y_ad, 'r');
plot(t_ad, y_ad, '-.c');
