function y = euler_cauchy(h, y, interval)

    t = 0:h:interval;
        
    i = 1;
    while t(1,i) < interval && i ~= length(t)
        f1 = f(t(1,i), y(1,i));
        f2 = f(t(1,i+1), euler(h, y(1, i), t(1,i), t(1,i+1), true));
        
        y(1, i+1) = y(1, i) + (h/2)*(f1+f2);
        
        i = i + 1;
    end

end