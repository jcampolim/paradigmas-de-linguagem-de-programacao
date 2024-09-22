----------------------- ex 01 -----------------------
-- Fatorial

fat 0 = 1
fat n = n * fat (n - 1)


----------------------- ex 02 -----------------------
-- Fibonacci

fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)


----------------------- ex 03 -----------------------
-- Tamanho de uma lista

tam lst = get_tam 0 lst

get_tam a [] = a
get_tam a (b:xs) = get_tam (a + 1) xs


----------------------- ex 04 -----------------------
-- Soma  dos elementos de uma lista

soma lst = somal 0 lst

somal a [] = a
somal a (b:xs) = somal (a + b) xs


----------------------- ex 05 -----------------------
-- >soma2l [ 1 , 2 , 3 , 4 , 5 ] [ 1 , 1 , 1 ]
-- >[ 2 , 3 , 4 , 4 , 5]

soma2l lst [] = lst
soma2l [] lst = lst
soma2l (a:xs) (b:ys) = (a + b) : soma2l xs ys


----------------------- ex 06 -----------------------
-- >membro 4 [ 3 , 4 , 1 , 2 , 1 ]
-- >True

membro _ [] = False
membro a (b: xs) | a == b = True
                 | otherwise = membro a xs


----------------------- ex 07 -----------------------
-- >inters [ 1 , 2 , 3 , 4 , 5 ] [ 3 , 4 , 5 , 6 , 7 ]
-- >[3 ,4 ,5]

inters [] _ = []
inters (a:xs) lst | membro a lst = a : inters xs lst
                  | otherwise = inters xs lst


----------------------- ex 08 -----------------------
-- >ult [ 1 , 2 , 3 , 4 , 5 ]
-- >5

ult [a] = a
ult (a:xs) = ult xs


----------------------- ex 09 -----------------------
-- >penult "abcdefghi"
-- >'h'

penult [a,b] = a
penult (a:xs) = penult xs


----------------------- ex 10 -----------------------
-- >seg "abcdefghi"
-- >'b'

segundo (a:(b:xs)) = b


----------------------- ex 11 -----------------------
-- >dup [ 3 , 1 , 2 , 3 ]
-- >[ 3 , 3 , 1 , 1 , 2 , 2 , 3 , 3]

dup [] = []
dup (a:xs) = a : a : dup xs


----------------------- ex 12 -----------------------
-- >delpri 5  [ 3 , 1 , 5 , 2 , 3 , 5 , 5 ]
-- >[ 3 , 1 , 2 , 3 , 5 , 5]

delpri _ [] = []
delpri a (b:xs) | a == b = xs
                | otherwise = b : delpri a xs


----------------------- ex 13 -----------------------
-- >delall 5  [ 3 , 1 , 5 , 2 , 3 , 5 , 5 ]
-- >[ 3 , 1 , 2 , 3]

delall _ [] = []
delall a (b:xs) | a == b = delall a xs
                | otherwise = b : delall a xs


----------------------- ex 14 -----------------------
-- >del2p [ 3 , 3 , 3 , 1 , 1 , 5 , 2 , 2 , 2 , 2 ]
-- >[ 3 , 1 , 5, 2]

del2p [a] = [a]
del2p (a:(b:xs)) | a == b = del2p (b:xs)
                 | otherwise = a : del2p (b:xs)


----------------------- ex 15 -----------------------
-- >menor [ 30 , 2 , 15 , 8 , 9 , 13 , 10 ]
-- >[ 3 , 1 , 5, 2]

menor (a:xs) = find_menor a xs

find_menor a [] = a
find_menor a (b:xs) | b < a = find_menor b xs 
                    | otherwise = find_menor a xs


----------------------- ex 16 -----------------------
-- >pegn 3 [ 30 , 2 , 15 , 8 , 9 , 13 , 10 ]
-- >[30, 2, 15]

pegn n lst = pegk n 1 lst

pegk n k (a:xs) | n == k = [a]
                | otherwise = a : pegk n (k + 1) xs


----------------------- ex 17 -----------------------
-- >merge [ 1 , 3 , 9 , 90 , 94 ] [ 2 , 4 , 5 , 19 ]
-- >[ 1 , 2 , 3 , 4 , 5 , 9 , 19 , 90 , 94]

merge lst [] = lst
merge [] lst = lst
merge (a:xs) (b:ys) | a < b = a : merge xs (b:ys)
                    | otherwise = b : merge (a:xs) ys


----------------------- ex 18 -----------------------
-- >partit 10 [ 7 , 10 , 12 , 3 , 9 , 90 , 43 , 15 ]
-- >( [ 7 , 10 , 3 , 9 ] , [ 12 , 90 , 43 , 15 ] )

partit _ [] = ([],[])
partit n lst = part n lst [] []

part _ [] l1 l2 = (l1,l2)
part n (a:xs) l1 l2 | a <= n = part n xs (l1++[a]) l2
                    | otherwise = part n xs l1 (l2++[a])


----------------------- ex 19 -----------------------
-- >spit [ 1 , 2 , 3 , 4 , 5 , 6 , 7 ]
-- >( [ 1 , 3 , 5 , 7 ] , [ 2 , 4 , 6 ] )

pri (a,_) = a
seg (_,a) = a

split [] = ([],[])
split [a] = ([a],[])
split lst = splita lst [] []

splita [] l1 l2 = (l1,l2)
splita [a] l1 l2 = (l1++[a],l2)
splita (a:(b:xs)) l1 l2 = splita xs (l1++[a]) (l2++[b])


----------------------- ex 20 -----------------------
-- >msort [ 7 , 3 , 12 , 4 , 3 , 1 , 90 , 67 ]
-- >[ 1 , 3 , 3 , 4 , 7 , 12 , 67 , 90]

msort [] = []
msort [a] = [a]
msort lst = merge (msort l1) (msort l2)
    where dupla = split lst
          l1 = pri dupla
          l2 = seg dupla


----------------------- ex 21 -----------------------
-- >qsort [ 7 , 3 , 12 , 4 , 3 , 1 , 90 , 67 ]
-- >[ 1 , 3 , 3 , 4 , 7 , 12 , 67 , 90]

qsort [] = []
qsort [a] = [a]
qsort (p:xs) = (qsort menores) ++ [p] ++ (qsort maiores)
    where dupla = partit p xs
          menores = pri dupla
          maiores = seg dupla


----------------------- ex 22 -----------------------
-- >rleCod "aaaaaaaaaaaaaaabbbbbbbbaaaaaaaaaa"
-- >[ ( ’ a ’ , 15 ) , ( ’ b ’ , 8 ) , ( ’ a ’ , 10 ) ]

rleCod [] = []
rleCod (c:xs) = rleC xs c 1 []

rleC [] c q l = l++[(c,q)]
rleC (a:xs) c q l | a == c = rleC xs c (q + 1) l
                  | otherwise = rleC xs a 1 (l++[(c,q)])


----------------------- ex 23 -----------------------
-- >rleDec [ ( ’ a ’ , 15 ) , ( ’ b ’ , 8 ) , ( ’ a ’ , 10 ) ]
-- >"aaaaaaaaaaaaaaabbbbbbbbaaaaaaaaaa"

rleDec [] = []
rleDec ((a,n):xs) = rep a n ++ rleDec xs

rep _ 0 = []
rep a n = a : rep a (n - 1)