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

/*-------------------- N primeiros naturais --------------------*/

npri(0,[]).
npri(N,R) :- N1 is N - 1, npri(N1,R1), append(R1,[N],R).

/*-- com acumuladores --*/

np(N,R) :- np(N,1,R).

np(N,N,[N]).
np(N,T,[T|Ts]) :- T1 is T + 1, np(N,T1,Ts).


/*-------------------- merge sort --------------------*/

split([],[],[]).
split([A],[A],[]).
split([A|[B|L]],[A|L1],[B|L2]) :- split(L,L1,L2).

intercala([],L,L).
intercala(L,[],L).
intercala([A|L1],[B|L2],[A|R]) :- A < B, intercala(L1,[B|L2],R).
intercala(L1,[B|L2],[B|R]) :- intercala(L1,L2,R).

mergeSort([],[]).
mergeSort([A],[A]).
mergeSort(L,R) :- split(L,L1,L2), mergeSort(L1,R1), mergeSort(L2,R2), intercala(R1,R2,R).


/*-------------------- quick sort --------------------*/

particiona([],_,[],[]).
particiona([A|L],N,L1,[A|L2]) :- A > N, particiona(L,N,L1,L2).
particiona([A|L],N,[A|L1],L2) :- particiona(L,N,L1,L2).

quickSort([],[]).
quickSort([A],[A]).
quickSort([A|L],R) :- particiona(L,A,L1,L2), 
    quickSort(L1,R1), quickSort(L2,R2), 
    append(R1,[A|R2],R).
