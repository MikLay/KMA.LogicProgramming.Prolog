fill(9).
fill(-1) :- !.
fill(X) :- asserta(d(X)), X1 is X-1, fill(X1).


%У тризначному числi, всi цифри якого непаpнi, закpеслили середню цифру. 
%Виявилось, що отpимане двозначне число є дiльником вихiдного числа. 
%Знайдiть всi такi тризначнi числа.
task1(X) :- d(A), A > 0, d(B), d(C),
            A mod 2 =\= 0,
            B mod 2 =\= 0,
            C mod 2 =\= 0,
            (100 * A + 10 * B + C) mod (10 * A + C) =:= 0,
            X is 100 * A + 10 * B + C.
			
%Знайдiть чотиризначне число, яке є точним квадратом, 
%у якого двi першi цифри однаковi та двi останнi також однаковi.
task2(X) :- d(A), A > 0, d(B),X is (1000 * A + 100 * A + 10 * B + B),round(sqrt(X)) ** 2 =:= X. 



task3(X):- counter(1,X,0),!.

counter(X,Res,TempRes):- (X>1998,Res is TempRes);
			((X mod 6) =\=0, 
			(X mod 10) =\=0, 
			(X mod 15) =\=0,
			NewRes is TempRes+1,
			X1 is X+1, 
			counter(X1,Res,NewRes));
			(X1 is X+1, counter(X1,Res,TempRes)).

%Знайти найменше натуральне число M, яке має наступну властивiсть: 
%сума квадратiв одинадцяти послiдовних натуральних чисел, починаючи з M, є точним квадратом?
task4(X):- findM(1,X),!.

findM(X,T):-
	qS(X,Step,0,0),
	(round(sqrt(Step))**2 =:=Step,
	T is X);(X1 is X+1, findM(X1,T)).

qS(M,T,11,T):-!.
qS(M,T,X,TempRes):-
	NewRes is (TempRes+(M+X)**2), 
	X1 is X+1,
qS(M,T,X1,NewRes).

%В послiдовностi 1998737... кождна цифра, починаючи з п'ятої, дорiвнює останнiй цифрi суми чотирьох попеpеднiх цифр. 
%Через скiльки цифр знову зустрiнитья початкова комбiнацiя 1998 (тобто скiльки цифр в перiодi)?
task5(RES):- task5(1,9,9,8,0,RES).
task5(A1, A2, A3, A4, C, RES) :- (A1 * 1000 + A2 * 100 + A3 * 10 + A4) =:= 1998, C > 0
                                 -> RES is C
                                 ;  C1 is C + 1,
								NEXT_A is (A1 + A2 + A3 + A4) mod 10,
								task5(A2, A3, A4, NEXT_A, C1, RES).