clear, clc, hold on
%syms x
%x = fzero('log(x)^3/x^2', 0);
%plot([0 2],[0 0],'-black');
%plot(x,0,'or')
%fplot('log(x)^3/x^2', [0 2 -10 10]);

n = 6;
a = -2;
b = 2;

% метод бисекции
%bisection(a, b, n);

% метод хорд
%chord(a, b, n);

% метод ньютона
%newton(a, b, n);

% метод итераций
iter(a, b, n);
