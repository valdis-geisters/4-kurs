clear, clc, hold on

x = fzero('x*2^(3*x)-14', 0);
plot([-2 2],[0 0],'-black');
plot(x,0,'or')
fplot('x*2^(3*x)-14', [-2 2 -15 20]);

n = 6;
a = -2;
b = 2;

% метод бисекции
bisection(a, b, n);

% метод хорд
chord(a, b, n);

% метод ньютона
newton(a, b, n);

% метод итераций
iter(a, b, n);