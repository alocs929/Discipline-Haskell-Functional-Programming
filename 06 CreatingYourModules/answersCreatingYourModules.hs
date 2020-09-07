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

-- josephus n k = simula k (makeQueue [1..n])


--[Módulo Queue]Josephus2
-- josephus n k = front (pula (k-1) k) 



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


--[Data.Map] Palavras palindrômicas


--[Data.Map] transformaAnagrama


--[Data.Map] duplicates











--[Modulo Queue]Josephus




--[Módulo Queue]Josephus2



--[Módulo Stack]NotaçãoPolonesaReversa
https://github.com/leticiaSaraiva/Functional-Programming/blob/0a12a64b5e64952da2ee329e1bd69afbbe773f47/RPN.hs


--[Modulo Data.Set] isograma


--[Módulo Data.Set e Data.Char]pangrama


--[Módulo Data.Set] numeroTrocas


--[Data.Map] Palavras palindrômicas


--[Data.Map] transformaAnagrama


--[Data.Map] duplicates

