clear; clc; close all;

[y, z, t] = runge_kutta();
[t2, y2] = ode23('pdu2', [0 2], [5 10]);

grid on,
hold on;
plot(t2, y2);
plot(t, y, '*r');
plot(t, z, 'ok');
axis([0 2 -5 10]);
legend('ode23', 'ode23', 'y', 'z');