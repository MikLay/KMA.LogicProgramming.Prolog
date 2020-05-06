точнаПозиція(Ліворуч, Праворуч, [Ліворуч, Праворуч | _]).
точнаПозиція(Ліворуч, Праворуч, [_ | Xs]) :- точнаПозиція(Ліворуч, Праворуч, Xs).

людина(Буд, СписокБуд):- member(Буд, СписокБуд).

сусіди(X, Y, Xs) :- 
    точнаПозиція(X, Y, Xs) ; точнаПозиція(Y, X, Xs) .

знайтиБудинок([Elem | _ ], 0, Elem).
знайтиБудинок([ _ | Xs], N, Elem) :- 
    N >= 1, K is N-1, 
    знайтиБудинок(Xs, K, Elem).

земля(Будинки) :-
    Будинки = [_,_,_,_,_],
    людина([англієць,_,_,_,червоний], Будинки),
    людина([швед,собака,_,_,_], Будинки),
    людина([датчанин,_,_,чай,_], Будинки),
    точнаПозиція([_,_,_,_,зелений], [_,_,_,_,білий], Будинки),
    людина([_,_,_,кава,зелений], Будинки),
    людина([_,пташка,pallmall,_,_], Будинки),
    знайтиБудинок(Будинки, 2, [_,_,_,молоко,_]),
    людина([_,_,dunhill,_,жовтий], Будинки),
    знайтиБудинок(Будинки, 0, [норвежець,_,_,_,_]),
    сусіди([_,_,marlboro,_,_], [_,кіт,_,_,_], Будинки),
    людина([_,_,winfield,пиво,_], Будинки),
    сусіди([норвежець,_,_,_,_], [_,_,_,_,синій], Будинки),
    людина([німець,_,rothmans,_,_], Будинки),
    сусіди([_,_,marlboro,_,_], [_,_,_,вода,_], Будинки),
    сусіди([_,кінь,_,_,_], [_,_,dunhill,_,_], Будинки).

комуНалежитьРиба(X) :-
    земля(З),
    людина([X,риба,_,_,_], З).