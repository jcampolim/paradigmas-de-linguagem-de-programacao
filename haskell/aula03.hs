data T = F Integer | N Integer T T deriving (Eq,Show)

t1 = (N 10 (N 20 (F 5) (F 3))
           (N 15 (F 9) (F 1)) )

t2 = (N 10 (N 10 (F 5) (F 5))
           (N 10 (F 5) (F 5)))

----------------------- soma das folhas ------------------------

somaF (F n) = n                               -- se for uma folha, retorna o valor dela
somaF (N _ a1 a2) = (somaF a1) + (somaF a2)   -- se for um nó com uma árvore a direita e uma a esquerda, realiza a soma de cada lado


----------------------- soma dos nós ------------------------

somaN (F _) = 0                                   -- se for uma folha, não vai ser somado
somaN (N n a1 a2) = n + (somaN a1) + (somaN a2)   -- soma o valor do nó e o valor de cada árvore a esquerda ou a direita


----------------------- soma tudo ------------------------

somaT (F n) = n 
somaT (N n a1 a2) = n + (somaT a1) + (somaT a2)


----------------------- percurso pré-ordem ------------------------
-- [10,20,5,3,15,9,1]

pre (F n) = [n]
pre (N n a1 a2) = [n] ++ (pre a1) ++ (pre a2)


----------------------- percurso em-ordem ------------------------
-- [5,20,3,10,9,15,1]

ino (F n) = [n]
ino (N n a1 a2) = (ino a1) ++ [n] ++ (ino a2)


----------------------- percurso pré-ordem ------------------------
-- [5,3,20,9,1,15,10]

pos (F n) = [n]
pos (N n a1 a2) = (pos a1) ++ (pos a2) ++ [n]


----------------------- altura da árvore ------------------------

altura (F _) = 0
altura (N _ a1 a2) = 1 + maior (altura a1) (altura a2)

maior a b | a > b = a
          | otherwise = b


----------------------- altera da árvore ------------------------

trocaT a b (F n) | n == a = (F b)
                 | otherwise = (F n)

trocaT a b (N n a1 a2) | n == a = (N b (trocaT a b a1) (trocaT a b a2))
                       | otherwise = (N n (trocaT a b a1) (trocaT a b a2))