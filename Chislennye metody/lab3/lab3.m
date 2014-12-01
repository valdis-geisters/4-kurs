clear, clc, close all

fun = 'x*2^(3*x)-14';
%fun = 'x^2*sin(x)-14';
%fun = 'x^2+sin(x)-14';
%fun = 'x*(sin(2*x))';
%fun = '2^(3*x)-14';

start_point = 1;
end_point = 2;
step = 1;
e = 0.0001;

%x = bisection2(fun, start_point, end_point, step, e);
x = newton_correction2(fun, start_point, end_point, step, e);

grid on; hold on;
plot([start_point end_point],[0 0],'k')
ezplot(fun, [start_point, end_point]);
% set(gca,'YLim',[-5 5]);
xlabel('e=0.0001');

y = zeros(length(x), 1);
plot(x,y,'*r');