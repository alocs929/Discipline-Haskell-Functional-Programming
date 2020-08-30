# Answers

# [Tipo Multiconjunto]remove

Considere a definição em Haskell dum tipo de dados para multiconjuntos (i.e. coleções sem ordem mas com repetições) representado como árvore de pesquisa:

```haskell
data MConj a = Vazio | No a Int (MConj a) (MConj a)
```

Cada no contém um valor e a sua multiplicidade (i.e. o numero de repetições); para facilitar a pesquisa, a arvore deve estar ordenada pelos valores. 

Por exemplo:

No 'A' 2 Vazio (No 'B' 1 Vazio Vazio)

representa o multi-conjunto {A, A, B} com dois carateres 'A' e um 'B'. Escreva a função ( remove :: Ord a => a -> Int -> MConj a -> MConj a) tal que (remove x q m) remove no máximo q ocorrência de x no multiconjunto m.

```haskell
- Main> remove 1 2 $ No 1 3 Vazia (No 2 3 Vazia Vazia)
No 1 1 Vazia (No 2 3 Vazia Vazia)
- Main> remove 1 3 $ No 1 3 Vazia (No 2 3 Vazia Vazia)
No 2 3 Vazia Vazia
- Main> remove 1 4 $ No 1 3 Vazia (No 2 3 Vazia Vazia)
No 2 3 Vazia Vazia
- Main> remove 2 1 $ No 1 3 Vazia (No 2 3 Vazia Vazia)
No 1 3 Vazia (No 2 2 Vazia Vazia)
- Main> remove 2 3 $ No 1 3 Vazia (No 2 3 Vazia Vazia)
No 1 3 Vazia Vazia
```

# [Tipo Arvore Binaria de Busca]insertArvore

Considere a seguinte definição de árvore binária do tipo a

```haskell
**data** Arv a = Vazia | No a ( Arv a ) ( Arv a ) **deriving** (Eq , Show)
```

Escreva a função insertArvore :: Ord a => a -> Arv a -> Arv a tal que (insertArvore x arv) insere um valor x numa árvore de pesquisa ordenada arv, inserindo os valores menores ou iguais a raiz na
subárvore da esquerda e os valores maiores na subárvore da direita.

# [Tipo Arvore Binaria]foldTree

A árvore binária é uma das estrutura de dados mais usadas. Nesta modelagem de árvore binária, o conteúdo da árvore é armazenado apenas nas folhas. Uma árvore binária é formada por nó folha que contém um valor do tipo a ou nó Ramo formado por duas subárvores.

```haskell
data Arvore a = Folha a | Ramo (Arvore a) (Arvore a) deriving (Show)
```

Defina a função foldTree :: (a->b) -> (b->b->b) -> Tree a -> b que recebe duas função como argumento, a primeira deve ser chamada na folhas e a segunda deve ser chamada para os nós internos.

Exemplos:

```haskell
arv1 = Ramo (Folha 1) (Folha 2)
arv2 = Ramo (Folha 5) (Ramo (Folha 4) (Folha 3))
arv3 = Ramo (Ramo (Folha 5) (Folha 4)) (Ramo (Folha 2) (Ramo (Folha 1) (Folha 6)))
foldTree (\x -> x) ( \x y -> x+y ) arv1 == 3
foldTree (\x -> x) ( \x y -> x+y ) arv2 == 12
foldTree (\x -> x) ( \x y -> x+y ) arv3 == 18
```

PS: Não esqueça de escrever a definição do tipo Arvore a.

# [Tipo Multiset]makeMultiSet

Matematicamente, um multiconjunto é uma generalização de um conjunto que permite elementos repetidos. Vamos representar um multiconjunto da seguinte maneira:

```haskell
data MultiSet a = MultiSet [(a,Int)] deriving (Show)
```

Defina a função makeMultiSet :: [a] -> MultiSet a tal que makeMultiSet xs devolve o multiconjunto m definido pela lista xs, sendo que os elementos de m aparecem ordenados.

```haskell
makeMultiSet [9,3,1,1,4,2,1,7,8,9,2,1] == MultiSet [(1,4),(2,2),(3,1),(4,1),(7,1),(8,1),(9,2)]
```

# [Tipo Arvore Binaria] menorNivelFolha

Considere a seguinte definição de árvore binária:

```haskell
data ArvBin a = Vazia | No a ( ArvBin a ) ( ArvBin a ) deriving (Show)
```

Considere a seguinte árvore:

1

/ \

2 3

/ \ / \

4 5 6 7

/ \

8 9

As folhas com o menor nível são 4, 6 e 7.

Defina a função menorNivelFolha :: ArvBin a -> [a] tal que (menorNivelFolha arv) devolve a lista das folhas com o menor nível na árvore.

Entrada:

1

/ \

2 3

/ \ / \

4 5 6 7

/ \

8 9

Saída:

[4,6,7]

Dica: Faça uma função para descobrir o menor nível da folha e depois faça uma outra função para percorrer a árvore juntando as folhas com o nível
igual ao menor nível encontrado pela outra função.

# [Tipo Arvore Binaria]removeFolhas

Considere a seguinte definição de árvore binária:

```haskell
data ArvBin a = Vazia | No a ( ArvBin a ) ( ArvBin a ) deriving (Show)
```

Escreva a definição de removeFolhas :: ArvBin a -> ArvBin a tal que (removeFolhas arv) remove todas as folhas da árvore arv.

Entrada

1

/

2

Saída

1

Entrada:

1

/ \

2 3

/ /

4 5

Saída:

1

/ \

2 3

Por exemplo,

removeFolhas (No 1 Vazia (No 2 Vazia Vazia)) == No 1 Vazia Vazia

removeFolhas (No 1 (No 2 Vazia (No 4 Vazia Vazia)) (No 5 (No 6 Vazia Vazia) (No 7
Vazia Vazia))) == No 1 (No 2 Vazia Vazia) (No 5 Vazia Vazia)

# [Tipo Arvore Binaria]cheia

Considere a seguinte definição de árvore binária:

```haskell
data ArvBin a = Vazia | No a ( ArvBin a ) ( ArvBin a ) deriving (Show)
```

Uma árvore binária T é dita cheia se cada nó é uma folha ou possui
exatamente dois filhos. Em outras palavras, todo nó interno é um nó
cheio. Um nó é dito cheio quando possui exatamente dois filhos.

Escreva a definição de cheia :: ArvBin a -> Bool tal que (cheia arv) verifica se arv é uma binária cheia.

Entrada:

2

/ \

5 4

/ \

5 6

Saída

True

Entrada:

5

/ \

6 5

/ /

5 4

Saída

False

Observe que o número de nós cheios somados com o número de folhas tem que ser igual ao total de nós.

# [Tipo MultiSet]insere

Considere a seguinte definição de multiconjunto como uma lista ordenada de pares ordenados.

```haskell
data MultiSet a = MultiSet [(a,Int)] deriving (Show)
```

Defina a função insere :: a -> MultiSet a -> MultiSet a tal que makeMultiSet a m devolve o multiconjunto definido pela inserção do elemento a no multiconjunto m.

```haskell
insere 2 (MultiSet [(2,1),(5,1),(8,1)]) == MultiSet [(2,2),(5,1),(8,1)]
insere 4 MultiSet [(1,3),(2,1),(5,1),(8,1)] == MultiSet [(1,3),(2,1),(4,1),(5,1),(8,1)]
```

PS: Coloque a definição do MultiSet na sua solução

# [Tipo Multiset]delete

Considere a representação do multiconjunto como uma lista ordenada de pares ordenados.

```haskell
data MultiSet a = MultiSet [(a,Int)] deriving (Show)
```

Defina a função delete :: a -> Int -> MultiSet a tal que (delete a n m) devolve o multiconjunto resultante da deleção de n ocorrências do elemento a no multiconjunto m.

```haskell
delete 1 2 MultiSet [(1,2)] == MultiSet []
delete 1 2 MultiSet [(1,3)] == MultiSet [(1,1)]
delete 7 4 MultiSet [(1,3),(4,1),(5,1),(6,1),(7,1)] == MultiSet [(1,3),(4,1),(5,1),(6,1)]
```