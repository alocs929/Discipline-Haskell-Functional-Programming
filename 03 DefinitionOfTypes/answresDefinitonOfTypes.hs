
-- arvoreExpressao 

-- linkedList 
data LinkedList a = Vazia | No a (LinkedList a) deriving (Eq, Show)
fromList [x] = No x Vazia
fromList (x:xs) = No x (fromList xs)
toList :: LinkedList a -> [a]
toList Vazia = []
toList (No x ab) = x : toList ab
append :: a -> LinkedList a -> LinkedList a
append a (No x Vazia) = No x (No a Vazia)
append a (No x yz) = No x (append a yz)   
reverseLinkedList :: LinkedList a -> LinkedList a
reverseLinkedList (No x yz) =  fromList(reverse(toList (No x yz)))

-- mobile 
data Mobile = Pendente Int | Barra Mobile Mobile deriving (Eq, Show)
balanceado:: Mobile -> Bool
balanceado (Pendente x) = True
balanceado (Barra ab cd) = if (peso ab) == (peso cd) then True else False 
peso :: Mobile -> Int
peso (Pendente y) = y
peso (Barra ab cd) = (peso ab) + (peso cd)

-- makeMobile 

-- data Mobile = Pendente Int | Barra Mobile Mobile deriving (Eq, Show)
makeMobile :: [Int] -> Mobile
makeMobile [x] = Pendente x
makeMobile (x:xs) 
                  | mod (length (x:xs)) 2 == 0 = Barra ( makeMobile (fristMiddle (x:xs)) ) ( makeMobile (lastMiddlePar (x:xs)) ) 
                  | mod (length (x:xs)) 2 == 1 = Barra ( makeMobile (fristMiddle (x:xs)) ) ( makeMobile (lastMiddleImpar (x:xs)) ) 
fristMiddle xs = take (div (length xs) 2) xs
lastMiddlePar xs = reverse (take (div (length xs) 2) (reverse xs))
lastMiddleImpar xs = reverse (take ((div (length xs) 2)+1) (reverse xs))

-- eqsplits 


-- splits 
-- splits xs = 

-- numPassageiros
data Trem a = Vagao a ( Trem a ) | Vazio deriving Show
type Quantidade = Int
type Peso = Int
data Carga = SemCarga | Passageiro Quantidade | Mercadoria Peso deriving Show
numPassageiros :: Trem Carga -> Int 
numPassageiros(Vagao (SemCarga) Vazio) = 0
numPassageiros (Vagao (Passageiro x) Vazio)  = x
numPassageiros (Vagao (Mercadoria x) Vazio)  = 0
numPassageiros(Vagao (SemCarga) c) = numPassageiros c
numPassageiros (Vagao (Passageiro x) c)  = x + numPassageiros c
numPassageiros (Vagao (Mercadoria x) c)  =  numPassageiros c
