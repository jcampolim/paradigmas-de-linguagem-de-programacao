--------------------- soma2l ---------------------
-- >soma2l [1,1,1] [2,2,2,2,2]
-- >[3,3,3,2,2]

soma2l lst [] = lst
soma2l [] lst = lst
soma2l (a:xs) (b:ys) = a + b : soma2l xs ys      -- ":" = insere


--------------------- membro ---------------------
-- >membro 5 [3,2,4,5,6,1]
-- >True

-- essa função é um predicado, porque retorna um valor booleano

membro _ [] = False                             -- "_" = qualquer dígito (não ocupa espaço na memória)
                                                -- se a lista estiver vazia, não importa qual é o elemento
membro elt (a:xs) | elt == a = True             -- "|" = if
                  | otherwise = membro elt xs   -- "| otherwise" = else


-------------------- pertence --------------------
-- >acha 5 [3,2,4,5,6,1]
-- >3

-- encontra a posição do elemento da lista

acha elt lst = pertence elt lst 0

pertence _ [] n = -1
pertence elt (a:xs) n | elt == a = n
                      | otherwise = pertence elt xs (n + 1)


------------------ interseccao -------------------
-- >interseccao [1,2,3,4,5] [3,4,5,6,7]
-- >[3,4,5]

interseccao [] _ = []
interseccao (a:xs) lst | membro a lst = a : interseccao xs lst
                       | otherwise = interseccao xs lst


--------------------- ultimo ---------------------
-- >ultimo [1,2,3]
-- >3

ultimo [a] = a
ultimo (a:xs) = ultimo xs


-------------------- penultimo -------------------
-- >penultimo [1,2,3]
-- >2

penultimo [a,b] = a
penultimo (a:xs) = penultimo xs


--------------------- segundo --------------------
-- >segundo [1,2,3]
-- >2

segundo (a:(b:xs)) = b


-------------------- duplica ---------------------
-- >duplica [1,2,3]
-- >[1,1,2,2,3,3]

duplica [] = []
duplica (a:xs) = a : a : duplica xs