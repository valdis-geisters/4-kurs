clc, clear
%F = [2. 5.]; %celevaja funk
% A = [-1 -1; 1 2; 2 1]; %ogranic
% B = [-5; -14; -14]; %vektor pravoj casti
F = [2. 5.];
A = [1 0; -1 0; 0 1; 0 -1; 1 1; -1 -1; 1 2; -1 -2; 2 1; -2 -1];
B = [0; 0; 0; 0; 5; -5; 14; -14; 14; -14];
[x,fval, exitflag] = linprog(F, A, B)