data ArvBin a = Vazia | No a (ArvBin a) (ArvBin a) deriving (Eq, Show) 

-- no1 = No 4 Vazia Vazia
-- no2 = No 4 Vazia Vazia
-- no3 = No 4 Vazia Vazia
-- no4 = No 4 Vazia Vazia
-- no5 = No 4 Vazia Vazia
-- no6 = No 4 Vazia Vazia
-- no7 = No 3 no4 no5
-- no8 = No 2 no1 no6
-- no9 = No 1 no8 no7

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


menorNivelFolha :: ArvBin a -> [a]
menorNivelFolha t = nivel (menorNivel t) t 

-- menorNivelFoha 
-- folhas (No x esq dir)
--   | esq == Vazia && dir == Vazia = [x]
--   | otherwise = folhas esq ++ folhas dir


-- MultiSet

data MultiSet a = MultiSet [(a,Int)] deriving (Show)

insereAux x [] = [(x,1)]
insereAux x ((a,b):xs)
  | a > x = (x,1):(a,b):xs
  | a < x = (a,b): (insereAux x xs)
  | otherwise = (a,b+1):xs

insere :: Ord a => a -> MultiSet a -> MultiSet a
insere x (MultiSet xs) = MultiSet (insereAux a xs)

tamanho (MultiSet xs) = sum [ x| (a,x)<- xs]
tamanho (MultiSet xs) = sum (map snd xs)

-- mConj

data MConj a = Vazio | No a Int (MConj a) (MConj a) deriving (Show)

insere x Vazio = No x 1 Vazio Vazio
insere x (No y q esq dir)
  | x == y = No y (q+1) esq dir
  | x < y = No y q (insere a esq) dir
  | x > y = No y q esq (insere a dir)




import Data.Char
import qualified Data.Set as Set

isograma xs = (length ys) == Set.size zs 
  where
  ys = filter (isLetter) xs
  as = Prelude.map (toUpper) ys
  zs = Set.fromList as