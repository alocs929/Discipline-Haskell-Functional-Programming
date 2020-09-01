

--concatenaFold
concatenaFold :: [[a]] -> [a]
concatenaFold xs = foldr(\x acc -> x ++ acc  ) [] xs

--inverteFold
inverteFold :: [a] -> [a] 
inverteFold xs = foldr(\x acc -> acc ++ [x] ) [] xs

--paridadeFold 
paridadeFold :: [Bool] -> Bool
-- paridadeFold xs = if (foldr(\x acc -> if x then acc + 1 else acc) 0 xs ) `mod` 2 == 0 then True else False
paridadeFold xs = foldr(\x acc -> if x == True then not acc else acc) True xs

--duplicarFold
duplicarFold :: String -> String
duplicarFold xs = foldr(\x acc -> if isVogal x then x: [x] ++ acc else [x] ++ acc) [] xs
isVogal :: Char -> Bool
isVogal x = if (elem x ['a','e','i','o','u'])|| ((elem x ['A','E','I','O','U'])) then True else False

--filtraAplicaFold 
filtraAplicaFold :: (a->b) -> (a->Bool)->[a]->[b]
filtraAplicaFold f p xs = foldr (\x acc -> if p x then [f x] ++ acc else acc) [] xs

--mapFold 
mapFold :: (a->b) -> [a] -> [b]
mapFold f xs = foldr(\x acc -> [f x] ++ acc ) [] xs

--removeLista 
removeLista ::  Eq a =>  [a] -> [a] -> [a]
removeLista xs ys = foldr (\y acc -> if (notElem y xs) then [y] ++ acc else acc) [] ys

--acertosFold 
acertosFold :: Eq a => [a] -> [a] -> Int
acertosFold xs ys = foldr(\z acc -> if f xs ys z then acc+1 else acc ) 0 [0..((length xs) -1)]
f :: Eq a => [a] -> [a] -> Int -> Bool
f xs ys i = if (xs !! i) == (ys !! i) then True else False



--descompactaFold
descompactaFold ::  [(a, b)] -> ([a], [b]) 
descompactaFold qw = foldr(\(a,b) (xs,ys) -> ([a]++xs,[b]++ys) ) ([],[]) qw





--Funções usadas para teste "Lixo"
divideByTen :: (Floating a) => a -> a  
divideByTen = (/10) 

isUpperAlphanum :: Char -> Bool  
isUpperAlphanum = (`elem` ['A'..'Z']) 

teste = (subtract 2)

applyTwice :: (a -> a) -> a -> a  
applyTwice f x = f (f x)  

zipWith' _ [] _ = []  
zipWith' _ _ [] = []  
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

zip' _ [] = []
zip' [] _ = []
zip' (x:xs) (y:ys)  = (x,y) : zip xs ys

flip' :: (a -> b -> c) -> b -> a -> c  
flip' f y x = f x y  

largestDivisible :: (Integral a) => a  
largestDivisible = head (filter p [100000,99999..])  
  where p x = x `mod` 3892 == 0  

sum' (x:xs) = foldl (\acc x -> acc+x) 0 xs

sum'' (x:xs) = foldl (+) 0 xs






