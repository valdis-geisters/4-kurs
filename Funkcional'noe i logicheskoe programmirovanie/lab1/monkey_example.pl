% move(State1, Move, State2) - выполнение действия Move в состоянии State1
% обеспечивает переход в состояние State2; состояние представлено термом:
% state(MonkeyHorizontal, MonkeyVertical, BoxPosition, HasBanana)

move(
  state(middle, onbox, middle, hasnot), % до выполнения действия
  grasp,                                % схватить банан
  state(middle, onbox, middle, has)     % после выполнения действия
).

move(
  state(P, onfloor, P, H),
  climb,                                % забраться на ящик
  state(P, onbox, P, H)
).

move(
  state(P1, onfloor, P1, H),
  push(P1, P2),                         % передвинуть ящик из P1 в P2
  state(P2, onfloor, P2, H)
).

move(
  state(P1, onfloor, B, H),
  walk(P1, P2),                         % перейти из P1 в P2
  state(P2, onfloor, B, H)
).

% canget(State): обезьяна может взять банан в cостоянии State

canget(state(_, _, _, has)).  % can 1: обезьяна уже получила бананом

canget(State1) :-             % can 2: проделать некоторую работу что бы получить банан
  move(State1, Move, State2), % сделать что-то
  canget(State2).             % получить банан