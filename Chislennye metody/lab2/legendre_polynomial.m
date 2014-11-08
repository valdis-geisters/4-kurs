function polynomial = legendre_polynomial(n, varargin)
    
    useExpand = false;
    
    if isempty(varargin)
        x = sym('x');
        useExpand = true;
    else
        x = varargin{1};
    end
          
    if n == 0
        polynomial = 1;
    elseif n == 1
        polynomial = x;
    else
        if useExpand
            % используем expand чтобы полином принял читаемый вид
            % для удобного в дальнейшем парсинга
            % прим. 3*x^2/2 - 1/2
            % минус: тормозит вычисления при n > 10
            polynomial = expand(((2*n-1)*x*legendre_polynomial(n-1, x)-(n-1)*legendre_polynomial(n-2, x))/n);
        else
            polynomial = ((2*n-1)*x*legendre_polynomial(n-1, x)-(n-1)*legendre_polynomial(n-2, x))/n;
        end
    end
    
end