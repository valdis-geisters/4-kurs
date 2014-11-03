function iter(a, b, n)
    
    if(fun(a)*fun(b) <= 0)
        Xi = zeros(n,1);
        FXi = zeros(n,1);
        E = zeros(n,1);
        
        Xi(1,1) = (a+b)/2;
        
        for i=1:n
            FXi(i,1) = fun(Xi(i,1));
            Xi(i+1,1) = fun2(Xi(i,1));
            
            if(i > 1)
                E(i,1) = abs(Xi(i,1) - Xi(i-1,1));
            end
        end
        
        disp('Xi=');
        disp(Xi);
        
        disp('Fxi=');
        disp(FXi);
        
        disp('E=');
        disp(E);
        
        disp('res=');
        disp(Xi(n,1));
    else
        disp('input error');
    end

end