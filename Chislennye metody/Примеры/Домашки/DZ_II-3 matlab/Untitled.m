clc, clear, close all
x0 = [1 0.5];
t = [0 75];
[t, x] = ode45( 'FIle1_RF', t, x0 );
plot(t, x), grid on
figure(3), comet(x(:,1), x(:,2))