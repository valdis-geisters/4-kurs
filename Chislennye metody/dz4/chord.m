function chord(a, b, n)
    
    if(fun(a)*fun(b) <= 0)
        A = zeros(n,1);
        B = zeros(n,1);
        X = zeros(n,1);
        FA = zeros(n,1);
        FB = zeros(n,1);
        FX = zeros(n,1);
        E = zeros(n,1);
        
        A(1,1) = a;
        B(1,1) = b;
        
        for i=1:n
            FA(i,1) = fun(A(i,1));
            FB(i,1) = fun(B(i,1));
            X(i,1) = B(i,1) - ((B(i,1)-(A(i,1))) / (FB(i,1)-(FA(i,1)))) * FB(i,1);

            FX(i,1) = fun(X(i,1));
            
            if(FA(i,1)*FX(i,1)<= 0)
                B(i+1,1) = X(i,1);
                A(i+1,1) = A(i,1);
            else
                A(i+1,1) = X(i,1);
                B(i+1,1) = B(i,1);
            end
            
            if(i > 1)
                E(i,1) = abs(X(i,1) - X(i-1,1));
            end
        end
        
        disp('A=');
        disp(A);
        
        disp('B=');
        disp(B);
        
        disp('X=');
        disp(X);
        
        disp('FA=');
        disp(FA);
        
        disp('FB=');
        disp(FB);
        
        disp('FX=');
        disp(FX);
        
        disp('E=');
        disp(E);
        
        disp('res=');
        disp(X(n,1));
    else
        disp('input error');
    end

end