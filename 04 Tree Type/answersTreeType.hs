-- [Tipo Multiconjunto] remove 
data MConj a = Vazia | No a Int (MConj a) (MConj a) deriving (Show, Eq)
remove :: Ord a => a -> Int -> MConj a -> MConj a
remove x q Vazia = Vazia
remove x q (No y n esq dir)
  | x < y =  No y n (remove x q esq) dir
  | x > y =  No y n esq (remove x q dir)
  | x == y && q < n   = No y (n-q) esq dir
  | esq == Vazia = dir
  | dir == Vazia = esq



-- [Tipo Arvore Binaria de Busca] insertArvore 
data Arv a = Vazia | No a ( Arv a ) ( Arv a ) deriving (Eq , Show)
insertArvore :: Ord a => a -> Arv a -> Arv a
insertArvore x Vazia = No x Vazia Vazia 
insertArvore x (No a esq dir)
  | x < a =  No a (insertArvore x esq) dir
  | x > a =  No a esq (insertArvore x dir)
  |otherwise = No a (insertArvore x esq) dir
  


-- [Tipo Arvore Binaria] foldTree 
data Arvore a = Folha a | Ramo (Arvore a) (Arvore a) deriving (Show)
foldTree :: (a->b) -> (b->b->b) -> Arvore a -> b
foldTree f1 f2 (Folha a) = f1 a
foldTree f1 f2 (Ramo esq dir) = f2 (foldTree f1 f2 esq) (foldTree f1 f2 dir)



-- [Tipo Multiset] makeMultiSet 
data MultiSet a = MultiSet [(a,Int)] deriving (Show)
-- makeMultiSet :: [a] -> MultiSet a
makeMultiSet xs = MultiSet (makeMultiSet' ( insertSort xs ))
makeMultiSet' :: [Int] -> [(Int, Int)]
makeMultiSet' [] = []
makeMultiSet' (x:xs)= ( x, ( frequencia x (x:xs) ) ) : makeMultiSet' (filter (/=x) xs) 
insertSort :: Ord a => [a] -> [a]
insertSort [] = []
insertSort (x:xs) = insertSort [ y | y<-xs, y<=x ] ++ [x] ++ insertSort [ y | y<-xs, y>x ];
frequencia :: Int -> [Int] -> Int
frequencia _ [] = 0
frequencia y (x:xs) = if y == x then 1 + (frequencia y xs) else frequencia y xs



-- [Tipo Arvore Binaria] menorNivelFolha 
data ArvBin a = Vazia | No a ( ArvBin a ) ( ArvBin a ) deriving (Show)
menorNivelFolha :: ArvBin a -> [a]
menorNivelFolha t = nivel (menorNivel t) t 

folhas:: Eq a => ArvBin a-> [a]
folhas (Vazia) = []
folhas (No x Vazia Vazia) = [x]
folhas (No x esq Vazia) = folhas esq
folhas (No x Vazia dir) = folhas dir
folhas (No x esq dir) = folhas esq ++ folhas dir
nivel :: Int -> ArvBin a -> [a]
nivel _ Vazia = []
nivel 0 (No x esq dir) = [x]
nivel n (No x esq dir) = ( nivel (n-1) esq ) ++ ( nivel (n-1) dir )
menorNivel :: ArvBin a -> Int
menorNivel (No x Vazia Vazia) = 0
menorNivel (No x esq Vazia) = menorNivel esq + 1
menorNivel (No x Vazia dir) = menorNivel dir + 1
menorNivel (No x esq dir) = ( min (menorNivel esq) (menorNivel dir) ) +1
nivelFolha :: Int -> ArvBin a -> [a]
nivelFolha _ Vazia = []
nivelFolha 0 (No x Vazia Vazia) = [x]
nivelFolha 0 (No x esq dir) = []
nivelFolha n (No x esq dir) = nivelFolha (n-1) esq ++ nivelFolha (n-1) dir



-- [Tipo Arvore Binaria] removeFolhas 
data ArvBin a = Vazia | No a ( ArvBin a ) ( ArvBin a ) deriving (Show)
removeFolhas :: ArvBin a -> ArvBin a
removeFolhas Vazia =  Vazia
removeFolhas (No a Vazia Vazia) =  Vazia
removeFolhas (No a esq dir) =  No a (removeFolhas esq) (removeFolhas dir)


-- [Tipo Arvore Binaria] cheia 



-- [Tipo MultiSet] insere 



-- [Tipo Multiset] delee



