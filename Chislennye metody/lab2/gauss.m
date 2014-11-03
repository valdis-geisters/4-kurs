function result = gauss(A,B)
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
        
        result = X;
    
    else
       disp('Gauss error. Invalid data.');
       result = 0;
    end
end