function [result, tmp] = orthogonal_approximation(x, y, k)
    if length(x) == length(y)
        n = k+1;
        m = length(x);
        Max = max(x);
        Min = min(x);
        
        a = zeros(n,n);
        b = zeros(n,1);
        
        % находим a
        for i=1:n           
            for j=1:n
               tmp = 0;
               
               for l=1:m
                 tmp = tmp + legendre_polynomials(j-1, x(1,l))*legendre_polynomials(i-1, x(1,l));  
               end
               
               a(i,j) = tmp;
            end
        end
        
        % находим b
        for i=1:n
            tmp = 0;
            
            for j=1:m
                tmp = tmp + y(1,j)*legendre_polynomials(i-1,x(1,j));
            end
            
            b(i, 1) = tmp;
        end
        
        %disp(a);
        %disp(b);
        
        gauss_res = gauss(a,b);
        
        tmp = 0;
        for i=0:k
            tmp = tmp + gauss_res(i+1,1)*legendre_polynomials(i);
        end
        %tmp = cellstr(char(tmp));
        tmp = char(tmp);
        disp(tmp);

        % поменять местами для вида a0 + a1x +a2x
        
        % копируем все символы до знака * (кроме ()), если после *
        % через два символа у нас число (степень) до сохраняем ее в
        % переменную, и продолжаем копировать до конца
        % если степени нет, сохраняем 2 в переменную
        % если нет знака *, то 1 в переменную
        % из скопированных символов получаем число
        % число вставляем в вектор в позицию указаную в переменной
        nn = length(tmp);
        tmp_str = cell(1,n);
        tmp_pos = zeros(1,n);
        pos = 1;
        change_pos = false;
        str_num = '';
        j = 1;
        i = 1;
        
        if tmp(i) == ' '
            str_num = [str_num, tmp(i+1)];
            i = i + 2;
        end
        while i <= nn
            if tmp(i) ~= ' '
                if tmp(i) == 'x'
                    change_pos = true;
                    if tmp(i+1) == '^'
                        pos = str2num(tmp(i+2))+1; 
                    else
                        pos = 2;
                    end
                end
                str_num = [str_num, tmp(i)];
            else
                tmp_str{j} = str_num;
                tmp_pos(j) = pos;

                if change_pos == true
                   pos = 1; 
                end
                
                str_num = '';
                str_num = [str_num, tmp(i+1)];
                i = i + 2;
                j = j + 1;
            end
            
            if i == nn
                tmp_str{j} = str_num;
                tmp_pos(j) = pos;
            end
               
            i = i + 1;
        end
        
        %disp(tmp_str(2));
        %disp(tmp_pos);
        
        result = zeros(1, n);
        nnn = length(tmp_str);
        for i=1:nnn
            nnnn = length(tmp_str{i});
            strstr = '';
            j = 1;
            while j <= nnnn
                if tmp_str{i}(j) ~= '*' && tmp_str{i}(j) ~= 'x' && tmp_str{i}(j) ~= '^'
                   strstr = [strstr, tmp_str{i}(j)]; 
                else
                   if tmp_str{i}(j) == '^'
                      j = j + 1; 
                   end
                end
                j = j + 1;
            end
            % disp(strstr);
            if length(strstr) ~= 0
                result(1, tmp_pos(i)) = str2num(strstr);
            end
        end
        
        result = fliplr(result);
        
        % точки для функции (рисуем график)
        x1 = Min:1e-2:Max;
        y1 = polyval(result,x1);
        
        plot(x1,y1,'k');
        grid on;
        
    else
        disp('Orthogonal approximation error. Invalid data.');
    end
end