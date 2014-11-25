function result = newton_correction(fun, a, b, e)
    syms f(x);
    f(x) = fun;
    fd(x) = diff(f(x));
    
    if (f(a)*f(b) <=0 )
        i = 1;
        flag = true;

        Xi(i,1) = (a + b)/2;

        while flag == true

            second_flag = true;
            alpha = 1;
            
            while second_flag == true
                Xi(i+1,1) = Xi(i,1) - alpha * (f(Xi(i,1)) / fd(Xi(i,1)));

                if (isnan(Xi(i+1,1)))
                    result = newton_correction(fun, a+1, b+1, e);
                    return;
                end

                if abs(f(Xi(i+1,1))) > abs(f(Xi(i,1)))
                    alpha = alpha / 2;
                else
                   second_flag = false; 
                end

            end

            if (abs(Xi(i+1,1)-Xi(i,1)) < e)
                flag = false;
            else
               i = i + 1;
            end
        end

        i = i + 1;
        result = Xi(i,1);
        
    else
        result = [];
    end
    
end
