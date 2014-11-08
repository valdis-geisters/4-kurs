function polynomial = approximation(x, y, k)

    if length(x) == length(y)
        n = k+1;
        m = length(x);
        Max = max(x);
        Min = min(x);
        
        a = zeros(n,n);
        b = zeros(n,1);
        
        % строим сис. ур.
        % находим a
        for i=1:n
           for j=1:n
              if i == 1 && j == 1
                 a(i,j) = m + 1; 
              else
                  tmp = 0;
                  
                  for l=1:m
                      tmp = tmp + x(1,l)^((i-1)+(j-1));
                  end
                  
                  a(i,j) = tmp;
              end
           end
        end
        
        % находим b
        for i=1:n
            tmp = 0;
            
            for j=1:m
               tmp = tmp + y(1,j)*x(1,j)^(i-1); 
            end
            
            b(i,1) = tmp;
        end
        
        % решаем слау -> получаем полином
        polynomial = fliplr(gauss(a, b)');
        
        % рисуем график
        x1 = Min:1e-2:Max;
        y1 = polyval(polynomial,x1);
        
        plot(x1,y1,'m');
        grid on;
    else
       disp('Approximation error. Invalid data.'); 
    end

end