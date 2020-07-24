## Answers

## Remove

Defina uma função remove :: Eq a => a -> [a] -> [a] tal que (remove x xs) devolve uma lista obtida removendo uma ocorrências de x em xs, caso ela exista. Por exemplo,

```haskell
remove 2 [2,3,4,5] == [3,4,5]

remove 2 [1,3,2,4] == [1,3,4]
```

## Inserir

Defina uma função inserir :: Ord a => a -> [a] -> [a] tal que (inserir x xs) recebe um elemento x e uma lista ordenada de maneira crescente
devolvendo uma lista ordenada ascendentemente, oriunda da inserção
apropriada de x em xs. Por exemplo,

```haskell
inserir 3 [2,7,12] == [2,3,7,12]
```

## Subconjunto

Defina uma função subconjunto :: Eq a => [a] -> [a] -> Bool tal que (subconjunto xs ys) verifica xs é um subconjunto de ys. Por exemplo,

```haskell
subconjunto [ 3 , 2 , 3 ] [ 2 , 5 , 3 , 5 ] == True

subconjunto [ 3 , 2 , 3 ] [ 2 , 5 , 6 , 5 ] == F a l s e
```

## SomaConsecutivos

Defina a função somaConsecutivos tal que (somaConsecutivos xs) é a soma dos pares de elementos consecutivos de uma lista xs. Por exemplo,

```haskell
somaConsecutivos [3,1,5,2] == [4,6,7]

somaConsecutivos [3] == []
```

## FiltrandoCaudas

Escreva uma função filtrandoCaudas :: [[Int]] -> [[Int]] usando compreensão de listas tal que (caudas xss) devolve uma lista contendo a cauda das listas não vazias

```haskell
filtrandoCaudas [[2,3,5,6],[2,5,7,9],[4,5,6,7]] == [[3,5,6],[5,7,9],[5,6,7]]
```

## AbundantesMenores

Defina a função abundantesMenores tal que (abundantesMenores n) devolve uma lista de números abundantes menores ou igual a n.

```haskell
abundantesMenores 50 == [12,18,20,24,30,36,40,42,48]
abundantesMenores 100 = [12,18,20,24,30,36,40,42,48,54,56,60,66,70,72,78,80,84,88,90,96,100]
```

## Frequencia

Defina a função frequencia :: a -> [a] -> Int tal que (frequencia x xs) devolve o número de
ocorrências de x em u. Por exemplo,

```haskell
frequencia 2 [1,2,3,2,4] == 2

frequencia 2 [2,1,2,3,2,4,2] == 4
```

Considere os seguintes casos:

```haskell
frequencia a [] =
frequencia a (x:xs) | x == a
	| otherwise =
```

## Agrupa

Defina a função agrupa :: Eq a => [[a]] -> [[a]] tal que (agrupa xss) é uma lista de listas obtidas agrupando os primeiros elementos, os segundos elementos, de forma que o comprimento das listas dos resultados seja igual a lista mais curta de xss. Por exemplo,

```haskell
agrupa [[1..6 ], [7..9], [10..20]] == [[1,7,10],[2,8,11],[3,9,12]]
agrupa [] == []
```

## InsertSort

Usando a função insert, escreva a função insertSort :: Ord a => [a] -> [a] tal que (insertSort xs) recebe uma lista possivelmente não ordenada xs e devolve uma lista ordenada implementando ordenação pelo método de inserção:

• Se a lista é vazia, então já está ordenada;

• Se a lista é não vazia (x : xs), então inserimos x na lista ordenada obtida pela ordenação de xs.

## TemLetraOuDigito

Defina a função temLetraOuDigito :: String -> Bool, usando foldr, que recebe um argumento do tipo String e devolve True, se a string contém algum letra (minúscula ou maiúscula) ou algum dı́gito, e False, caso contrário.

Dica: Use as funções isLetter :: Char -> Bool e isDigit:: Char -> Bool importando o módulo Data.Char adicionando a seguinte instrução import Data.Char.

## FiltrandoListas

Defina uma função filtrandoListas :: [[a]]->[[a]] tal que (filtrandoListas xss) devolve uma lista
contendo o maior prefixo do mesmo tamanho de cada lista de xss.

```haskell
filtrandoListas [[3,2,1],[3,4],[4,3,2,1]] == [[3,2],[3,4],[4,3]]
```

## Chococola

Sem sucesso

Você vê a seguinte oferta especial pela loja de conveniência:

"Uma garrafa de Choco Cola para cada 3 garrafas vazias retornadas”

Agora você decide comprar algumas (digamos N) garrafas de refrigerante da
loja. Você gostaria de saber como você pode obter o máximo de choco cola deles.

A figura abaixo mostra o caso onde N = 8. O método 1 é o modo padrão:
depois de terminar o seu 8 garrafas de cola, você tem 8 garrafas vazias. Tome 6 deles e você recebe 2 novas garrafas de cola. Agora depois bebendo-os você tem 4 garrafas vazias, então você pega 3 delas para obter outra nova cola. Finalmente, você tem apenas 2 garrafas na mão, então você não pode mais usar cola nova.
Portanto, você bebeu 8 + 2 + 1 = 11 garrafas de cola.

Você pode realmente fazer melhor! No Método 2, você primeiro toma emprestado uma garrafa vazia do seu amigo, então você pode beber de 8 + 3 + 1 = 12 garrafas de cola! Claro, você terá que Devolva sua garrafa vazia restante para o seu amigo.

Defina uma função chococola :: Int -> Int tal que (cola n) devolve o número de garrafas de cola bebidas usando o método 2.

```haskell
chococola 81 == 121
chococola 40 == 60
chococola 20 == 30
chococola 60 == 90
```

Dica: Faça uma função auxiliar garrafa :: Int -> Int -> Int tal que (garrafas cheias vazias)

devolve o número de chococolas beb idas considerando que cheias representa o
número de garrafas cheias e vazias representa o número de garrafas
vazias.

## NoIntervalo

Usando compreensão de listas, Escreva a função noIntervalo :: Int -> Int -> [Int] -> [Int] tal que (noIntervalo a b xs) retorna todos os valores de xs que são maiores ou iguais a e menores ou iguais a a b. Por exemplo,

```haskell
noIntervalo 5 10 [1..15] == [5,6,7,8,9,10]

noIntervalo 2 1 [1,2,3,4] == []

noIntervalo 1 2 [1,2,2,3,4,1] == [1,2,2,1]
```

## Intercala

Defina a função intercala :: a -> [a] -> [a] que intercala um elemento entre valores consecutivos

numa lista; se a lista tiver menos de dois valores deve ficar inalterada. Exemplos:

```haskell
> intercala 0 [1..4]
[1,0,2,0,3,0,4]
> intercala ',' ”abcd”
”a,b,c,d”
> intercala ',' ”a”
”a”
> intercala 1 [ ]
[]
```

## MetadePares

Usando apenas funções da Biblioteca Prelude, escreva a função metadePares ::
[Integer] -> [Integer] tal que (metadePares xs) devolve a lista dos elementos que são pares de xs divididos por 2. Por exemplo,

```haskell
metadePares [0,-1,3,4,-16,3] == [0,2,-8]
```

## Insert

A função insert :: Ord a => a -> [a] -> [a] tal que (insert x xs) devolve uma lista ordenada obtida pela inserção de x na lista ordenada xs.

Exemplo:

```haskell
 insert 2 [0,1,3,5] == [0,1,2,3,5]
```

## MaiorSalto

Dado uma lista de números inteiros, definiremos o maior salto como o maior valor das diferenças (em valor
absoluto) entre números consecutivos da lista. Por exemplo, dada uma lista [2,5,-3,7]

- 3 (valor absoluto de 2 - 5)
- 8 (valor absoluto de 5 - (-3))
- 10 (valor absoluto de -3 - 7)

Portanto o maior salto é 10. Não esta definido o maior salto para uma lista com menos de 2 elementos.

Defina a função maiorSalto :: [Integer] -> Integer tal que maiorSalto xs é o maior salto da lista xs. Por exemplo,

```haskell
maiorSalto [1,5] == 4
maiorSalto [10,-10,1,4,20,-2] == 22
```

## Remdups

A função remdups remove elementos duplicados adjacentes de uma lista. Por exemplo,

```haskell
remdups [1,2,2,3,3,3,1,1] = [1,2,3,1] 
```

## Descompacta

Defina a função descompacta :: [(a, b)] -> ([a], [b]) que transforma uma lista de pares ordenado em um par ordenado onde o primeiro elemento é uma lista dos primeiros componentes dos pares ordenados e o segundo elemento é uma lista dos segundos componentes dos pares ordenados.

```haskell
descompacta [(1,2),(3,4),(5,6),(4,5)] == ([1,3,5,4],[2,4,6,5])
descompacta [(1,2),(3,4),(5,6),(4,5),(5,6)] == ([1,3,5,4,5],[2,4,6,5,6])
```

## Pontos

Num sorteio que distribui prêmios, um participante inicialmente sorteia uma lista de valores inteiros. O número de pontos do participante é o tamanho da maior sequência de valores consecutivos iguais. Por exemplo,
suponhamos que um participante sorteia 11 valores e, nesta ordem, os
valores são [30, 30, 30, 30, 40, 40, 40, 40, 40, 30,30]. Então, o participante ganha 5 pontos,
correspondentes aos 5 valores 40 consecutivos.

Note que o participante sorteou 6 valores iguais a 30, mas nem todos são consecutivos.

Escreva uma função pontos :: [Int] -> Int tal que (pontos xs) devolve o número de pontos do participante considerando a lista de valores sorteados xs.

```haskell
pontos [30,30,30,40,40,40,40,40,30,30,30] == 5
pontos [1,1,1,20,20,20,20,3,3,3,3,3,3,3] == 7
```

Dica: use a função takeWhile :: [a] -> (a->Bool)->[a] e dropWhile :: [a] -> (a->Bool)->[a]

## Merge

Defina a função merge :: [a] -> [a] -> [a] tal que (merge xs ys) é uma lista ordenada obtida pela entrelaçamento de duas listas ordenadas xs e ys. Por exemplo,

```haskell
merge [2,5,6] [1,3,4] == [1,2,3,4,5,6]
merge [3,5,6, 8] [1,3,4,5] == [1,3,3,4,5,5,6,8]
```