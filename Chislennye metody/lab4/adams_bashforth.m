function y = adams_bashforth(h, y, interval)

    t = 0:h:interval;
    
    % находим первые четыре точки
    y = euler(h, y, 0, h*3, false);
    
    i = 3;
    while t(1,i) < interval && i ~= length(t)
        % делаем i+1 так как i = 3
        if i == 3
            a1 = f(t(1, i+1), y(1, i+1));
            a2 = f(t(1, i), y(1, i));
            a3 = f(t(1, i-1), y(1, i-1));
            a4 = f(t(1, i-2), y(1, i-2));
            y_adams = y(1, i) + (h/24)*(55*a1-59*a2+37*a3-9*a4);
        else
            a1 = f(t(1, i), y(1, i));
            a2 = f(t(1, i-1), y(1, i-1));
            a3 = f(t(1, i-2), y(1, i-2));
            a4 = f(t(1, i-3), y(1, i-3));
            y_adams = y(1, i) + (h/24)*(55*a1-59*a2+37*a3-9*a4);
        end
        f1 = f(t(1, i+1), y_adams);
        
        f2 = f(t(1, i), y(1, i));
        f3 = f(t(1, i-1), y(1, i-1));
        f4 = f(t(1, i-2), y(1, i-2));
        y(1, i+1) = y(1, i) + (h/24)*(9*f1 + 19*f2 - 5*f3 + f4);
        
        i = i + 1;
    end

end