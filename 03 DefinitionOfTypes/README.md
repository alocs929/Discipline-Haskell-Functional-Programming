## Answers

# ArvoreExpressao

A aŕvore binária de expressões aritméticas é uma aplicação específica de uma árvore binária para
avaliar expressões aritméticas. Nesse tipo de árvore, os nós armazenam operadores binários e as folhas armazenam os operandos. 

data ArvoreExpressao = No (Int->Int->Int) ArvoreExpressao ArvoreExpressao| Folha Int

Uma expressão aritmética também podem ser representada pelo seguinte tipo recursivo em Haskell:

```haskell
data Expr = Val Int
| Soma Expr Expr
| Mult Expr Expr
| Div Expr Expr
| Sub Expr Expr
|Mod Expr Expr
deriving (Read,Eq,Show)
```

**Ps:** **Não esqueça de colocar a Expr na classe Read**

Escreva a função (eval :: ArvoreExpressao -> Int) tal que (eval arv) devolve o valor da expressão aritmética representada na árvore.

```haskell
eval ( fromExpr (Soma (Val 3) (Val 4)) ) == 7
eval ( fromExpr (Mult (Val 3) (Val 4)) ) == 12
eval ( fromExpr (Div (Val 3) (Val 4)) ) == 0
eval ( fromExpr (Sub (Val 3) (Val 4)) ) == -1
```

Escreva a função (showExpr :: Expr -> String) tal que (showExpr expr) devolve a representação como uma string da expressão aritmética expr.

```haskell
*Main> showExpr $ Mod (Mult (Val 3) (Val 4)) (Div (Val 4)(Val 3))
"((3 * 4) % (4 / 3))"

*Main> showExpr $ Mod (Mult (Val 3) (Val 4)) (Div (Val 4)(Val 3))
"((3 * 4) % (4 / 3))"

*Main> showExpr $ Soma (Mult (Val 3) (Val 4)) (Div (Val 4)(Val 3))
"((3 * 4) + (4 / 3))"

*Main> showExpr $ Mult (Val 3) (Val 4)
"(3 * 4)"
```

# LinkedList

Escreva uma implementação de uma lista encadeada simples. A lista encadeada é estrutura de dados fundamental na ciência da computação. Dado a seguinte definição de lista encadeada:

```haskell
data LinkedList a = Vazia | No a (LinkedList a) deriving (Eq, Show)
```

Implemente as seguintes funções:

Escreva a função (fromList :: [a] -> LinkedList a) tal que (fromList xs) devolve uma lista encadeada com os elementos da lista xs seguindo a ordem dos elementos da lista.

```haskell
fromList [1,2,3] == No 1 (No 2 (No 3 Vazia))
fromList [1,2,3,4] == No 1 (No 2 (No 3 (No 4 Vazia)))
fromList [1,2,3,4,2] == No 1 (No 2 (No 3 (No 4 (No 2 Vazia))))
```

Escreva a função (toList :: LinkedList a -> [a]) tal que (toList l) devolve uma lista com os elementos da lista encadeada seguindo a ordem dos elementos da lista encadeada.

```haskell
toList ( fromList [1,2,3,4,2] ) == [1,2,3,4,2]
toList ( fromList [1,6,5,4,2] ) == [1,6,5,4,2]
toList ( fromList [1,6,5,3,2] ) == [1,6,5,3,2]
```

Escreva a função (append :: a -> LinkedList a -> LinkedList a) tal que (append x l)
devolve uma lista encadeada com o elemento x no final da lista
encadeada l.

```haskell
append 3 (fromList [4,3,1,2]) == No 4 (No 3 (No 1 (No 2 (No 3 Vazia))))
append 8 (fromList [4,3,1,2]) == No 4 (No 3 (No 1 (No 2 (No 8 Vazia))))
append 7 (fromList [4,3,1,2]) == No 4 (No 3 (No 1 (No 2 (No 7 Vazia))))
```

Escreva a função (reverseLinkedList :: LinkedList a -> LinkedList a) tal que (reverseLinkedList l) devolve uma a lista encadeada l invertida.

```haskell
reverseLinkedList (No 1 (No 2 (No 3 Vazia))) == No 3 (No 2 (No 1 Vazia))
reverseLinkedList (No 5 (No 4 (No 2 Vazia))) == No 2 (No 4 (No 5 Vazia))
```

# Mobile

Um móbile é constituído de pendentes, fios e barras. Em cada uma das extremidades de uma barra de um mobile é preso um fio, no qual pode estar pendurado um pendente ou uma nova barra. Barras e fios são considerados elementos sem peso e pendentes possuem um peso (representado por um valor inteiro). O seguinte tipo de dado pode ser usado para representar um móbile:

```haskell
data Mobile = Pendente Int | Barra Mobile Mobile deriving (Eq, Show)
```

O peso de um móbile é igual à soma dos pesos de todos os seus pendentes. Um móbile é balanceado se ele consiste de um único pendente ou se os pesos dos móbiles pendurados nas duas extremidades da sua barra são iguais e esses móbiles são balanceados.

Defina a função balanceado :: Mobile -> Bool que determina se o móbile dado como argumento é ou não balanceado ou não.

Dica: Defina a função auxiliar peso :: Mobile -> Int que retorna o peso do móbile dado como argumento.

# MakeMobile

Considere o seguinte tipo de dado usado para representar um móbile:

```haskell
data Mobile = Pendente Int | Barra Mobile Mobile deriving (Eq, Show)
```

Defina a função makeMobile :: [Int] - > Mobile tal que (makeMobile xs) transforma a lista de inteiros xs em um móbile. Se a lista tem apenas um elemento, o móbile devolvido é Pendente x, caso contrário, a lista é dividida em duas metades e a função makeMobile é chamada para cada metade.

```haskell
makeMobile [1] == Pendente 1
makeMobile [1,2,3,4] == Barra (Barra (Pendente 1) (Pendente 2)) (Barra (Pendente 3) (Pendente 4))
makeMobile [1,2,3] == Barra (Pendente 1) (Barra (Pendente 2) (Pendente 3))
```

# Eqsplits

# Splits

# NumPassageiros