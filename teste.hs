import Queue
import Stack

--[Modulo Queue]Josephus
pula :: Int -> Queue a -> Queue a
pula 0 q = q
pula n q = enqueue x q2
  where
  q1 = pula (n-1) q
  x = front q1
  q2 = dequeue q1
  
simula :: Int -> Queue a -> Int
simula k q
  | size q == 1 = front q
  | otherwise = simula k q2
  where
  q1 = pula (k-1) q
  q2 = dequeue q1
josephus n k = simula k (makeQueue [1..n])

--[Módulo Queue]Josephus2
import Queue
pula :: Int -> Queue a -> Queue a
pula n a | n > 1 = pula (n-1) (dequeue( enqueue (front a) a)) 
         | otherwise = a
simula n a xs | size (a) == 1 = xs ++ [front a]
              | otherwise = simula n (dequeue (pula n (a))) (xs++[(front (pula n (a)))])
josephus x n = simula (n) (makeQueue [1..x]) []






--[Módulo Stack]NotaçãoPolonesaReversa
polonesa :: String -> Int
polonesa xs = polonesaAux (words xs) (emptyStack)

polonesaAux [] p = top p
polonesaAux (x:xs) p 
  | x == "+"  = polonesaAux xs (push (v1 + v2) q2)
  | x == "-"  = polonesaAux xs (push (v2 - v1) q2)
  | x == "*"  = polonesaAux xs (push (v1 * v2) q2)
  | x == "/"  = polonesaAux xs (push (div v2 v1) q2)
  | otherwise = polonesaAux xs (push (converte x) p)
  where
  v1 = top p
  q1 = pop p
  v2 = top q1
  q2 = pop q1	

converte :: String -> Int
converte x = (read :: String -> Int) x 






module Main where 
import Stack



numero x pilha = push ((read :: String -> Int) x) pilha



soma pilha = push (top pilha + top (pop pilha)) (pop (pop pilha))
subtrai pilha = push ( top (pop pilha) -top pilha) (pop (pop pilha))
divide pilha = push (div  (top (pop pilha)) (top pilha)) (pop (pop pilha))
multiplica pilha = push (top pilha * top (pop pilha))  (pop (pop pilha))


calcula [[]] pilha = top pilha
calcula (x:xs) pilha | x == "+" = calcula xs (soma pilha)
                     | x == "-" = calcula xs (subtrai pilha)
                     | x == "*" = calcula xs (multiplica pilha)
                     | x == "/" = calcula xs (divide pilha)
                     | x == " "  = calcula xs pilha
                     | otherwise = calcula xs (numero x pilha)



numeros :: String -> String

numeros (x:xs) | x == ' ' = []
               | otherwise = [x] ++ numeros xs

ateespaco :: String -> [String]

ateespaco [] = [[]]
ateespaco (x:xs) | x == ' ' = transforma xs
                 | otherwise = ateespaco xs

transforma [] = [[]]
transforma (x:xs) | x == ' ' =  transforma xs
                  | x == '+' = [[x]] ++ transforma xs
                  | x == '-' = [[x]] ++ transforma xs
                  | x == '/' = [[x]] ++ transforma xs
                  | x == '*' = [[x]] ++ transforma xs
                  | otherwise = [numeros (x:xs)] ++ ateespaco xs 


polonesa xs = calcula (transforma xs) (makeStack [])

























--[Modulo Data.Set] isograma
import qualified Data.Set as Set
import Data.Char  
isograma xs = Set.size s == length zs
  where
  ys = filter (isLetter) xs
  zs = map (toLower) ys
  s = Set.fromList zs


--[Módulo Data.Set e Data.Char]pangrama




--[Módulo Data.Set] numeroTrocas
adiciona x [] = [(x,1)]
adiciona x ((a,b):xs) | x == a = ((a,b+1):xs)
                      | otherwise  = [(a,b)]++(adiciona x xs) 

transforma [] tuplas = [] 
transforma (x:[]) tuplas = adiciona x tuplas
transforma (x:xs) tuplas = transforma xs (adiciona x tuplas)

contandoDuplicadas [] = []
contandoDuplicadas ((a,b):xs) | b > 1 = [a] ++ contandoDuplicadas xs
                              | otherwise = contandoDuplicadas xs

duplicates xs = quicksort (contandoDuplicadas( transforma xs []))

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
  let smallerSorted = quicksort [a | a <- xs, a <= x]
      biggerSorted = quicksort [a | a <- xs, a > x]
  in  smallerSorted ++ [x] ++ biggerSorted

excluir x [] = [(x, (-1))]
excluir x ((a,b):xs) | x == a = ((a,b-1):xs)
                     | otherwise = [(a,b)] ++ excluir x xs

excluir2 x [] = []
excluir2 x ((a,b):xs) | x == a = xs
                      | otherwise = [(a,b)] ++ excluir2 x xs

excluirString [] tuplas = tuplas
excluirString (x:xs) tuplas = excluirString xs (excluir x tuplas)
excluirList [] tuplas = tuplas
excluirList (x:xs) tuplas = excluirList xs (excluir2 x tuplas)
pokemon xs ys = excluirList xs (transforma ys []) 
apagaSegundaString xs ys = excluirString ys (transforma xs [])
contarTuplas [] = 0
contarTuplas ((a,b):xs) | b < 0 = (b*(-1)) + contarTuplas xs
                        | otherwise = b + contarTuplas xs
contandoAnagrama xs ys =  contarTuplas (apagaSegundaString xs ys)
menor a b | a < b = a
          | otherwise = b
numeroTrocas xs ys = menor (length (pokemon ys xs)) (length (pokemon xs ys))



--[Data.Map] Palavras palindrômicas
data MultiSet a = MultiSet [(a,Int)] deriving (Eq, Show)

makeMultiSet [] = MultiSet []
makeMultiSet xs = MultiSet (organizar (quicksort xs) 0)

organizar [] x = []
organizar (a:[]) x = [(a,1)]  
organizar (a:b:[]) x | a == b = [(a, 2+x)]
                     | otherwise = [(a,1+x),(b, 1)]

organizar (a:b:xs) x | a == b = organizar (b:xs) (x+1)
                     | otherwise = ([(a,1+x)] ++ (organizar (b:xs) 0))

junta (MultiSet ((a,b):[])) (MultiSet xs) = MultiSet ([(a,b)] ++ xs)

delete a b (MultiSet []) = MultiSet []
delete a b (MultiSet ((c,d):xs)) | a == c && d > b = MultiSet ((c,d-b):xs)
                                 | a == c && d <= b = MultiSet xs
                                 | otherwise = junta (MultiSet [(c,d)]) (delete a b (MultiSet xs))

insere x (MultiSet []) = MultiSet [(x, 1)]
insere x (MultiSet ((a,b):xs)) | a == x = MultiSet ((a,b+1):xs)
                               | x < a = MultiSet ([(x,1)] ++ ((a,b):xs))
                               | otherwise = junta (MultiSet [(a,b)]) (insere x (MultiSet xs))

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
  let smallerSorted = quicksort [a | a <- xs, a <= x]
      biggerSorted = quicksort [a | a <- xs, a > x]
  in  smallerSorted ++ [x] ++ biggerSorted

eae [] multi = multi
eae xs multi = eae (tail xs) (insere (head xs) multi)

verifica :: MultiSet a -> Int -> Int

verifica (MultiSet []) n = n
verifica (MultiSet ((a,b):xs)) n = verifica (MultiSet xs) (n + (b `mod` 2)) 


numeroInsercao xs | verifica (eae xs (MultiSet [])) (-1) == -1 = 0
            | otherwise = verifica (eae xs (MultiSet [])) (-1)



--[Data.Map] transformaAnagrama
adiciona x [] = [(x,1)]
adiciona x ((a,b):xs) | x == a = ((a,b+1):xs)
                      | otherwise  = [(a,b)]++(adiciona x xs) 



transforma (x:[]) tuplas = adiciona x tuplas
transforma (x:xs) tuplas = transforma xs (adiciona x tuplas)

excluir x [] = [(x, (-1))]
excluir x ((a,b):xs) | x == a = ((a,b-1):xs)
                     | otherwise = [(a,b)] ++ excluir x xs

excluirString [] tuplas = tuplas
excluirString (x:xs) tuplas = excluirString xs (excluir x tuplas)

apagaSegundaString xs ys = excluirString ys (transforma xs [])

contarTuplas [] = 0
contarTuplas ((a,b):xs) | b < 0 = (b*(-1)) + contarTuplas xs
                        | otherwise = b + contarTuplas xs


transformaAnagrama xs ys = contarTuplas (apagaSegundaString xs ys)



--[Data.Map] duplicates
duplicates xs = quicksort (contandoDuplicadas( transforma xs []))

adiciona x [] = [(x,1)]
adiciona x ((a,b):xs) 
  | x == a = ((a,b+1):xs)
  | otherwise  = [(a,b)]++(adiciona x xs) 

transforma (x:[]) tuplas = adiciona x tuplas
transforma (x:xs) tuplas = transforma xs (adiciona x tuplas)

contandoDuplicadas [] = []
contandoDuplicadas ((a,b):xs) 
  | b > 1 = [a] ++ contandoDuplicadas xs
  | otherwise = contandoDuplicadas xs

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = quicksort [a | a <- xs, a <= x] ++ [x] ++ quicksort [a | a <- xs, a > x]






