% дерево будем строить на фактах практически так же
% как это было в книге Братко в примере с родителями
% parentChild(parent_id, child_id)
% modeWord(id, word)

parentChild(0, 1).
parentChild(1, 2).
parentChild(1, 3).
parentChild(1, 4).
parentChild(2, 3).
parentChild(2, 5).
parentChild(3, 6).
parentChild(5, 3).

nodeWord(1, "lol").
nodeWord(2, "omg").
nodeWord(3, "pwnd!!!111lol").
nodeWord(4, "pwnd").
nodeWord(5, "wtf").
nodeWord(6, "haha").

% двойные кавычки, потому что так мы получим список кодов символов