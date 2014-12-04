function [t, y] = adams_bashforth(h, y, interval)

    t = 0:h:interval;
    
    % находим все точки методом Адамса
    [t_adams, y_adams] = euler(h, y, interval);
    y = y_adams;
    
    i = 3;
    while t(1,i) < interval && i ~= length(t)
        f1 = f(t(1, i+1), y(1, i+1));
        f2 = f(t(1, i), y(1, i));
        f3 = f(t(1, i-1), y(1, i-1));
        f4 = f(t(1, i-2), y(1, i-2));
        y(1, i+1) = y(1, i) + (h/24)*(9*f1 + 19*f2 - 5*f3 + f4);
        
        i = i + 1;
    end

end