module Queue (Queue, enqueue, dequeue, front, empty, isEmpty, makeQueue, size) where

data Queue a = Q [a] deriving (Show)

enqueue :: a -> Queue a -> Queue a
enqueue x (Q xs) = Q (xs ++ [x])

dequeue :: Queue a -> Queue a
dequeue (Q (_:xs)) = Q xs
dequeue _          = error "Queue.dequeue: empty queue"

front :: Queue a -> a
front (Q (x:_)) = x
front _         = error "Queue.front: empty queue"

empty :: Queue a
empty = Q []

isEmpty :: Queue a -> Bool
isEmpty (Q []) = True
isEmpty (Q _ ) = False


makeQueue :: [a] -> Queue a
makeQueue xs = foldl (flip enqueue) empty xs

size :: Queue a -> Int
size s | isEmpty s = 0
			 | otherwise = 1 + size (dequeue s)
