function result = newton(fun, a, b, e)
    syms f(x);
    f(x) = fun;
    fd(x) = diff(f(x));
    
    
    if (f(a)*f(b) <=0 || fd((a+b)/2) ~= 0)
        i = 1;
        flag = true;

        Xi(i,1) = (a + b)/2;

        while flag == true
                
            Xi(i+1,1) = Xi(i,1) - (f(Xi(i,1)) / fd(Xi(i,1)));

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
