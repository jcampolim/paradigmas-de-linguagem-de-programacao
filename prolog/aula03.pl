/*-------------------- membro --------------------*/

membro(A,[A|_]).
membro(N,[_|As]) :- membro(N,As).


/*-------------------- deleta repetidos --------------------*/

delreps([],[]).
delreps([A|As],R) :- membro(A,As), delreps(As,R).
delreps([A|As],[A|R]) :- delreps(As,R).


/*-------------------- pega os N primeiros elementos --------------------*/

pegN(0,_,[]).
pegN(_,[],[]).
pegN(N,[A|As],[A|R]) :- N1 is N - 1, pegN(N1,As,R).


/*-------------------- localiza elemento --------------------*/

onde(N,A,P) :- onde(N,A,P,0).

onde(_,[],-1,_).
onde(A,[A|_],P,P).
onde(N,[_|As],P,R) :- R1 is R + 1, onde(N,As,P,R1).

/*-- versão recursiva --*/
ondeR(E,[E|_],0).
ondeR(A,[_|As],R1) :- ondeR(A,As,R), R1 is R + 1.


/*-------------------- pega até o elemento N (inclusive) --------------------*/

ate(_,[],[]).
ate(N,[N|_],[N]).
ate(N,[A|As],[A|Rs]) :- ate(N,As,Rs).


/*-------------------- pega após o elemento N (exclusive) --------------------*/

apos(_,[],[]).
apos(N,[N|As],As).
apos(N,[_|As],R) :- apos(N,As,R).
