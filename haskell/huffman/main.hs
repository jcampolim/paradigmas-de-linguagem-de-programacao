-- Otavio Bruzadin 10409053
-- Erika Borges    10403716
-- Julia Campolim  10408802

import System.IO
import Data.List (group, sort, sortBy)
import Data.Ord (comparing)

main :: IO ()
main = do
    contents <- readFile "arquivo.txt"
    
    let frequencias = sortBy (comparing snd) (contarCaracteres contents)
    print frequencias
    
    -- Chama a função que monta a árvore de huffman e converte as frequências em folhas
    let arvore = huffman (map (\(c, f) -> Leaf c f) frequencias)
    print arvore
    
    let codigoGerado = bin arvore
    let saida = codifica codigoGerado contents
    
    writeFile "saida.txt" saida
    putStrLn "Codificação realizada com sucesso!"

-- Conta caracteres e suas ocorrências em uma string
contarCaracteres :: String -> [(Char, Int)]
contarCaracteres texto = 
    map (\xs -> (head xs, length xs))         -- Cria tuplas com o caractere e sua contagem
    . group                                   -- Agrupa caracteres iguais consecutivos
    . sort $ texto                            -- Ordena a string para facilitar o agrupamento

-- Cria o tipo de dado de uma árvore binária
data Btree = Leaf Char Int | Node Btree Btree Int deriving Show

-- Executa o algoritmo de Huffman
huffman :: [Btree] -> Btree
huffman [] = error "Não há nenhum conteúdo no arquivo"
huffman [a] = a                                         -- Se só tiver um elemento na lista, a árvore está completa
huffman (a:b:xs) = huffman $ inserir (newNode a b) xs   -- Insere os dois primeiros elementos da lista ordenada de nós na árvore
                                                        -- e continua percorrendo todos os elementos da lista até que ela esteja vazia

-- Pega a frequência de cada nó
getFrequencia :: Btree -> Int
getFrequencia (Leaf _ f) = f
getFrequencia (Node _ _ f) = f

-- Cria um novo nó, cuja frequência é a soma da frequência de outros dois nós
newNode :: Btree -> Btree -> Btree
newNode a b = Node a b (getFrequencia a + getFrequencia b)

-- Insere um nó na lista de forma ordenada
inserir :: Btree -> [Btree] -> [Btree]
inserir a [] = [a]                                     -- Se a lista estiver vazia, então o nó é o seu único elemento
inserir a (b:xs)
    | getFrequencia a <= getFrequencia b = a : b : xs  -- O novo nó é inserido se ele for menor que o primeiro nó da lista
    | otherwise = b : inserir a xs                     -- Se o novo nó for maior que o primeiro, continua a percorrer a lista

-- Gera uma lista de pares a partir de uma árvore binária
bin :: Btree -> [(Char, String)]
bin arvore = auxBin arvore ""
  where
    -- Função auxiliar que percorre a árvore
    -- Se o nó for folha, retorna o caracter e o código acumulado
    -- Caso contrário, continua percorrendo os filhos à esquerda (colocando 0) e os à direita (colocando 1)
    auxBin (Leaf c _) code = [(c, code)]
    auxBin (Node left right _) code = 
        auxBin left (code ++ "0") ++ auxBin right (code ++ "1")

-- Pega a lista de pares gerada pela função bin e codifica a string
-- O resultado da codificação é acumulado na string resultado
codifica :: [(Char, String)] -> String -> String
codifica allC texto = codificaAux allC texto ""
  where
    codificaAux _ [] resultado = resultado
    codificaAux allC (caractere:resto) resultado =
      let codigo = buscaCodigo allC caractere
      in codificaAux allC resto (resultado ++ codigo)

    -- Busca o código do caracter na lista e se encontrar retorna ele
    -- Caso contrário, retorna uma string vazia
    buscaCodigo [] _ = ""
    buscaCodigo ((ch, cod):resto) c
      | ch == c  = cod
      | otherwise = buscaCodigo resto c