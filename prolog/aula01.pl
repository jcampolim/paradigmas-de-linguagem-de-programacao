/* Prolog (Programming in Logic) --> Lógica de Predicados de 1ª Ordem (Claúsulas de Horn) */

/* Em Prolog, há fatos e regras. Fatos sao verdades absolutas e não dependem de nada para isto. Regras dependem de "algo" para serem verdadeiras. */
/* Vejamos alguns exemplos em lógica proposicional:  */

a.                        % a é verdadeiro (fato) 
b.                        % b é verdadeiro (fato)
c :- z, w.                % c é verdadeiro se z e w forem verdadeiros (regra) 
c :- d, a.                %             OU se d e a forem verdadeiros (regra) 
d :- b.                   % d é verdadeiro se b for verdadeiro (regra) 

% , = E
% Todas as clausulas terminam com um ponto
% [] = lista vazia

tam([],0).                                  % tam [] = 0
tam([A|X],N) :- tam(X,T), N is T + 1.       % tam (a:xs) = 1 + tam xs

% As variáveis sempre começam por letra maiuscula e não variam
% [1,2,3] = [1|[2,3]] = [1|[2|[3]]] = [1|[2|[3|[]]]]
% Aridade 2 = 2 elementos dentro do parenteses