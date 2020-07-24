import Data.Char


-- Remove
remove :: Eq a=> a-> [a]-> [a]
remove _ [] = []
remove n (x:xs) = if n == x then xs else x:remove n xs

-- Inserir
inserir :: Ord a=> a-> [a] -> [a]
inserir x [] = [x]
inserir x (y:ys) = if y > x then x:y:ys else y:inserir x ys  

--Subconjunto
subconjunto :: Eq a => [a] -> [a] -> Bool
subconjunto [] _ = True 
subconjunto (x:xs) ys = if elem x ys then subconjunto xs ys else False

--somaConsecutivos
somaConsecutivos :: Num a => [a] -> [a]
somaConsecutivos xs = [x+y| (x,y)<-(zip xs (tail xs))]

--filtrandoCaudas
filtrandoCaudas :: [[a]] -> [[a]]
filtrandoCaudas xs = [ tail x | x <- xs, not (null x)]

--abundantesMenores
abundantesMenores :: Integral a => a -> [a]
abundantesMenores n = [x | x<-[1..n], abundante x]
abundante :: Integral a => a -> Bool
abundante n = if sum([ x | x <- [1..n-1] ,mod n x == 0 ]) > n then True else False

--frequencia
frequencia :: Int -> [Int] -> Int
frequencia _ [] = 0
frequencia y (x:xs) = if y == x then 1 + (frequencia y xs) else frequencia y xs

--agrupa
agrupa :: Eq a => [[a]] -> [[a]]
agrupa [] = []
agrupa xs = if elem [] xs then [] else map head xs : agrupa (map tail xs)  

--insertSort
insertSort :: Ord a => [a] -> [a]
insertSort [] = []
insertSort (x:xs) = insertSort [ y | y<-xs, y<=x ] ++ [x] ++ insertSort [ y | y<-xs, y>x ];

--temLetraOuDigito
      --import Data.Char
temLetraOuDigito :: String -> Bool
temLetraOuDigito [] = False
temLetraOuDigito (x:xs) = if isLetter x || isDigit x then True else temLetraOuDigito xs

--filtrandoListas
filtrandoListas :: [[a]] -> [[a]]
filtrandoListas xs = map (take (minLenList xs)) xs

minLenList xs =  minLenListAux (head (map (length) xs)) (map (length) xs)

minLenListAux y [] = y
minLenListAux y (x:xs) = if y<=x then minLenListAux y xs else minLenListAux x xs  

--chococola
chococola :: Int -> Int
chococola n = n + chococolaAux (n+1)
chococolaAux :: Int -> Int
chococolaAux n = if n <= 2 then 0 else (div n 3) + chococolaAux (div n 3 + mod n 3)

--noIntervalo 
noIntervalo :: Int -> Int -> [Int] -> [Int]
noIntervalo a b xs = [ y | y<-xs, y>=a, y<=b ]

--intercala 
intercala :: a -> [a] -> [a] 
intercala a xs = if length xs <= 2 then xs else intercalaAux a xs
intercalaAux :: t -> [t] -> [t]
intercalaAux _ [x] = [x] 
intercalaAux a xs = (head xs):a:intercalaAux a (tail xs)

--metadePares 
metadePares :: [Int] -> [Int]
metadePares xs =  [ div y 2 | y<-xs, mod y 2 == 0]

--insert
insert :: Ord a => a -> [a] -> [a] 
insert a xs = [ y | y<-xs, y<=a ] ++ [a] ++ [ y | y<-xs, y>a ]

--maiorSalto 
maiorSalto :: [Int] -> Int
maiorSalto xs = maior (map (posi) (saltos xs 0))

maior :: [Int] -> Int
maior [] = 0
maior [x] = x
maior (x:xs) = max x (maior xs)

posi :: Int -> Int
posi x = if x<0 then -x else x

saltos :: [Int] -> Int -> [Int]
saltos xs i = if i <((length xs)-1) then [((xs !! 0) - (xs !! 1))] ++ saltos (tail xs) 0  else [0]  

--remdups 
--import Data.List 
remdups :: [Int] -> [Int]
-- remdups xs = nub xs
remdups [] = []
remdups [x] = [x]
remdups xs = if head xs == head (tail xs) then remdups (tail xs) else head xs:remdups (tail xs) 

--descompacta 
descompacta :: [(a, b)] -> ([a], [b]) 
descompacta xs = ([ x | (x,y)<-xs], [ y | (x,y)<-xs])

--pontos
pontos :: [Int] -> Int
pontos xs = maximum [ z | (_,z)<-tuplas xs ] 

tuplas :: Eq a => [a] -> [(a, Int)]
tuplas [] = []
tuplas (x:xs) =  [( x , length(takeWhile (==x) (x:xs)))] ++ tuplas (take (length(x:xs) - length(takeWhile (==x) (x:xs))) (reverse (x:xs)))

--merge
merge :: Ord a => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys) 
	| x < y = x:merge xs (y:ys)
	| otherwise = y:merge (x:xs) (ys)
