dobro n = 2 * n


fat 0 = 1                        -- condição de parada
fat n = n * fat (n - 1)          -- recursão


fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)


tam [] = 0
tam (a:xs) = tam xs + 1            -- a = cabeça da lista; xs = cauda da lista

-- soma dos elementos de uma lista:

soma [] = 0
soma (a:xs) = a + soma xs


-- adiciona um elemento no final da lista:

nofim n [] = [n]                   -- se for uma lista vazia, então adiciona
nofim n (a:xs) = a : nofim n xs    -- xs = lista do resto

-- nofim 5 [1,2] = 1 : (nofim 5 [2]) = 1 : (2 : (nofim 5 [])) = 1 : 2 : [5] = 1 : [2,5] = [1,2,5]


-- soma os elementos de duas listas:
-- [1,1,1] + [10,10,10,10,10] = [11,11,11,10,10]

s2l [] lst = lst                   -- se a primeira lista estiver vazia 
s2l lst [] = lst                   -- se a segunda lista estiver vazia
s2l (a:xs) (b:ys) = a + b : s2l xs ys        -- soma os primeiros elementos e segue para o próximo