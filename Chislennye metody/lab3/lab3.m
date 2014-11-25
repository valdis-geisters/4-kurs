clear, clc, close all

% fun = 'x*2^(3*x)';
fun = 'x^2*sin(x)';
% fun = 'x^2+sin(x)';
% fun = 'x*(sin(2*x))=0';
% fun = '2^(3*x)=0';
% fun = 'e^(2*x)*sin(x)=0';

start_point = -10;
end_point = 10;
step = 2;
e = 0.0001;

% x = bisection2(fun, start_point, end_point, step, e);
x = newton_correction2(fun, start_point, end_point, step, e);

grid on; hold on;
plot([start_point end_point],[0 0],'k')
ezplot(fun, [start_point, end_point]);
% set(gca,'YLim',[-5 5]);
xlabel('e=0.0001')

y = zeros(length(x), 1);
plot(x,y,'*r');