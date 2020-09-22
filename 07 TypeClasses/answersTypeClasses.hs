--[Classes de Tipos]NumerosComplexos
import Text.Printf
data Complex = Complex { real :: Float,img :: Float } deriving (Eq)

instance Show Complex where
    show (Complex a b)= concat [printf "%.3f" a, " + ", printf "%.3f" b, "i"]

instance Num Complex where
  (+) c1 c2       = somaComplexo c1 c2
  (-) c1 c2       = subComplexo c1 c2
  (*) c1 c2       = mulComplexo c1 c2
  negate c        = negtivo c
  abs c           = absoluto c
  signum c        = sinal c
  fromInteger n   = apartirInteiro n

somaComplexo (Complex a b) (Complex c d) = Complex (a+c) (b+d)
subComplexo (Complex a b) (Complex c d) = Complex (a-c) (b-d)
mulComplexo (Complex a b) (Complex c d) = Complex (a*c - b*d) (a*d + b*c)
apartirInteiro n = Complex (fromInteger n) 0
negtivo (Complex a b) = Complex (-a) (-b)
absoluto (Complex a b) = Complex (sqrt (a*a + b*b)) 0 
sinal c@(Complex a b) = Complex (a/r) (b/r)
  where
    r = real (absoluto (Complex a b))




--[Classes de Tipos]Date
data Mes = Janeiro 
            | Fevereiro 
            | Marco 
            | Abril 
            | Maio 
            | Junho 
            | Julho 
            | Agosto 
            | Setembro 
            | Outubro
            | Novembro
            | Dezembro
            deriving (Show, Ord, Eq, Enum) 

data Date = MkDate { dia :: Int, mes :: Mes, ano :: Int }

instance Show Date where
    show (MkDate dia mes ano) = concat [show dia, " de ", show mes, " de ", show ano]    

instance Eq Date where
    (MkDate d1 m1 a1) == (MkDate d2 m2 a2) = d1 == d2 && m1 == m2 && a1 == a2

instance Ord Date where
    (MkDate d1 m1 a1) <= (MkDate d2 m2 a2) = d1 <= d2 && convertMonthInInt m1 <= convertMonthInInt m2 && a1 <= a2

convertMonthInInt Janeiro = 0 
convertMonthInInt Fevereiro = 1
convertMonthInInt Marco = 3
convertMonthInInt Abril = 4
convertMonthInInt Maio = 5
convertMonthInInt Junho = 6
convertMonthInInt Julho = 7
convertMonthInInt Agosto = 8
convertMonthInInt Setembro = 9
convertMonthInInt Outubro = 10
convertMonthInInt Novembro = 11
convertMonthInInt Dezembro = 12



--[Classe de Tipos]Matrix
type Row = [Float]
data Matrix = Matrix { ncols :: Int, nrows :: Int, rows :: [Row] }

instance Show Matrix where
    show (Matrix col row xs) = concat [ "|" ++ concat ([" " ++ show y ++ " " | y<-x]) ++ "|\n" | x <- xs]

-- matriz de zeros
zeroMatrix :: Int -> Int -> Matrix
zeroMatrix c r = Matrix c r ([ listzeros | a<-[1..r] ])
  where
    listzeros = [0 | a<-[1..c]]

-- matriz de uns
oneMatrix :: Int -> Int -> Matrix
oneMatrix c r = Matrix c r ([ listuns | a<-[1..r] ])
  where
    listuns = [1 | a<-[1..c]]

-- matriz identidade : recebe ordem
identMatrix :: Int -> Matrix
identMatrix x = Matrix x x ([ [ if a==b then 1 else 0 | b<-[1..x]] | a<-[1..x] ])
 
-- soma duas matrizes
sumMatrix :: Matrix -> Matrix -> Matrix
sumMatrix (Matrix c r xs) ( Matrix c1 r1 ys) = Matrix c r (somaCol xs ys)
somaCol :: Num a => [[a]] -> [[a]] -> [[a]]
somaCol (x:[]) (y:[]) = [somaRow x y]
somaCol (x:xs) (y:ys) = [somaRow x y] ++ somaCol xs ys    
somaRow :: Num a => [a] -> [a] -> [a]
somaRow [] [] = []
somaRow (x:xs) (y:ys) = [x+y] ++ somaRow xs ys


-- produto de escalar por matriz
prodScalar :: Float -> Matrix -> Matrix
prodScalar n (Matrix c r xs) = Matrix c r ([ [ i * n  | i <- l] | l <-xs ])

-- produto entre matrizes
prodMatrix :: Matrix -> Matrix -> Matrix
prodMatrix (Matrix c r xs) ( Matrix c1 r1 ys) = Matrix c r1 (multMtx xs ys)

multMtx m1 m2 = [ [somaMulti ri rj | rj <- m2inversa] | ri <- m1 ]
  where
    m2inversa = matrixTransposta m2
    somaMulti s1 s2 = sum (zipWith (*) s1 s2)

matrixTransposta ([]:_) = []
matrixTransposta xs = (map head xs) : matrixTransposta (map tail xs)

-- transforma listas de listas de floats numa matriz
listToMatrix :: [Row] -> Matrix
listToMatrix xs = Matrix (length xs) (length (head xs)) xs




--[Classe de Tipos]PedraPapelTesoura
data Gesto = Pedra | Papel | Tesoura
ganhaDe :: Gesto -> Gesto -> Bool
ganhaDe Pedra Pedra = False
ganhaDe Pedra Papel = False
ganhaDe Pedra Tesoura = True
ganhaDe Papel Pedra = True
ganhaDe Papel Papel = False
ganhaDe Papel Tesoura = False
ganhaDe Tesoura Pedra = False 
ganhaDe Tesoura Papel = True
ganhaDe Tesoura Tesoura = False

ganhadores [] = []
ganhadores xs = if conv (last xs) then ganhadores (init xs) ++[length xs - 1] else ganhadores (init xs) 
  where
    conv (a,b) = ganhaDe a b




--[Classe de Tipos]Pessoa
import Data.List
data Pessoa = Pessoa { nome :: String, idade :: Int, salario :: Float }
data Criterio = ByNome | ByIdade | BySalario

pessoas :: [Pessoa]
pessoas = [ Pessoa "Joao" 25 2000, Pessoa "Ana" 20 2500, Pessoa "Alyson" 22 2200]

instance Show Pessoa where
    show (Pessoa nome idade salario) = show nome ++ " tem " ++ show idade ++ " anos e ganha de salario " ++ show salario  

compareNome :: Pessoa -> Pessoa -> Ordering
compareNome (Pessoa nome1 idade1 salario1) (Pessoa nome2 idade2 salario2)
  | compare nome1 nome2 == GT = GT
  | otherwise = LT

compareIdade :: Pessoa -> Pessoa -> Ordering
compareIdade (Pessoa nome1 idade1 salario1) (Pessoa nome2 idade2 salario2) 
  | compare idade1 idade2 == GT = GT
  | otherwise = LT

compareSalario :: Pessoa -> Pessoa -> Ordering
compareSalario (Pessoa nome1 idade1 salario1) (Pessoa nome2 idade2 salario2)
  | compare salario1 salario2 == GT = GT
  | otherwise = LT

sortListPessoa :: [Pessoa] -> Criterio -> [Pessoa]
sortListPessoa pessoas ByNome = sortBy compareNome pessoas
sortListPessoa pessoas ByIdade = sortBy compareIdade pessoas
sortListPessoa pessoas BySalario = sortBy compareSalario pessoas




--[Classe de Tipos]Polinomio
import Polinomio
makePol :: (Eq a, Num a) => [a] -> Polinomio a
makePol [] = polZero
makePol (x:xs) = if x==0 then makePol xs else consPol x ( length xs ) ( makePol xs )

derivada x = if  a == 0 then polZero else consPol ( a * b ) ( a - 1 ) ( derivada c )
	where
    a = grau x
    b = coefLider x
    c = restoPol x