clc, clear
for i=0:0.2*pi:pi
    fun(i);
    fprintf('result %i \n', fun(i))
end