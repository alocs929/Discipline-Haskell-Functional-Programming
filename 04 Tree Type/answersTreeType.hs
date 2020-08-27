
-- [Tipo Multiconjunto] remove 
-- data MConj a = Vazia | No a Int (MConj a) (MConj a) deriving (Show, Eq)
-- remove :: Ord a => a -> Int -> MConj a -> MConj a
-- remove x q Vazia = Vazia
-- remove x q (No y n esq dir)
--   | x < y =  No y n (remove x q esq) dir
--   | x > y =  No y n esq (remove x q dir)
--   | x == y && q < n   = No y (n-q) esq dir
--   | esq == Vazia = dir
--   | dir == Vazia = esq


-- [Tipo Arvore Binaria de Busca] insertArvore 
data Arv a = Vazia | No a ( Arv a ) ( Arv a ) deriving (Eq , Show)
insertArvore :: Ord a => a -> Arv a -> Arv a
insertArvore x Vazia = No x Vazia Vazia 
insertArvore x (No a esq dir)
  | x < a =  No a (insertArvore x esq) dir
  | x > a =  No a esq (insertArvore x dir)
  

-- [Tipo Arvore Binaria] foldTree 
-- foldTree :: (a->b) -> (b->b->b) -> Tree a -> b

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


-- [Tipo Arvore Binaria] removeFolhas 


-- [Tipo Arvore Binaria] cheia 


-- [Tipo MultiSet] insere 


-- [Tipo Multiset] delee

