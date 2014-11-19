clear, clc, close all, hold on

x = [-3.2 -2.1 0.4 0.7 2 2.5 2.777];
y = [10 -2 0 -7 7 0 0];
k = 7;

% x = -2:0.5:2;
% y = sin(5*x).*exp(1).^x;
% k = 9;

% x = [-1 14 6 10];
% y = [1 2 8 -2];
% k = 4;

% x = -1:0.2:1;
% y = abs(x);
% k = 10;

disp(approximation(x, y, k));
disp(legendre_approximation(x, y, k));
plot(x,y,'*k');