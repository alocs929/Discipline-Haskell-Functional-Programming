-- [IO]HelloWorld

printMultipleLines :: Int -> IO ()
printMultipleLines n
   | n <= 0 = return ()
   | otherwise = do
     putStrLn "Ola Mundo"
     printMultipleLines (n-1)

main = do
  line <- getLine
  let n = (read :: String -> Int) line
  printMultipleLines n



-- [IO]Codigo Ultron
calculaPorcentagem :: Int -> Int -> String
calculaPorcentagem tamanho contidas
  | tamanho == contidas = "chefe "
  | contidas > div tamanho 2 = "ultron "
  | otherwise = "pessoa "

verificaPalavraUltron :: String -> String -> Int
verificaPalavraUltron ulton [] = 0
verificaPalavraUltron ulton (x:xs)
  | elem x ulton == True = verificaPalavraUltron ulton xs + 1
  | otherwise = verificaPalavraUltron ulton xs

printList :: [String] -> IO ()
printList [] = return ()
printList (x:xs) = do 
  putStrLn x
  printList xs

transformaPalavras :: String -> [Char] -> IO ()
transformaPalavras ulton xs = putStrLn (reverse (drop 1  (reverse (concat [calculaPorcentagem (length z) (verificaPalavraUltron ulton z) | z <- x]))))
                                where x = words xs

lerETransformaPalavras :: String -> IO ()
lerETransformaPalavras ultron = do
    palavras <- getLine
    transformaPalavras ultron palavras

main :: IO ()
main = do
  ultron <- getLine
  lerETransformaPalavras ultron



-- [IO]É uma função?




-- [IO]OrdenaNomes
import Data.List

main = do
  line <- getLine
  let n = (read :: String -> Int) line
  xs <- getMultiplesLines n
  printList (sort xs)

getMultiplesLines :: Int -> IO [String]
getMultiplesLines 0 = return []
getMultiplesLines n = do
  line <- getLine
  xs <- getMultiplesLines (n-1)
  return (line : xs)

printList [] = return ()
printList (x:xs) = do
  putStrLn x
  printList xs



-- [Maybe] Equilibrista
type Passaros = Int
type Barra = (Passaros, Passaros)

-- data Maybe a = Just a | Nothing

pousoEsq:: Passaros -> Barra -> Maybe Barra
pousoEsq n (esq,dir)
    | abs ((esq + n) - dir) < 4 = Just (esq + n, dir)
    | otherwise = Nothing

pousoDir:: Passaros -> Barra -> Maybe Barra  
pousoDir n (esq,dir)
    | abs (esq - (dir+n)) < 4 = Just (esq, dir+n)
    | otherwise = Nothing

processa :: [String] -> Barra -> Maybe Barra
processa [] b1 = return b1
processa (x:xs) b1 = do
  let [cmd, param] = words x
  let n = (read :: String -> Int) param
  case cmd of
    "pousoDir" -> do
      b2 <- pousoDir n b1
      processa xs b2
    "pousoEsq" -> do
      b2 <- pousoEsq n b1
      processa xs b2

main = do
  contents <- getContents
  let lista = lines contents
  case processa lista(0,0) of
    Nothing -> putStrLn "caiu"
    Just (esq,dir) -> putStrLn $ concat [ show esq, " ", show dir]



-- [Maybe]Familia