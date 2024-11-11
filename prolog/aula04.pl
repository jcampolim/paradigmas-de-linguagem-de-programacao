/*-------------------- árvore --------------------*/

t1(no(5,no(7,no(3,f(6),f(8)),f(2)),no(9,f(1),f(4)))).

soma(f(N),N).
soma(no(N,T1,T2),R) :- soma(T1,R1), soma(T2,R2), R is N + R1 + R2.


/*-------------------- rle comprime --------------------*/

rlec([],[]).
rlec([E|Es],R) :- rlec(Es,E,1,R).

rlec([],E,N,[(E,N)]).
rlec([E|Es],E,N,R) :- N1 is N + 1, rlec(Es,E,N1,R).
rlec([A|As],E,N,[(E,N)|X]) :- rlec(As,A,1,X).


/*-------------------- rle descomprime --------------------*/

rled([],[]).
rled([(E,N)|X],R) :- rled(X,R1), rep(E,N,L), append(L,R1,R).

rep(_,0,[]).
rep(E,N,[E|Es]) :- N1 is N - 1, rep(E,N1,Es).


/*-------------------- torre de hanoi --------------------*/

hanoi(1,E,C,_) :- write("mova 1 disco de "), write(E), write(" para "), writeln(C).
hanoi(N,E,C,D) :- N1 is N - 1, hanoi(N1,E,D,C), hanoi(1,E,C,D), hanoi(N1,D,C,E).


/*-------------------- multi --------------------*/

multi(L,R) :- soma_elementos(L,I,P), I > P, incrementa(L,R).
multi(L,L).

soma_elementos(L,I,P) :- soma_elementos(L,I,P,0).

soma_elementos([],0,0,_).
soma_elementos([A|As],I,P1,C) :- C = 0, soma_elementos(As,I,P,1), P1 is P + A.
soma_elementos([A|As],I1,P,_) :- soma_elementos(As,I,P,0), I1 is I + A.

incrementa([A,B,C,D|X],[A,B,C,D|R]) :- incr(X,R).

incr([],[]).
incr([A|As],[R|Rs]) :- R is A + 1, incr(As,Rs).
