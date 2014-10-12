function X = gauss(A,B)
    C=[A, B];
    [m,n] = size(A);

    if(m == n && m == length(B) && det(A) ~= 0)
    
        % ведущий элемент
        for i=1:(n-1)
           max = abs(C(i,i));
           maxj = i;
           row = C(i,:);
           
           for j=(i+1):n
               if(max<abs(C(j,i)))
                   max = abs(C(j,i));
                   maxj = j;
               end
           end
           
           C(i,:) = C(maxj,:);
           C(maxj,:) = row;
        end
        
        % прямой ход
        for i=1:(n-1)
            a = C(i,i);

            %if(a == 0)
            %    for k=i+1:n
            %        b = C(k,i);
            %        if (b ~= 0)
            %            C(i,:) = C(i,:) + C(k,:);
            %            a = C(i,i);
            %            break;
            %        end
            %    end
            %end

            for j=(i+1):n
                b = -C(j,i)/a;
                row = C(i,:) * b;
                C(j,:) = C(j,:) + row;
            end

        end

        X = zeros(n,1);
        [m,n] = size(C);

        % обратный ход
        for i=m:-1:1
            x = C(i,n);

            c = m;
            for j=i:m-1
                x = x - (C(i,c)*(X(c,1)));
                c = c - 1;
            end

            X(i,1) = x/C(i,i);
        end
        
        check = zeros(m,1);
        for i=1:m
            tmp = 0;
            for j=1:m
                tmp = tmp + A(i,j)*X(j,1);
            end
            check(i) = tmp;
        end
        
        X
        check
    
    else
       disp('invalid data. exit'); 
    end
end