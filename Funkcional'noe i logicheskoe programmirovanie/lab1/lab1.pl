% Водитель транспорта должен отвезти преступников в КПЗ
% Микроавтобус находится в сервисе (уже починен)
% Преступники задержаны в банке у сейфа
% Водитель находится дома (на даче)

% Начальное состояние мира:
  % 1. Водитель дома (home)
  % 2. Водитель не за рулем транспорта (not_in_the_car)
  % 3. Транспорт в сервисе (service)
  % 4. Преступники в банке (bank)
  % 5. Преступники не в транспорте (not_in_the_car)
% state(home, not_in_the_car, service, bank, not_in_the_car)

% Цель - отвезти преступников к КПЗ: state(_, _, _, jail, _)

% Действия:
  % 1. отвезти в кпз (drive_to)
  % 2. посадить в транспорт (put_in)
  % 3. приехать в банк (drive_to)
  % 4. сесть за руль (get_in)
  % 5. прийти в сервис (go_to)

move(
  state(bank, in_the_car, bank, bank, in_the_car),
  go_to(bank, jail),
  state(jail, in_the_car, jail, jail, in_the_car)
).

move(
  state(bank, in_the_car, bank, bank, not_in_the_car),
  put_in,
  state(bank, in_the_car, bank, bank, in_the_car)
).

move(
  state(Loc1, in_the_car, Loc1, bank, not_in_the_car),
  drive_to(Loc1, Loc2),
  state(Loc2, in_the_car, Loc2, bank, not_in_the_car)
).

move(
  state(Loc1, not_in_the_car, Loc1, bank, not_in_the_car),
  get_in,
  state(Loc1, in_the_car, Loc1, bank, not_in_the_car)
).

move(
  state(Loc1, not_in_the_car, CarLoc, bank, not_in_the_car),
  go_to(Loc1, Loc2),
  state(Loc2, not_in_the_car, CarLoc, bank, not_in_the_car)
).

canget(state(_, _, _, jail, _), []).
canget(State1, [Move | Tail]) :-
  move(State1, Move, State2),
  canget(State2, Tail).

victory(State, List) :-
  canget(State, List), !.