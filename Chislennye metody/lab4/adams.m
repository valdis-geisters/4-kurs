function [t, y] = adams(h, y, interval)

    t = 0:h:interval;
    
    % находим первые 4 точки методом Эйлера
    [t_euler, y_euler] = euler(h, y, h*3);
    y = y_euler;
    
    i = 4;
    while t(1,i) < interval
        f1 = f(t(1, i), y(1, i));
        f2 = f(t(1, i-1), y(1, i-1));
        f3 = f(t(1, i-2), y(1, i-2));
        f4 = f(t(1, i-3), y(1, i-3));
        y(1, i+1) = y(1, i) + (h/24)*(55*f1 - 59*f2 + 37*f3 - 9*f4);
        
        i = i + 1;
    end

end