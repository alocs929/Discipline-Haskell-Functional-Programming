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

  -- :collatz (round(n/2))
  -- | mod n 2==1 = round ((n*3)+1) -- :collatz(round((n*3)+1)) 



-- fechoKleene
-- goldbach
-- primosPalindromos
-- primosGemeos


