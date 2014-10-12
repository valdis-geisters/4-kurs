clc, clear
h=0.2*pi;
summ=0;
for i=0:h:pi
   step=h*fun(i);
   fprintf('result %i \n',step)
   summ=summ+step;
end
summ