function result = bisection(fun, a, b, e)
    syms f(x);
    f(x) = fun;
    
    if (f(a)*f(b) <=0 )
        i = 1;
        flag = true;
        
        while flag == true
            X(i,1) = (a+b)/2;
            
            if (f(a)*f(X(i,1)) <= 0)
                b = X(i,1);
            else
                a = X(i,1);
            end
            
            if (abs(b-a) < e)
                flag = false;
            else
                i = i + 1;
            end
        end
        
        result = X(i,1);
    else
       result = [];
    end
end