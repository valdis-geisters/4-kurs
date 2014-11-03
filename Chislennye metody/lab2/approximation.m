function result = approximation(x,y,k)

    if(length(x) == length(y))
        n = k+1;
        m = length(x);
        Max = max(x);
        Min = min(x);
        
        a = zeros(n,n);
        b = zeros(n,1);
        
        % находим a
        for i=1:n
            if(i == 1)
               a(1,1) = m;
               
               for j=2:n
                   tmp = 0;
                   
                   for l=1:m
                      tmp = tmp + x(1,l)^(j-1); 
                   end
                   
                   a(1,j) = tmp;
               end
            else
                for j=1:k
                   a(i,j) = a(i-1,j+1); 
                end
                
                tmp = 0;
                
                for j=1:m
                   tmp = tmp + x(1,j)^(k+i-1); 
                end
                
                a(i,n) = tmp;
            end
        end
        
        % находим b
        for i=0:n-1
            tmp = 0;          
            for j=1:m
               tmp = tmp + y(1,j)*x(1,j)^i; 
            end            
            b(i+1,1) = tmp;
        end
        
        disp(a);
        disp(b);
        
        % найденный полином
        result = fliplr(gauss(a, b)');
        
        % точки для функции (рисуем график)
        x1 = Min:1e-2:Max;
        y1 = polyval(result,x1);
        
        plot(x1,y1,'m');
        grid on;
    else
       disp('Approximation error. Invalid data.'); 
    end

end