:- use_module(library(apply)).
% Предикат, що здійснює циклічний зсув елементів списку на один вправо.

step(R, [H|T]) :- append(T, [H], R).

% Предикат, який перетворює вихідний список у список позицій від'ємних елементів.
task1(X, R) :- task1(X, [], 0, R).
task1([], X, _, R) :- reverse(X, R), !.
task1([L|T], X, I, R) :- L < 0,
                             NEXT is I + 1,
                             task1(T, [I|X], NEXT, R).
task1([L|T], X, I, R) :- L >= 0,
                             NEXT is I + 1,
                             task1(T, X, NEXT, R).
							 

% Предикат, що замінює всі входження заданого елемента на символ change_done.
change(X, XS, R) :- change(X, 'change_done', XS, R),!.
change(_, _, [], []).
change(X, M, [X|T1], [M|T2]) :- change(X, M, T1, T2).
change(X, M, [H|T1], [H|T2]) :- H \= X, change(X, M, T1, T2). 


% Предикат, що перетворює будь-який список арабських чисел (від 1 до 50) у список відповідних їм римських чисел.
converter(X, _):- X<0, !, fail.
converter(0, []).
converter(X, ['I'|R]) :- X < 4, Y is X - 1, converter(Y, R).
converter(4, ['IV']).
converter(5, ['V']).
converter(X, ['V'|R]) :- X < 9, Y is X - 5, converter(Y, R).
converter(9, ['IX']).
converter(X, ['X'|R]) :- X < 40, Y is X - 10, converter(Y, R).
converter(X, ['XL'|R]) :- X < 50, Y is X - 40, converter(Y, R).
converter(X, ['L'|R]) :- X<90,Y is X - 50, converter(Y, R).
converter(X, ['XC'|R]) :- X < 100, Y is X - 90, converter(Y, R).
converter(X, ['C'|R]) :- X < 400, Y is X - 100, converter(Y, R).
converter(X, ['CD'|R]) :- X < 500, Y is X - 400, converter(Y, R).
converter(X, ['D'|R]) :- X < 900, Y is X - 500, converter(Y, R).
converter(X, ['CM'|R]) :- X < 1000, Y is X - 900, converter(Y, R).
converter(X, ['M'|R]) :- Y is X - 1000, converter(Y, R).

concatList([],Y,Y):-!. 
concatList([X|L],Y,Res):- atom_concat(X, Y, Y1),concatList(L,Y1,Res).


temp2([],Y,Y):-!.
temp2([H|T],Y,Res):- converter(H,Romanian),reverse(Romanian,R),concatList(R,'',R1), append([R1],Y,Y1),help2(T,Y1,Res).

convToRome(X,R):- temp2(X,[],Res),reverse(Res,T),append(T,[],R).


% Предикат, що реалізує множення матриці (список списків) на вектор.

help3([], [], X, X).
help3([H|T], [H1|V], RES, R) :- R1 is RES + (H * H1),
                                   help3(T, V, R1, R).

help2([], _, L, X) :- reverse(X, L), !.
help2([ROW|MAT], VEC, RES, X) :- help3(ROW, VEC, 0, Row),
                                help2(MAT, VEC, RES, [Row|X]).
	
multM(M, V, Res) :- help2(M, V, Res, []).


%Приклади 
% step(R,[1,2,4,1,2,1,12]). має бути "R = [2,4,1,2,1,12,1]"
% task1([1,-2,3,-4,0], R). має бути "R= [1,3]"
% change(1, [1,2,3],R). має бути "R = [change_done,2,3]"
% convertRomanian([1,4,6,150], Y). має бути "R = ['I','IV','VI','CL']"
% multM([[1,2,3],[4,5,6],[1,4,1]], [2,4,5], X). має бути "X = [25,58,23]"