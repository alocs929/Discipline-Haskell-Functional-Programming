--[Tuplas]tribonacci
-- tribonacci :: Int -> (Int,Int,Int)
-- tribonacci n = (tribonacci'(n-2), tribonacci'(n-1), tribonacci' n )
-- tribonacci' 0 = 0
-- tribonacci' 1 = 0
-- tribonacci' 2 = 1
-- tribonacci' x = tribonacci'(x-1) + tribonacci' (x-2) + tribonacci' (x-3)

-- tribonacci :: Int -> (Int,Int,Int)
-- tribonacci n = 

tribonacci' 0 = [0]
tribonacci' 1 = [0]
tribonacci' 2 = [1]
tribonacci' n = [tribonacci'(n-1)] ++ [tribonacci'(n-2)] ++ [tribonacci'(n-3)]
-- []tribonacci' b c (a+b+c)


--[Recursao]romanos
-- romanos :: Int-> String
-- romanos 
--[Tuplas, Listas Infinitas]pell


--[Recursao]binario


--[Recursao, Listas]subidas


--[Tuplas]maiorIndices


--[Recursao]fracaoContinua


--[Recursão]caminho


--[Tipo Arvore]kMaior


--[Tipo Arvore]isHeap


--[Tipo Arvore]minMax


--[Desafio]coconut



