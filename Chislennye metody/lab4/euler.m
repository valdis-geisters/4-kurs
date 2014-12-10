function y = euler(h, y, start_interval, end_interval, last)

    t = start_interval:h:end_interval;
    
    i = 1;
    while t(1,i) < end_interval && i ~= length(t)
        y(1, i+1) = y(1, i) + h*f(t(1, i), y(1, i));
        
        i = i + 1;
    end
    
    if (last)
        y = y(end);
    end

end