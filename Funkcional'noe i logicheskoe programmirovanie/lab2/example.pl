% solution(BoardPosition), если BoardPosition список ненападающих ферзей

solution([]).

solution([X/Y | Others]) :-         % Первый ферзь в клетке X/Y
  solution(Others),                 % Others - список прочих ферзей
  member(Y, [1,2,3,4,5,6,7,8]),
  noattack(X/Y, Others).            % Первый ферзь не нападает на других

noattack(_, []).                    % Объект для нападения отсутствует

noattack(X/Y, [X1/Y1 | Others]) :-
  Y =\= Y1,                         % Разные координаты Y
  Y1-Y =\= X1-X,                    % Разные диагонали
  Y1-Y =\= X-X1,
  noattack(X/Y, Others).

member(Item, [Item | Rest]).

member(Item, [First | Rest]) :-
  member(Item, Rest).

% Образец решения

template([1/Y1, 2/Y2, 3/Y3, 4/Y4, 5/Y5, 6/Y6, 7/Y7, 8/Y8]).