clear, clc, close all, hold on

x = [-3 -2 -1 0 1 2 3];
y = [0.1 0.8 0.9 1.6 2.4 2.6 4.2];
k = 2;

% аппроксимация по методу МНК
ls_approximation(x, y, k);

% аппроксимация полиномом Лежандра
% orthogonal_approximation(x, y, k);

x1 = -3:1e-2:3;
y1 = polyval([0.1394 0.6241 1.7303],x1);

plot(x1,y1,'r');
grid on;
        
% точки на графике
plot(x,y,'o');