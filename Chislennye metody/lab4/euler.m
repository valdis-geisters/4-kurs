function [t, y] = euler(h, y, interval)

    t = 0:h:interval;
    
    i = 1;
    while t(1,i) < interval
        y(1, i+1) = y(1, i) + h*f(t(1, i), y(1, i));
        
        i = i + 1;
    end

end