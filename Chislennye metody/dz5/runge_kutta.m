function [y, z, t] = runge_kutta()

    y = 5;
    z = 10;
    a = 0;
    b = 2;
    h = 0.07558;
    
    t = 0;
    i = 1;
    while t(1, i) < b
        
        f1 = z(1, i);
        g1 = pdu(y(1, i), z(1, i));
        
        f2 = z(1, i) + (h/2)*(g1);
        g2 = pdu((y(1, i)+(h/2)*f1), (z(1, i)+(h/2)*g1));
        
        f3 = z(1, i) + (h/2)*(g2);
        g3 = pdu((y(1, i)+(h/2)*f2), (z(1, i)+(h/2)*g2));
        
        f4 = z(1, i) + (h)*(g3);
        g4 = pdu((y(1, i)+(h)*f3), (z(1, i)+(h)*g3));
        
        y = [y (y(1, i) + (h/6)*(f1+2*f2+2*f3+f4))];
        z = [z (z(1, i) + (h/6)*(g1+2*g2+2*g3+g4))];
        
        t = [t (t(1, i) + h)];
        i = i + 1;
         
    end

end