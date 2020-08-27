-- arvoreExpressao

data ArvoreExpressao = No (Int->Int->Int) ArvoreExpressao ArvoreExpressao| Folha Int

data Expr = Val Int
  | Soma Expr Expr
  | Mult Expr Expr
  | Div Expr Expr
  | Sub Expr Expr
  | Mod Expr Expr
  deriving (Read,Eq,Show)


eval :: ArvoreExpressao -> Int
eval (Folha x) = x
eval (No (+) exp1 exp2) = eval (exp1) + eval(exp2)
eval (No (-) exp1 exp2) = eval (exp1) - eval(exp2)
eval (No (*) exp1 exp2) = eval (exp1) * eval(exp2)
eval (No (div) exp1 exp2) = div (eval exp1) (eval exp2)
eval (No (mod) exp1 exp2) = mod (eval exp1) (eval exp2)

-- fromExpr :: Expr -> ArvoreExpressao
-- fromExpr (Val x) = Folha x
-- fromExpr (Soma exp1 exp2) = No (+) (fromExpr exp1)  (fromExpr exp2)
-- fromExpr (Sub exp1 exp2) = No (-) (fromExpr exp1)  (fromExpr exp2)
-- fromExpr (Mult exp1 exp2) = No (*) (fromExpr exp1)  (fromExpr exp2)
-- fromExpr (Div exp1 exp2) = No (div) (fromExpr exp1)  (fromExpr exp2)
-- fromExpr (Mod exp1 exp2) = No (mod) (fromExpr exp1)  (fromExpr exp2)



-- eval :: ArvoreExpressao -> Int
-- eval (Folha x) = x
-- eval (No (+) exp1 exp2) = eval (exp1) + eval (exp2)
-- eval (No (-) exp1 exp2) = eval (exp1) - eval (exp2)
-- eval (No (*) exp1 exp2) = eval (exp1) * eval (exp2)
-- eval (No (div) exp1 exp2) = div (eval (exp1)) (eval (exp2))
-- eval (No (mod) exp1 exp2) = mod (eval exp1) (eval exp2)


-- ex1 = Mod (Mult (Val 3) (Val 4)) (( Div (Val 4) (Val 3) ))
-- showExpr :: Expr -> String
-- showExpr (Val x) = show x
-- showExpr (Soma exp1 exp2) = "(" ++ showExpr(exp1) ++ " + " ++ showExpr(exp2) ++ ")"
-- showExpr (Sub exp1 exp2) = "(" ++ showExpr(exp1) ++ " - " ++ showExpr(exp2) ++ ")"
-- showExpr (Mult exp1 exp2) = "(" ++ showExpr(exp1) ++ " * " ++ showExpr(exp2) ++ ")"
-- showExpr (Div exp1 exp2) = "(" ++ showExpr(exp1) ++ " / " ++ showExpr(exp2) ++ ")"
-- showExpr (Mod exp1 exp2) = "(" ++ showExpr(exp1) ++ " % " ++ showExpr(exp2) ++ ")"


-- linkedList 
data LinkedList a = Vazia | Node a (LinkedList a) deriving (Eq, Show)
fromList [x] = Node x Vazia
fromList (x:xs) = Node x (fromList xs)
toList :: LinkedList a -> [a]
toList Vazia = []
toList (Node x ab) = x : toList ab
append :: a -> LinkedList a -> LinkedList a
append a (Node x Vazia) = Node x (Node a Vazia)
append a (Node x yz) = Node x (append a yz)   
reverseLinkedList :: LinkedList a -> LinkedList a
reverseLinkedList (Node x yz) =  fromList(reverse(toList (Node x yz)))

-- mobile 
data Mobile = Pendente Int | Barra Mobile Mobile deriving (Eq, Show)
-- balanceado:: Mobile -> Bool
balanceado (Pendente x) = x
balanceado (Barra ab cd) = peso cd 
-- balanceado (Barra ab cd) = if (peso ab) == (peso cd) then True else False 
peso :: Mobile -> Int
peso (Pendente y) = y
peso (Barra ab cd) = (peso ab) + (peso cd)

m1 = Barra (Barra (Pendente 1) (Pendente 3)) (Pendente 2)

m2 = Barra (Barra (Pendente 32) (Pendente 32)) (Barra (Barra (Barra (Pendente 8) (Pendente 8)) (Barra (Pendente 8) (Barra (Pendente 4) (Pendente 4)))) (Barra (Barra (Pendente 8) (Pendente 8)) (Barra (Pendente 8) (Barra (Pendente 4) (Pendente 4)))))


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
eqsplits :: (Eq a, Num a) => [a] -> [([a], [a])]
eqsplits xs = [ (a,b) | (a,b) <- splits xs, sum a == sum b ]
-- splits :: [a] -> [([a],[a])]
-- splits [] = [([],[])]
-- splits (x:xs) = [(x:y,z) | (y,z) <- splits xs] ++ [(y,x:z) | (y,z) <- splits xs]

-- splits 
splits :: [a] -> [([a],[a])]
splits [] = [([],[])]
splits (x:xs) = [(x:y,z) | (y,z) <- splits xs] ++ [(y,x:z) | (y,z) <- splits xs]

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
