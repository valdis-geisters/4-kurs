function result = newton_correction2(fun, start_point, end_point, step, e)

    tmp_result = [];
    
    if abs(start_point) + abs(start_point) < step || start_point > end_point
       result = tmp_result;
       return
    end

    a = start_point;
    b = start_point + step;
    
    while b <= end_point
        nc = newton_correction(fun, a, b, e);
        
        if ~isempty(nc)
            tmp_result = [tmp_result, nc];
        end
        
        a = b;
        b = a + step;
    end

    result = tmp_result
end
