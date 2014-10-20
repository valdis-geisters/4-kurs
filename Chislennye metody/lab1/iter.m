function X = iter(A,B,e)
    [m,n]=size(A);

    if(m == n && m == length(B) && det(A) ~= 0)
        convergence=true;

        for i=1:n
            a = abs(A(i,i));
            row_sum = sum(abs(A(i,:))) - a;
            col_sum = sum(abs(A(:,i))) - a;
            if (a < row_sum) || (a < col_sum)
                convergence = false;
                break;
            end
        end
        
        if convergence == true
            alpha = zeros(m,n);
            beta = zeros(m,1);
            X0 = beta;

            for i=1:n
               beta(i) = B(i)/A(i,i);
               for j=1:n
                  if i~=j
                     alpha(i,j) = -A(i,j)/A(i,i); 
                  end
               end
            end
            
            iter_count = 1;
            Xj = alpha*X0 + beta;
            while norm(Xj - X0) > e
                X0 = Xj;
                Xj = alpha*X0 + beta;
                iter_count = iter_count + 1;
            end

            X = Xj;
            
            check = zeros(m,1);
            for i=1:n
                tmp = 0;
                for j=1:n
                    tmp = tmp + A(i,j)*X(j,1);
                end
                check(i) = tmp;
            end
            
            X
            check
            iter_count

        else
           disp('convergence == false. exit'); 
        end

    else
        disp('invalid data. exit');
    end
end
