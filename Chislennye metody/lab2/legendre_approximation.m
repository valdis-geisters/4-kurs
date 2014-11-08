function polynomial = legendre_approximation(x, y, k)
    
    if length(x) == length(y)
        n = k+1;
        m = length(x);
        Max = max(x);
        Min = min(x);
        
        a = zeros(n,n);
        b = zeros(n,1);
        
        % составляем сис. ур.
        % находим a
        for i=1:n
            for j=1:n
               tmp = 0;
               
               for l=1:m
                  tmp = tmp + legendre_polynomial(j-1, x(1,l))*legendre_polynomial(i-1, x(1,l)); 
               end
               
               a(i,j) = tmp;
            end
        end
        
        % находим b
        for i=1:n
           tmp = 0;
           
           for j=1:m
              tmp = tmp + y(1,j)*legendre_polynomial(i-1,x(1,j)); 
           end
           
           b(i,1) = tmp;
        end
        
        % решаем слау, получаем коэф.
        gaussResult = gauss(a,b);
        
        % получаем полином
        expression = 0;
        for i=0:n-1
            expression = expression + gaussResult(i+1,1)*legendre_polynomial(i);
        end
        
        % преобразуем полином в читаемый вид (парсим)
        polynomial = pretty_polinomial(expression, n);
        
        % рисуем график
        x1 = Min:1e-2:Max;
        y1 = polyval(polynomial,x1);
        
        plot(x1,y1,'b');
        grid on;
        
    else
        disp('Legendre approximation error. Invalid data.')
    end
    
end