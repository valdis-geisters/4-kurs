function y = deviation(t_tmp, y, interval)

    i = 1;
    while t_tmp(1,i) < interval && i ~= length(t_tmp)
        y(1, i+1) = fa(t_tmp(1,i));
        
        i = i + 1;
    end

end