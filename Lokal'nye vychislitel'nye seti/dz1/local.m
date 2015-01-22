%bin=[1 1 0 1 0 0 0 0 1 0 0 1 0 0 1 0 1 1 0 1 0 0 0 0 1 0 1 1 1 0 1 1 1 1 0 1 0 0 0 0 1 0 1 1 0 0 0 0 1 1 0 1 0 0 0 0 1 0 1 1 0 1 0 0 1 1 0 1 0 0 0 0 1 0 1 1 1 0 0 0 1 1 0 1 0 0 0 1 1 0 0 0 0 0 0 1 1 1 0 1 0 0 0 0 1 0 1 1 1 0 1 1 1 1 0 1 0 0 0 0 1 0 1 1 0 0 0 0 1 1 0 1 0 0 0 0 1 0 1 1 0 0 1 0 0 0 1 0 0 0 0 0 1 1 0 1 0 0 0 0 1 0 0 1 0 0 0 1 1 1 0 1 0 0 0 0 1 0 1 1 0 0 0 0 1 1 0 1 0 0 0 1 1 0 0 0 0 0 0 0 1 1 0 1 0 0 0 0 1 0 1 1 1 0 1 0 1 1 0 1 0 0 0 0 1 0 1 1 1 1 1 0 1 1 0 1 0 0 0 0 1 0 1 1 0 0 1 0 1 1 0 1 0 0 0 1 1 0 0 0 0 0 0 1 1 1 0 1 0 0 0 0 1 0 1 1 1 0 1 0 1 1 0 1 0 0 0 0 1 0 1 1 1 0 0 0 1 1 0 1 0 0 0 0 1 0 1 1 1 0 0 1 0 0 1 0 0 0 0 0 1 1 0 1 0 0 0 0 1 0 1 0 1 1 0 1 1 1 0 1 0 0 0 1 1 0 0 0 0 0 0 0 1 1 0 1 0 0 0 0 1 0 1 1 1 0 0 0 1 1 0 1 0 0 0 0 1 0 1 1 1 0 1 0 1 1 0 1 0 0 0 0 1 0 1 1 1 1 1 0 1 1 0 1 0 0 0 0 1 0 1 1 0 0 1 0 1 1 0 1 0 0 0 0 1 0 1 1 1 0 0 0 1 1 0 1 0 0 0 1 1 0 0 0 0 1 1 1];

str = 'Выползов Виктор Сергеевич';
bin = dec2bin(str)';
bin = bin(:)'-'0';

%clock
n=length(bin)*4;

Xclock=zeros(1,n);
Yclock=zeros(1,n);

x=0;
y=15;
change_x=true;
change_y=false;
for i=1:n
    Xclock(1,i)=x;
    Yclock(1,i)=y;
    
    if(change_x == true)
        x = x + 1;
        change_x = false;
    else
        change_x = true;
    end
    
    if(change_y == true)
        if(y == 15)
            y = 13;
        else
            y = 15;
        end
        change_y = false;
    else
        change_y = true;
    end;
end

%data
n=length(bin);

m = 0;
for i=1:n
    if(bin(1,i) == 1)
        m = m + 1;
    end
end

m = n + m + 1;
Xdata=zeros(1,m);
Ydata=zeros(1,m);

x = 0;
if(bin(1,1) == 1)
    y = 12;
    one = true;
    zero = false;
else
    y = 10;
    one = false;
    zero = true;
end

j = 1;
for i=1:n
    if(bin(1,i) == 1)
        if(one == true)
            Xdata(1,j) = x;
            Ydata(1,j) = y;
            
            j = j + 1;
            x = x + 2;
        else
            Xdata(1,j) = x;
            Ydata(1,j) = y;
            
            y = 12;
            j = j + 1;
            
            Xdata(1,j) = x;
            Ydata(1,j) = y;
            
            j = j + 1;
            x = x + 2;
            one = true;
            zero = false;
        end
    else
        if(zero == true)
            Xdata(1,j) = x;
            Ydata(1,j) = y;
           
            j = j + 1;
            x = x + 2;
        else
            Xdata(1,j) = x;
            Ydata(1,j) = y;
           
            y = 10;
            j = j + 1;
           
            Xdata(1,j) = x;
            Ydata(1,j) = y;
           
            j = j + 1;
            x = x + 2;
            one = false;
            zero = true;
        end
    end
end

if(bin(1,n) == 1)
    if(one == true)
        Xdata(1,j) = x;
        Ydata(1,j) = y;
            
        j = j + 1;
        x = x + 2;
    else
        Xdata(1,j) = x;
        Ydata(1,j) = y;
            
        y = 12;
        j = j + 1;
            
        Xdata(1,j) = x;
        Ydata(1,j) = y;
            
        j = j + 1;
        x = x + 2;
        one = true;
        zero = false;
    end
else
    if(zero == true)
        Xdata(1,j) = x;
        Ydata(1,j) = y;
           
        j = j + 1;
        x = x + 2;
    else
        Xdata(1,j) = x;
        Ydata(1,j) = y;
           
        y = 10;
        j = j + 1;
           
        Xdata(1,j) = x;
        Ydata(1,j) = y;
           
        j = j + 1;
        x = x + 2;
        one = false;
        zero = true;
    end
end

%Manchester
n=length(bin);
x = 0;
first = true;
for i=1:n
    if(first==true)
        if(bin(1,i) == 1)
            y = 7;
    
            Xman = x;
            Yman = y;
            x = x + 1;
    
            Xman = [Xman, x];
            Yman = [Yman, y];
            y = 9;
    
            Xman = [Xman, x];
            Yman = [Yman, y];
            x = x + 1;
    
            Xman = [Xman, x];
            Yman = [Yman, y];
        else
            y = 9;
    
            Xman = x;
            Yman = y;
            x = x + 1;
    
            Xman = [Xman, x];
            Yman = [Yman, y];
            y = 7;
    
            Xman = [Xman, x];
            Yman = [Yman, y];
            x = x + 1;
    
            Xman = [Xman, x];
            Yman = [Yman, y];
        end
        first = false;
    else
        if(bin(1,i) == 1)
            y = 7;
    
            Xman = [Xman, x];
            Yman = [Yman, y];
            x = x + 1;
    
            Xman = [Xman, x];
            Yman = [Yman, y];
            y = 9;
    
            Xman = [Xman, x];
            Yman = [Yman, y];
            x = x + 1;
    
            Xman = [Xman, x];
            Yman = [Yman, y];
        else
            y = 9;
    
            Xman = [Xman, x];
            Yman = [Yman, y];
            x = x + 1;
    
            Xman = [Xman, x];
            Yman = [Yman, y];
            y = 7;
    
            Xman = [Xman, x];
            Yman = [Yman, y];
            x = x + 1;
    
            Xman = [Xman, x];
            Yman = [Yman, y];
        end
    end
end

%Differential Manchester
n=length(bin);
x = 0;
first = true;
r = true;
 for i=1:n
    if(first == true)
        if(bin(1,i) == 1 && r == true)
            y = 6;
            
            Xdman = x;
            Ydman = y;
            x = x + 1;
            
            Xdman = [Xdman, x];
            Ydman = [Ydman, y];
            y = 4;
            
            Xdman = [Xdman, x];
            Ydman = [Ydman, y];
            x = x + 1;
            
            Xdman = [Xdman, x];
            Ydman = [Ydman, y];
            
            r = false;
        elseif(bin(1,i) == 1 && r == false)
            y = 4;
            
            Xdman = x;
            Ydman = y;
            x = x + 1;
            
            Xdman = [Xdman, x];
            Ydman = [Ydman, y];
            y = 6;
            
            Xdman = [Xdman, x];
            Ydman = [Ydman, y];
            x = x + 1;
            
            Xdman = [Xdman, x];
            Ydman = [Ydman, y];
            
            r = true;
        elseif(bin(1,i) == 0 && r == true)
            y = 4;
            
            Xdman = x;
            Ydman = y;
            x = x + 1;
            
            Xdman = [Xdman, x];
            Ydman = [Ydman, y];
            y = 6;
            
            Xdman = [Xdman, x];
            Ydman = [Ydman, y];
            x = x + 1;
            
            Xdman = [Xdman, x];
            Ydman = [Ydman, y];
            
            r = true;
        else
            y = 6;
            
            Xdman = x;
            Ydman = y;
            x = x + 1;
            
            Xdman = [Xdman, x];
            Ydman = [Ydman, y];
            y = 4;
            
            Xdman = [Xdman, x];
            Ydman = [Ydman, y];
            x = x + 1;
            
            Xdman = [Xdman, x];
            Ydman = [Ydman, y];
            
            r = false;
        end
       first = false; 
    else
        if(bin(1,i) == 1 && r == true)
            y = 6;
            
            Xdman = [Xdman, x];
            Ydman = [Ydman, y];
            x = x + 1;
            
            Xdman = [Xdman, x];
            Ydman = [Ydman, y];
            y = 4;
            
            Xdman = [Xdman, x];
            Ydman = [Ydman, y];
            x = x + 1;
            
            Xdman = [Xdman, x];
            Ydman = [Ydman, y];
            
            r = false;
        elseif(bin(1,i) == 1 && r == false)
            y = 4;
            
            Xdman = [Xdman, x];
            Ydman = [Ydman, y];
            x = x + 1;
            
            Xdman = [Xdman, x];
            Ydman = [Ydman, y];
            y = 6;
            
            Xdman = [Xdman, x];
            Ydman = [Ydman, y];
            x = x + 1;
            
            Xdman = [Xdman, x];
            Ydman = [Ydman, y];
            
            r = true;
        elseif(bin(1,i) == 0 && r == true)
            y = 4;
            
            Xdman = [Xdman, x];
            Ydman = [Ydman, y];
            x = x + 1;
            
            Xdman = [Xdman, x];
            Ydman = [Ydman, y];
            y = 6;
            
            Xdman = [Xdman, x];
            Ydman = [Ydman, y];
            x = x + 1;
            
            Xdman = [Xdman, x];
            Ydman = [Ydman, y];
            
            r = true;
        else
            y = 6;
            
            Xdman = [Xdman, x];
            Ydman = [Ydman, y];
            x = x + 1;
            
            Xdman = [Xdman, x];
            Ydman = [Ydman, y];
            y = 4;
            
            Xdman = [Xdman, x];
            Ydman = [Ydman, y];
            x = x + 1;
            
            Xdman = [Xdman, x];
            Ydman = [Ydman, y];
            
            r = false;
        end
    end
 end

%nrzi
n=length(bin);
x = 0;
y = 1;
first=true;
for i=1:n
    if(bin(1,i) == 1)
        if(y == 3)
            y = 1;
        else
            y = 3;
        end
    end

    if(first == true)
        Xnrzi = x;
        Ynrzi = y;

        first = false; 
    else
        Xnrzi = [Xnrzi, x];
        Ynrzi = [Ynrzi, y];  
    end

    x = x + 2;

    Xnrzi = [Xnrzi, x];
    Ynrzi = [Ynrzi, y];
end

%tick
x = 2;
n=length(bin);
hold on;
for i=1:n
    line([x x], [0 13], 'LineStyle', ':', 'Color', [0 0 0]);
    x = x + 2;
end

n=length(bin)*2;
plot(Xclock,Yclock,'red',Xdata,Ydata,'blue',Xman,Yman,'green',Xdman,Ydman,'magenta',Xnrzi,Ynrzi,'cyan');
axis([0 32 0 16]);

set(gca,'YColor','w');
set(gca,'XColor','w');
set(gca,'XTick',[]);
set(gca,'YTick',[]);

