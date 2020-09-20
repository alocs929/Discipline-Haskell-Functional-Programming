--[Classes de Tipos]NumerosComplexos




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

-- transforma listas de listas de
-- floats numa matriz
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





--[Classe de Tipos]Polinomio

