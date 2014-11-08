function polynomials = legendre_polynomials(n, varargin)
    useExpand = false;
    
    if isempty(varargin)
        x = sym('x');
        useExpand = true;
    else
        x = varargin{1};
    end
          
    if n == 0
        polynomials = 1;
    elseif n == 1
        polynomials = x;
    else
        if useExpand
            polynomials = expand(((2*n-1)*x*legendre_polynomials(n-1, x)-(n-1)*legendre_polynomials(n-2, x))/n);
        else
            polynomials = ((2*n-1)*x*legendre_polynomials(n-1, x)-(n-1)*legendre_polynomials(n-2, x))/n;
        end
    end
end