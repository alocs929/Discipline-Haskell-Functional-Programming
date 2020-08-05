-- kolakoski
  --lista infinita, !Cuidado!
kolakoski = 1:2:2:concat [ replicate x y | (y,x) <- zip (cycle [1,2]) (tail (tail kolakoski))]
-- test = take 10 kalakoski

-- hamming
hamming = 1 : merge (map (*2) hamming) (merge (map (*3) hamming) (map (*5) hamming)) 
-- test = take 10 hamming
merge :: Ord a => [a] -> [a] -> [a]
merge (x:xs) (y:ys)
  | x == y = merge xs (y:ys)
  | x < y = x:merge xs (y:ys)
  | otherwise = y:merge (x:xs) ys 

-- collatz
collatz x
  | x == 1 = [1]
  | mod x 2==0 = x:collatz (div x 2)
  | mod x 2==1 = x: collatz((x*3)+1)



-- fechoKleene

-- goldbach



-- primosPalindromos
primosPalindromo = [ z | z<-[1..], isPrimoPali z, isPalindromo z] 
isPrimoPali x  = if length([y | y<-[1..x], mod x y ==0]) == 2 then True else False
isPalindromo n = show n == reverse (show n)

-- primosGemeos
primosGemeos =  [ (a,b) | (a,b)<-(zip (tail [ a | a<-[1..], isPrimo a]) (tail (tail [ a | a<-[1..], isPrimo a]))), b-a==2 ]
isPrimo x  = if length([y | y<-[1..x], mod x y ==0]) == 2 then True else False




