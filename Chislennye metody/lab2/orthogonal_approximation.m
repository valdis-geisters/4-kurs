function result = orthogonal_approximation(x, y, k)
    if(length(x) == length(y))
        n = length(x);
        a = zeros(1, k);
        Max = max(x);
        Min = min(x);
        
        for i=1:k
            sum1 = 0;
            sum2 = 0;
            for j=1:n
                sum1 = sum1 + y(1,j)*legendre_polynomials(i-1, x(1,j));
                sum2 = sum2 + legendre_polynomials(i-1, x(1,j))^2;
            end
            
            a(1,i) = sum1/sum2;  
        end
        
        result = a;
        
        x1 = Min:1e-2:Max;
        y1 = polyval(result,x1);
        
        plot(x1,y1,'r');
        grid on;
    else
        disp('Orthogonal approximation error. Invalid data.');
    end
end