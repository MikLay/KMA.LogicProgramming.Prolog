% Запуски для тестування
 
% ifAVLTree(tree(tree(nil,1,nil), 4, tree(tree(nil,5,nil),7,nil))).
% результат виконання має бути: true
% ifAVLTree(tree(tree(nil,1,nil), 4, tree(tree(tree(tree(nil,3,nil),3,nil),5,nil),7,nil))).
% результат виконання має бути: false
 
%  inOrderAVLTraversal(tree(tree(nil,'a',nil), 'b', tree(tree(nil,'c',nil),'d',nil)),Result).
% результат виконання має бути: Result = [a, b, c, d]
 
% findElAVLTree(tree(tree(nil,'a',nil),'b',tree(nil,'c',tree(nil,'d',nil))),'c').
% % результат виконання має бути: true
% findElAVLTree(tree(tree(nil,'a',nil),'b',tree(nil,'c',tree(nil,'d',nil))),'l').
% результат виконання має бути: false
 
% deleteNodeAVL(tree(tree(tree(nil,1,nil),2,nil),5,tree(nil,6,tree(nil,7,nil))),7,NewAvlTree).
% результат виконання має бути: NewAvlTree = tree(tree(tree(nil, 1, nil), 1, nil), 5, tree(nil, 6, nil))

% Написати програму, яка перевірить чи є заданий об'єкт AVL-деревом
% Для кожної вершини AVL дерева, висота двох її піддерев відмінна не біьльше ніж на 1
getHeight(H1, H2, R) :- 
    H1 > H2, !, 
    R is H1 + 1; R is H2 + 1.

ifAVLTree(TREE) :- ifAVLTree(TREE, _).
ifAVLTree(nil, 0).
ifAVLTree(tree(L, _, R), H) :- ifAVLTree(L, H1), ifAVLTree(R, H2),
    						   (H1 is H2 ; H1 is H2 + 1 ; H1 is H2 - 1), 
    							getHeight(H1, H2, H).


% Написати програму обходу AVL-дерева

inOrderAVLTraversal(nil,[]).
inOrderAVLTraversal(tree(L,T,R), TREE):- inOrderAVLTraversal(L, Temp1), inOrderAVLTraversal(R, Temp2), append(Temp1, [T|Temp2],TREE).

% Написати програму пошуку заданого елемента в AVL-дереві

findElAVLTree(tree(_, X, _), X):- !.
findElAVLTree(tree(L, _, _), X):- findElAVLTree(L,X).
findElAVLTree(tree(_,_,R),X):- findElAVLTree(R, X).

% Написати програму видалення заданого вузла з дерева, не порушуючи його структуру: бінарне сортуюче дерево 

helpSwap(tree(nil, D, R), D, R).
helpSwap(tree(L, T, _), D, tree(L1, T, _)) :- helpSwap(L, D, L1).

deleteNodeAVL(tree(nil, T, R), T, R).
deleteNodeAVL(tree(L, T, _), T, L).
deleteNodeAVL(tree(L, T, R), T, tree(L, D, R1)) :- helpSwap(R, D, R1).
% NODE > T 
deleteNodeAVL(tree(L, NODE, R), T, tree(L1, NODE, R)) :- NODE > T, deleteNodeAVL(L, T, L1).
% T >= NODE
deleteNodeAVL(tree(L, NODE, R), T, tree(L, NODE, R1)) :- T >= NODE, deleteNodeAVL(R, T, R1). 