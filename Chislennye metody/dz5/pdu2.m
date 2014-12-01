function y = pdu2(t, x)
    y = [x(2); 14 - 5.*x(2) - 7.*x(1)];
end