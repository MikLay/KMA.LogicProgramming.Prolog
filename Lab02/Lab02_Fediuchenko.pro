%# Pow

myPow(X,Y,Z) :- myPow1(X,Y,1,Z),!.

myPow1(_,0,Accumulator,Z) :- Z is Accumulator.
myPow1(X,Y,Accumulator,Z) :-
    Y1 is Y - 1,
    A1 is Accumulator*X,
    myPow1(X,Y1,A1,Z).
    

%# Division
myDiv(_, 0, _,_) :- throw('divider can`t be zero').
myDiv(X, Y, _,_) :- (X < 0 ; Y < 0), throw('arguments must be positive').

myDiv(Dividend, Divisor, Q, R) :-
   Dividend > 0,
   Divisor > 0,
   myDiv(Dividend, Divisor, 0, Q, R).

myDiv(Dividend, Divisor, Q, Q, Dividend) :-
   Dividend < Divisor.

myDiv(Dividend , Divisor, Acc, Q, R) :-
   Dividend >= Divisor,
   D1 is Dividend - Divisor,
   T1 is Acc + 1,
   myDiv(D1, Divisor, T1, Q, R).



%# Pow logorythm

odd(0) :- !.
odd(1) :- false.
odd(X) :-
    X < 0,
    X1 is -X,
    odd(X1),
    !.

odd(X) :-
    X > 1,
    X1 is X-2,
    odd(X1),
    !.

myPowLog1(X, Y, Z, ZZ) :-
    Y > 0,
    odd(Y),
    ZZ1 is ZZ * X,
    X1 is X * X,
    myPowLog1(X1, Y1, Z, ZZ1),
    !.

myPowLog1(X, Y, Z, ZZ) :-
    Y > 0,
    X1 is X * X,
    myPowLog1(X1, Y1, Z, ZZ1),
    !.

myPowLog1(X, Y, Z, Z) :-
    (Y < 0 ; Y = 0).
    
myPowLog(X, Y, Z) :- myPowLog1(X, Y, Z, 1).


%# Fibbonaci numbers

fib(N, _) :- (N < 0 ; N = 0), throw('number must be greater then 0').

fib(1, 1) :- !.
fib(2, 1) :- !.

fib(N, X) :-
    N1 is N-1,
    N2 is N-2,
    fib(N1, X1),
    fib(N2, X2),
    Res is X1+X2,
    X = Res.

%# Fibbonaci iterative

fibI(N, _) :- (N < 0 ; N = 0), throw('incorrect fibo index').
fibI(0, 1) :- !.
fibI(1, 1) :- !.
fibI(N, F) :-
        fibI(1,1,1,N,F).

fibI(_F, F1, N, N, F1) :- !.
fibI(F0, F1, I, N, F) :-
        F2 is F0+F1,
        I2 is I + 1,
        fibI(F1, F2, I2, N, F).
   
   
%# Sum row
arrowF(0, 1) :- !.
arrowF(1, 1) :- !.
arrowF(N, X) :-
    N1 is N-1,
    arrowF(N1, X1),
    Res is N * X1,
    X = Res.

helper1(N,R):-arrowF(N, R1), R is 1/R1.

findSum1(0, R, R) :- !.
findSum1(N, A, R) :-
  N1 is N-1,
  helper1(N, A1),
  A2 is A+A1,
  findSum1(N1, A2, R).

findSum(N, R) :- findSum1(N, 0, R).


%# Simple numbers

prime_factors(N,L) :- N > 0,  prime_factors(N,L,2).

prime_factors(1,[],_) :- !.
prime_factors(N,[F|L],F) :-                           % N is multiple of F
   R is N // F, N =:= R * F, !, prime_factors(R,L,F).
prime_factors(N,L,F) :- 
   next_factor(N,F,NF), prime_factors(N,L,NF). 
   
next_factor(_,2,3) :- !.
next_factor(N,F,NF) :- F * F < N, !, NF is F + 2.
next_factor(N,_,N). 

