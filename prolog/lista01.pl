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
