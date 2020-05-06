
% Тестові дані
% Приклад бінарного дерева
% tree(tree(tree(nil, 'a', nil), 'b', tree(nil, 'c', nil)), 'd', tree(tree(tree(nil, 'e', nil), 'f', tree(nil, 'g', nil)), 'h', tree(nil, 'i', tree(nil, 'g', nil))))
% 
% Приклад 2-3 дерева 
% v2(v2(v3(v2(nil, 'a', nil),'b',v2(nil,'c',nil),'d',v2(nil,'e',nil)),'f',v2(v2(nil,'g',nil),'h',v2(nil,'i',nil))),'g',v2(v3(v2(nil,'k',nil),'l',v2(nil,'m',nil),'n',v2(nil,'o',nil)),'p',v2(nil,'q',nil)))


%Запуски для тестування
% inOrderTreeTraversal(tree(tree(tree(nil, 'a', nil), 'b', tree(nil, 'c', nil)), 'd', tree(tree(tree(nil, 'e', nil), 'f', tree(nil, 'g', nil)), 'h', tree(nil, 'i', tree(nil, 'g', nil))))).
% treePower(tree(tree(tree(nil, 'a', nil), 'b', tree(nil, 'c', nil)), 'd', tree(tree(tree(nil, 'e', nil), 'f', tree(nil, 'g', nil)), 'h', tree(nil, 'i', tree(nil, 'g', nil)))), Power).
% treeHeight(tree(tree(tree(nil, 'a', nil), 'b', tree(nil, 'c', nil)), 'd', tree(tree(tree(nil, 'e', nil), 'f', tree(nil, 'g', nil)), 'h', tree(nil, 'i', tree(nil, 'g', nil)))), Height).
% treeNoodePower(tree(tree(tree(nil, 'a', nil), 'b', tree(nil, 'c', nil)), 'd', tree(tree(tree(nil, 'e', nil), 'f', tree(nil, 'g', nil)), 'h', tree(nil, 'i', tree(nil, 'g', nil)))), NodePower).
% ifBinaryTree(tree(tree(tree(nil, 'a', nil), 'b', tree(nil, 'c', nil)), 'd', tree(tree(tree(nil, 'e', nil), 'f', tree(nil, 'g', nil)), 'h', tree(nil, 'i', tree(nil, 'g', nil))))).
% inOrder23TreeTraversal(v2(v2(v3(v2(nil, 'a', nil),'b',v2(nil,'c',nil),'d',v2(nil,'e',nil)),'f',v2(v2(nil,'g',nil),'h',v2(nil,'i',nil))),'g',v2(v3(v2(nil,'k',nil),'l',v2(nil,'m',nil),'n',v2(nil,'o',nil)),'p',v2(nil,'q',nil)))).
% find23Tree('g',v2(v2(v3(v2(nil, 'a', nil),'b',v2(nil,'c',nil),'d',v2(nil,'e',nil)),'f',v2(v2(nil,'g',nil),'h',v2(nil,'i',nil))),'g',v2(v3(v2(nil,'k',nil),'l',v2(nil,'m',nil),'n',v2(nil,'o',nil)),'p',v2(nil,'q',nil)))).
% if23Tree(v2(v2(v3(v2(nil, 'a', nil),'b',v2(nil,'c',nil),'d',v2(nil,'e',nil)),'f',v2(v2(nil,'g',nil),'h',v2(nil,'i',nil))),'g',v2(v3(v2(nil,'k',nil),'l',v2(nil,'m',nil),'n',v2(nil,'o',nil)),'p',v2(nil,'q',nil)))).





% Написати програму, яка здійснює обхід бінарного дерева зліва-направо.

inOrderTreeTraversal(X) :- inOrderTreeTraversal(X, XS), atomic_list_concat(XS, ',', A), writeln(A), !.
inOrderTreeTraversal(nil, []).
inOrderTreeTraversal(tree(L, X, R), XS) :- inOrderTreeTraversal(L, L1), inOrderTreeTraversal(R, Rs1),
    append(L1,[X|Rs1],XS).

% Написати програму, яка б визначала кількість вершин-листків в бінарному дереві.

treePower(nil,0).
treePower(tree(nil, _, nil),1).
treePower(tree(L, _, R), Power) :- treePower(L, Ls), treePower(R, Rs), Power is Ls + Rs, !.

% Написати програму, яка знаходила б висоту бінарного дерева

treeHeight(nil, 0).
treeHeight(tree(L, _, R1), Height) :- treeHeight(L, LS), treeHeight(R1, RS),TempH is max(LS, RS), Height is 1+TempH.

% Написати програму, яка визначає кількість вузлів у бінарному дереві.

treeNoodePower(nil,0).
treeNoodePower(tree(L, _, R), NodesPower) :- treeNoodePower(L, LS), treeNoodePower(R, RS), NodesPower is 1 + LS + RS.


% Написати програму, яка перевірить чи є заданий об'єкт бінарним дереовом

ifBinaryTree(nil).
ifBinaryTree(tree(L, _, R)) :- ifBinaryTree(L), ifBinaryTree(R).

% Написати програму обходу 2-3-дерева

help1(nil).
help1(tree(T)) :- format("~a, ", [T]).
help1(v2(V1, T, V2)) :- help1(V1), 
    					format("~a, ",[T]),
    					help1(V2).
help1(v3(V1, T1, V2, T2, V3)) :- help1(V1),
    							 format("~a, ",[T1]),
                                 help1(V2), 
                                 format("~a, ",[T2]),
                                 help1(V3).

inOrder23TreeTraversal(T) :- help1(T).

% Написати програму пошуку заданого елемента в 2-3-дереві

find23Tree(X, v2(_, X, _)) :- !.
find23Tree(X, v3(_, X, _, _, _)) :- !.
find23Tree(X, v3(_, _, _, X, _)) :- !.
find23Tree(X, v2(T, _, _)) :- find23Tree(X, T).
find23Tree(X, v2(_, _, T)) :- find23Tree(X, T).
find23Tree(X, v3(T1, _, T2, _, T3)) :- find23Tree(X,T1), find23Tree(X,T2), find23Tree(X,T3).
 

% Написати програму, яка перевірить чи є заданий об'єкт 2-3 деревом

if23Tree(nil).
if23Tree(v2(T1, _, T2)):- if23Tree(T1), if23Tree(T2).
if23Tree(v3(T1, _, T2, _, T3)) :- if23Tree(T1), if23Tree(T2), if23Tree(T3).

