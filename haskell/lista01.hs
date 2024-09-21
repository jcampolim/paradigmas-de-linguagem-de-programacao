----------------------- tot3 -----------------------
-- 1) Escreva o programa tot3, que recebe uma lista e totaliza a cada 3 elementos da lista.
-- >tot3 [1,1,1,2,2,2,3,3,3,4]
-- >[3,6,9,4]

tot3 lst = tot 0 0 lst

tot _ b [] = [b]
tot a b (c:xs) | a == 2 = (b + c) : tot 0 0 xs
               | otherwise = tot (a + 1) (b + c) xs

----------------------- rev ------------------------
-- 2) Escreva o programa ver que inverte a lista.
-- >rev [1,2,3,4,5]
-- >[5,4,3,2,1]

rev [] = []
rev (x:xs) = rev xs ++ [x]

----------------------- seg ------------------------
-- 3) Escreva o programa seg que recebe uma lista com pelo menos 2 elementos e devolve o segundo elemento da lista.
-- >seg "abcdefgh"
-- >'b'

seg (a:(b:xs)) = b

---------------------- del_rep ---------------------
-- 4) Escreva o del_rep que recebe uma lista e deleta repetidos desta lista.
-- >del_rep [3,1,2,1,2,3]
-- >[3,2,1]

del_rep [] = []
del_rep (a:xs) = a : del_rep (del a xs)

del _ [] = []
del a (b:xs) | a == b = del a xs
             | otherwise = b : del a xs

----------------------- tolk -----------------------
-- 5) Escreva o tolk que recebe uma lista e um natural k e totaliza a lista de k em k elementos.
-- >tolk 5 [1,1,1,1,1,1,1,1,1,1,1,1]
-- >[5,5,2]

totk k lst = totkk k 0 0 lst

totkk _ _ b [] = [b]
totkk k a b (c:xs) | a == (k - 1) = (b + c) : totkk k 0 0 xs
                   | otherwise = totkk k (a + 1) (b + c) xs

----------------------- trok2 ----------------------
-- 6) Escreva o trok2 que recebe uma lista e troca de lugar o primeiro com o segundo elemento, o terceiro com o quarto e assim por diante.
-- >trok2 [1,2,3,4,5,6,7]
-- >[2,1,4,3,6,5,7]

trok2 [] = []
trok2 [a] = [a]
trok2 (a:(b:xs)) = b : a : trok2 xs

----------------------- delk -----------------------
-- 7) Escreva o delk que recebe uma lista e um natural  e deleta um a cada k elementos da lista.
-- >delk "anonimamentes"
-- >"anniamnts"

delk k lst = delkk k 1 lst

delkk _ _ [] = []
delkk k a (b:xs) | a == k    = delkk k 1 xs
                 | otherwise = b : delkk k (a + 1) xs
