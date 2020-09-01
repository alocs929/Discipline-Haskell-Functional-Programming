--listas infinitas, !Cuidado!

-- kolakoski
kolakoski :: [Int]
kolakoski = 1:2:2:concat [ replicate x y | (y,x) <- zip (cycle [1,2]) (tail (tail kolakoski))]
-- test = take 10 kalakoski

-- hamming
hamming :: [Integer]
hamming = 1 : merge (map (*2) hamming) (merge (map (*3) hamming) (map (*5) hamming))

merge :: Ord a => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys)
  | x == y = merge xs (y:ys)
  | x < y = x:merge xs (y:ys)
  | otherwise = y:merge (x:xs) ys 

-- collatz
collatz :: Integral a => a -> [a]
collatz x
  | x == 1 = [1]
  | mod x 2==0 = x:collatz (div x 2)
  | mod x 2==1 = x: collatz((x*3)+1)

-- fechoKleene
fechoKleene :: [a] -> [[a]]
fechoKleene xs = []: [ y++[x] | y<- fechoKleene xs ,x<-xs]

-- goldbach
goldbach :: Integral c => c -> [(c, c, c)]
goldbach n =   [head [(x,y,z) | y<-[1..n], z<-[1..n], isPrimoGold y, isPrimoGold z, x==y+z] | x<-[3..n], isPar x ]
isPar :: Integral a => a -> Bool
isPar x = if mod x 2 == 0 then True else False
isPrimoGold :: Integral a => a -> Bool
isPrimoGold x  = if length([y | y<-[1..x], mod x y ==0]) == 2 then True else False

-- primosPalindromos
primosPalindromo :: [Integer]
primosPalindromo = [ z | z<-[1..], isPrimoPali z, isPalindromo z] 
isPrimoPali :: Integral a => a -> Bool
isPrimoPali x  = if length([y | y<-[1..x], mod x y ==0]) == 2 then True else False
isPalindromo :: Show a => a -> Bool
isPalindromo n = show n == reverse (show n)

-- primosGemeos
primosGemeos :: [(Integer, Integer)]
primosGemeos =  [ (a,b) | (a,b)<-(zip (tail [ a | a<-[1..], isPrimo a]) (tail (tail [ a | a<-[1..], isPrimo a]))), b-a==2 ]
isPrimo :: Integral a => a -> Bool
isPrimo x  = if length([y | y<-[1..x], mod x y ==0]) == 2 then True else False




