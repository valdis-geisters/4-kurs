:- [tree].                                % загрузили дерево
% :- [badtree].

findNode(Word, Id) :-                     % ищем лист по всем совпадениям
  nodeWord(Id, AWordB),                   % нашли id по всем совпадениям
  append(A, WordB, AWordB),
  append(Word, B, WordB).

pathToRoot(0, []).                        % останавливаемся, если ничего не найдено (изначально, либо в процессе поиска)
pathToRoot(Id, Result) :-                 % ищем и выводим все пути, либо путь
  parentChild(ParentId, Id),              % узнаем ид родителя, от полученного ид
  pathToRoot(ParentId, PathFromParent),   % рекурсивно вызываем самого себя, пока не дойдем до pathToRoot(0, [])
  Result = [Id | PathFromParent].         % записываем все в список(и)

search(Word, Path) :-                     % запуск поиска, вводим слово, получаем пути(ь) или не получаем
  findNode(Word, Id),
  pathToRoot(Id, Path).