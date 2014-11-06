function polynomials = legendre_polynomials(n, x)
    %if(n >= 0 && abs(x) <= 1)
        
        if(n == 0)
            polynomials = 1;
        elseif(n == 1)
            polynomials = x;
        else
            polynomials = ((2*n-1)*x*legendre_polynomials(n-1, x)-(n-1)*legendre_polynomials(n-2, x))/n;
        end
        
    %else
    %    disp('Legendre polynomials error. Invalid input data.');
    %end
end