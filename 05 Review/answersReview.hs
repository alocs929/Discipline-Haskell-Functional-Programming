--[Tuplas]tribonacci
tribonacci :: Int -> (Int,Int,Int)
tribonacci n = tribo
  where
    tribo = (a,b,c)
    a = tribonacci'!!(n-2)
    b = tribonacci'!!(n-1)
    c = tribonacci'!!(n)
tribonacci' :: [Int] 
tribonacci' = [0] ++ [0] ++ [1] ++ tribonacci'' [0,0,1]
tribonacci'' :: Num a => [a] -> [a]
tribonacci'' xs = [prox] ++ tribonacci''(xs++[prox]) 
  where
    ult xs = xs!!(length(xs)-1)
    pen xs = xs!!(length(xs)-2)
    antp xs = xs!!(length(xs)-3)
    prox = (ult xs + pen xs + antp xs)



--[Recursao]romanos
romanos :: Int-> String
romanos n
  | n == 0 = ""
  | n >= 1 && n < 4 = "I" ++ romanos(n-1)
  | n == 4 = "IV"
  | n >= 5 && n < 9 = "V" ++ romanos(n-5)
  | n >= 9 && n < 10 = "IX" ++ romanos(n-9)
  | n >= 10 && n < 40 = "X" ++ romanos(n-10)
  | n >= 40 && n < 50 = "XL" ++ romanos(n-40)
  | n >= 50 && n < 90 = "L" ++ romanos(n-50)
  | n >= 90 && n < 100 = "LC" ++ romanos(n-90)
  | n >= 100 && n < 400 = "C" ++ romanos(n-100)
  | n >= 400 && n < 500 = "CD" ++ romanos(n-400)
  | n >= 500 && n < 900 = "D" ++ romanos(n-500)
  | n >= 900 && n < 1000 = "CM" ++ romanos(n-900)
  | n >= 100 && n <= 3000 = "M" ++ romanos(n-1000)



--[Tuplas, Listas Infinitas]pell
-- pell :: Int -> (Int, Int) --moodle está limitando o tamanho do numero ao tamanho de Int
-- por isso o cabeçalho deve ser mudado ou não ter
pell n = (a,b)
  where
    a = pellSequence!!(n-1)
    b = pellSequence!!(n)
    pellSequence = take (n+1) ([0] ++ [1] ++ pell' [0,1])
-- pell' :: Num a => [a] -> [a]
pell' xs =  [z] ++ pell' (xs++[z])
  where
    z = (2*(xs!!((length xs)-1))) + (xs!!((length xs)-2))



--[Recursao]binario
binario :: Int -> [Int]
binario 1 = [1]
binario n = [mod n 2] ++ binario (div n 2)



--[Recursao, Listas]subidas
subidas :: [Float] -> Int -- tira o cabeçalho
subidas [] = 0
subidas [x] = 0
subidas (a:b:xs)
  | a < b = 1 + subidas (b:xs)
  | otherwise = subidas (b:xs)



--[Tuplas]maiorIndices
maiorIndices xs = (a, b)
  where
    a = maior xs
    b = indices a xs

indices a [] = []
indices a xs
  | a == (last xs) = indices a (init xs) ++ [((length xs)-1)]
  | otherwise = indices a (init xs)

maior [x] = x
maior (a:b:xs)
  | a >= b =  maior(a:xs)
  | otherwise = maior(b:xs)



--[Recursao]fracaoContinua



--[Recursão]caminho
caminho :: [(Int,Int)] -> [Int] -> Bool
caminho ab [] = True
caminho ab (x:yz) = if tamList == tamde then True else False
  where
    de = zip (x:yz) yz
    tamList = length[ (x,y) | (x,y)<-de, elem (x,y) ab ]
    tamde = length de
    


--[Tipo Arvore]kMaior



--[Tipo Arvore]isHeap



--[Tipo Arvore]minMax



--[Desafio]coconut

