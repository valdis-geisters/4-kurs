function res = fun2(x)
    res = diff(diff((log(x)^3) / (x^2) - 13)); % f''(x)
end