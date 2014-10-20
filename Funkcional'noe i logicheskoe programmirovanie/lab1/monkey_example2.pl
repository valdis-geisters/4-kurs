%pervie 4 vozmoznih shaga - prosto ot dveri v seredinu,
%iz seredinu k oknu i naoborot
step(state(door,floor,C,D),state(middle,floor,C,D)).
step(state(middle,floor,C,D),state(window,floor,C,D)).
step(state(window,floor,C,D),state(middle,floor,C,D)).
step(state(middle,floor,C,D),state(door,floor,C,D)).

%esli obezyana ryadom s yashikom, to ona mozet zalezt na nego
step(state(A,floor,A,no),state(A,box,A,no)).

%esli obezyana na polu ryadom s yashikom, to mozet ego dvigat
step(state(door,floor,door,D),state(middle,floor,middle,D)).
step(state(middle,floor,middle,D),state(window,floor,window,D)).
step(state(window,floor,window,D),state(middle,floor,middle,D)).
step(state(middle,floor,middle,D),state(door,floor,door,D)).

%esli obezyana v seredine na yashike i eshe ne imeet banan,
%to mozet ego vzyat
step(state(middle,box,middle,no),state(middle,box,middle,yes)).

%prosto dlya vivida sostoyaniya v slovesnoi forme
print_station(state(A,B,C,D)):-write('obezyana stoit '),
(A=door,write(' u dveri '); A=middle,write('v seredine komnati '); A=window,write('u okna ')),
(B=floor,write('na polu, ');B=box,write('na yashike, ')),
(B=floor,(C=door,write('yashik stoit u dveri, ');C=middle,write('yashik stoit v seredine komnati, ');C=window,write('yashik stoit u okna, '));B=box),
(D=yes,write('uze vzyala banan');D=no,write('eshe ne vzyala banan')),nl.

%dlya vivoda vsego puti
print_way([]).
print_way([A|Tail]) :- print_station(A),nl,print_way(Tail).

%proverka ne vhodilo li uze takoe sostoyanie v proidennii put,
%chtobi izbezat zaciklivaniya
proverka(A,B,Way) :- step(A,B), not(member(B,[A|Way])).

width_search( Start, Result) :- width( [[Start]] , Result),!.

%esli dostigli rezultata, to konchaem poisk i vivodim otvet
width( [[Result | Way ]|_], Result) :- reverse([Result|Way], RWay),print_way(RWay).
%inache nahodim vse sostoyaniya v kotorie mozno pereiti iz tekushego,
%dobovlyaem v spisok putei novii puti uze s uchetom novogo sostoyaniya,
%i rekursivno vizivaem poisk. Esli chto-to ne poluchilos, to perehodim r
%rassmotreniyu sleduyushego po spisku puti.
width( [ [Temp| Way] | B], Result ) :- setof( [Next, Temp | Way ], proverka(Temp,Next,Way) , A),
append(B, A, Way1), !, width( Way1, Result); width( B, Result).
