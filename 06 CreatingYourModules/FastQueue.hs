module FastQueue (FastQueue, enqueue, dequeue, front, empty, isEmpty) where

data FastQueue a = Q ([a],[a]) -- par frente, traseiras

norm :: ([a],[a]) -> ([a],[a])
norm ([],tr) = (reverse tr, [])
norm (fr,tr) = (fr,tr)


enqueue :: a -> FastQueue a -> FastQueue a
enqueue x (Q (fr,tr)) = Q (norm (fr, x:tr))

dequeue :: FastQueue a -> FastQueue a
dequeue (Q (x:fr,tr)) = Q (norm (fr,tr))
dequeue _             = error "Queue.dequeue: empty queue"

front :: FastQueue a -> a
front (Q (x:fr, tr)) = x
front _              = error "Queue.front: empty queue"

empty :: FastQueue a
empty = Q ([],[])

isEmpty :: FastQueue a -> Bool
isEmpty (Q ([],_)) = True
isEmpty (Q (_,_)) = False



