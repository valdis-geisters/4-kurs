function result = bisection2(fun, start_point, end_point, step, e)
    tmp_result = [];
    
    a = start_point;
    b = start_point + step;
    
    while b <= end_point
        nc = bisection(fun, a, b, e);
        
        if ~isempty(nc)
            tmp_result = [tmp_result, nc];
        end
        
        a = b;
        b = a + step;
    end

    result = tmp_result
end