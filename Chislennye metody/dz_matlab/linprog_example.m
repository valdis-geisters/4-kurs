% целевая функция: F(x1,x2,x3,x4) = 3x1+5x2+4x3+8x4
% ограничения:
% x1+x2 <= 60  -x1-x2 <= -60
% x3+x4 <= 40  -x3-x4 <= -40
% x1+x3 <= 30  -x1-x3 <= -30
% x2+x4 <= 70  -x2-x4 <= -70
% -x1 <= 0; -x2 <= 0; -x3 <= 0; -x4 <= 0

% целевая функция
F = [3. 5. 4. 8.];

% коээфиценты в ограничениях
A = [1 1 0 0; -1 -1 0 0; 0 0 1 1; 0 0 -1 -1; 1 0 1 0; -1 0 -1 0; 0 1 0 1; 0 -1 0 -1; -1 0 0 0; 0 -1 0 0; 0 0 -1 0; 0 0 0 -1];

% правые части в ограничениях
B = [60 -60 40 -40 30 -30 70 -70 0 0 0 0];

% решение
x = linprog(F, A, B)

% минимально возможные транспортные расходы
TRR = F * x