import Queue
import Stack

--[Modulo Queue]Josephus
josephus n k = simula k (makeQueue [1..n])
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

--[Módulo Queue]Josephus2
import Queue
josephus x n = simula (n) (makeQueue [1..x]) []
pula :: Int -> Queue a -> Queue a
pula n a | n > 1 = pula (n-1) (dequeue( enqueue (front a) a)) 
         | otherwise = a
simula n a xs | size (a) == 1 = xs ++ [front a]
              | otherwise = simula n (dequeue (pula n (a))) (xs++[(front (pula n (a)))])



--[Módulo Stack]NotaçãoPolonesaReversa



--[Modulo Data.Set] isograma
import qualified Data.Set as Set
import Data.Char  
isograma xs = Set.size s == length zs
  where
  ys = filter (isLetter) xs
  zs = map (toLower) ys
  s = Set.fromList zs


--[Módulo Data.Set e Data.Char]pangrama
import Data.Char
import qualified Data.Set as Set
isPanagram text = Set.size (Set.fromList letras) == 26
  where
    letras = (filter.map toLower) text



--[Módulo Data.Set] numeroTrocas



--[Data.Map] Palavras palindrômicas


--[Data.Map] transformaAnagrama


--[Data.Map] duplicates


