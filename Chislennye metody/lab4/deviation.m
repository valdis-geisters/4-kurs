function y = deviation(t_tmp, interval)

    i = 1;
    while t_tmp(1,i) < interval
        y(1, i) = fa(t_tmp(1,i));
        
        i = i + 1;
    end
    
    y(1, i) = fa(t_tmp(1,i));
    
    length(t_tmp)

end