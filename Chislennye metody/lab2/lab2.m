clear, clc, close all, hold on

x = [-1 14 6 10];
y = [1 2 8 -2];
k = 2;

% аппроксимация по методу МНК
approximation(x, y, k);

% аппроксимация полиномом Лежандра

% точки на графике
plot(x,y,'o');