/*-------------------- fatorial --------------------*/

fat(0,1).
fat(N,R) :- N2 is N - 1, fat(N2,R2), R is R2 * N.


/*-------------------- fibonacci --------------------*/

fib(0,0).
fib(1,1).
fib(N,R) :- N1 is N - 1, 
            N2 is N - 2, 
            fib(N1,R1), fib(N2,R2), 
            R is R1 + R2.


/*-------------------- tamanho --------------------*/

tam([],0).
tam([_|X],R) :- tam(X,R1), R is R1 + 1.


/*-------------------- somaMult --------------------*/

% predicado que entrega duas respostas: a soma e a multiplicação dos valores de um vetor

sm([],0,0).
sm(L,S,M) :- sm(L,0,1,S,M).

sm([],SAc,MAc,SAc,MAc).
sm([A|X],SAc,MAc,S,M) :- SAc2 is SAc + A,
                         MAc2 is MAc * A,
                         sm(X,SAc2,MAc2,S,M).


/*-------------------- soma --------------------*/

soma([],0).
soma([A|X],S) :- soma(X,S1), S is S1 + A.


/*-------------------- soma2l --------------------*/

soma2l([],L,L).
soma2l(L,[],L).
soma2l([A|As],[B|Bs],[R|Rs]) :- R is A + B, soma2l(As,Bs,Rs).

% -- com acumuladores (otimização de memória) --
soma2lA([],L,L).
soma2lA(L,[],L).
soma2lA(L1,L2,R) :- soma2lA(L1,L2,[],R).

soma2lA([],L,Lac,R) :- append(Lac,L,R).     % o append concatena duas listas
soma2lA(L,[],Lac,R) :- append(Lac,L,R).
soma2lA([A|As],[B|Bs],Lac,R) :- S is A + B, 
                                append(Lac,[S],Lac2), 
                                soma2lA(As,Bs,Lac2,R).


/*-------------------- membro --------------------*/

membro(N,[N|_]).                           % filtra os elementos iguais
membro(N,[_|As]) :- membro(N,As).          % o prolog avalia os predicados de cima para baixo

