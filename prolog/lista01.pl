/*-------------------- triplica --------------------*/

tri([],[]).
tri([A|As],[A|[A|[A|R]]]) :- tri(As,R).


/*-------------------- substitui --------------------*/

subs(_,_,[],[]).
subs(X,Y,[X|As],[Y|R]) :- subs(X,Y,As,R).
subs(X,Y,[A|As],[A|R]) :- subs(X,Y,As,R).


/*-------------------- agrupa --------------------*/

agrupa(_,[],[]).
agrupa(N,A,[G|R]) :- formaGrupo(N,A,G,RL), agrupa(N,RL,R).

formaGrupo(0,R,[],R).
formaGrupo(_,[],[],_).
formaGrupo(N,[A|As],[A|R],RL) :- N > 0, N1 is N - 1, formaGrupo(N1,As,R,RL).


/*-------------------- enuplica --------------------*/

enup(N,A,R) :- enup(A,N,N,R).

enup([],_,_,[]).
enup([A|As],N,0,R) :- enup(As,N,N,R).
enup([A|As],N,T,[A|R]) :- T1 is T - 1, enup([A|As],N,T1,R).


/*-------------------- maior ocorrencia --------------------*/

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

conta(_,N,[],N,[]).
conta(C,N,[C|A],R,As) :- N1 is N + 1, conta(C,N1,A,R,As).
conta(_,N,L,N,L).

maiorOcor(L,R) :- mergeSort(L,R1), maiorOcor(R1,0,_,R).

maiorOcor([],_,E,E).
maiorOcor([A|L],N,E,R) :- conta(A,0,[A|L],R1,As), 
                        (R1 > N -> maiorOcor(As,R1,A,R);
                        maiorOcor(As,N,E,R)).
