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


-- getLine:: IO String
-- getLine = do
--   c <- getChar
--   if c == '\n' then
--     return []
--   else do
--     xs <- getLine
--     return (c:xs)

-- [IO]Codigo Ultron


-- [IO]É uma função?


-- [IO]OrdenaNomes


-- [Maybe] Equilibrista


-- [Maybe]Familia