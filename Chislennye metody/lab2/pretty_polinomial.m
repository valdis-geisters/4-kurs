function prettyPolinomial = pretty_polinomial(expression, m)
    
    expression = char(expression);
    % disp(expression);
    n = length(expression);
    strArray = cell(1,n);
    positionArray = zeros(1,n);
    str = '';
    position = 1;
    isChangedPosition = false;
    i = 1;
    j = 1;
    
    % исп. если выражение начинается с _-_
    % где _ пробел
    if expression(1,i) == ' '
       str = [str, expression(i+1)];
       i = i + 2;
    end
    
    % разделяем на коэф.
    while i <= n
        if expression(1,i) ~= ' '
            
            if expression(1,i) == 'x'
                isChangedPosition = true;
                
                if expression(1,i+1) == '^'
                    num = '';
                    l = i + 2;
                    while expression(1,l) ~= ')'
                        num = [num, expression(1,l)];
                        l = l + 1;
                    end
                    i = l;
                    position = str2num(num) + 1;
                else
                    position = 2;
                end
            end
            
            str = [str, expression(1,i)];
        else
            strArray{1,j} = str;
            positionArray(1,j) = position;
            
            if isChangedPosition
                position = 1;
                isChangedPosition = false;
            end
            
            str = '';
            str = [str, expression(1,i+1)];
            
            i = i + 2;
            j = j + 1;
        end
        
        if i == n
           strArray{1,j} = str;
           positionArray(1,j) = position;
        end
        
        i = i + 1;
    end
    
    n = m;
    polinomial = zeros(1,n);
    
    % disp(strArray);
    
    % чистим от не нужного мусора
    for i=1:n
        m = length(strArray{i});
        str = '';
        j = 1;
        
        while j<= m
            if strArray{i}(j) ~= '*' && strArray{i}(j) ~= 'x' && strArray{i}(j) ~= '^'
                str = [str, strArray{i}(j)];
            else
               if strArray{i}(j) == '^'
                  j = j + 1; 
               end
            end
            
            j = j + 1;
        end
        
        if length(str) ~= 0
           polinomial(1, positionArray(1,i)) = str2num(str); 
        end
    end
    
    prettyPolinomial = fliplr(polinomial);
    
end