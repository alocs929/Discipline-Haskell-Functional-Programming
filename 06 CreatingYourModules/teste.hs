import Queue
import Stack


import Data.Char
import qualified Data.Set as Set  
--[Módulo Data.Set e Data.Char]pangrama


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











