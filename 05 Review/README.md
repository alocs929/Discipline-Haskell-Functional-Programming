# [Tuplas]tribonacci

A sequencia de Tribonacci é uma generalização da sequência de Fibonacci sendo que cada termo é a soma dos três anteriores.

Defina a função tribonacci :: Int -> (Int,Int,Int) tal que tribonacci n devolve a seguinte tripla ( f(n-2), f(n-1), f(n) ). A função tribonacci está definida para todo n >= 2.

# [Recursao]romanos

Os romanos eram um povo inteligente. Eles conquistaram a maior parte da Europa e governaram por centenas de anos. Eles inventaram estradas de concreto. Uma coisa que eles nunca descobriram foi o número zero. Isso fez com que escrever e datar sua extensa história de suas explorações fossem um pouco mais desafiadoras, mas o sistema de números que eles criaram ainda está em uso hoje.

Os romanos escreviam números usando letras - I, V, X, L, C, D, M.

1 => I

10 => X

7 => VII

Escreva uma função romanos :: Int-> String tal que romanos n devolve o número n na numeração romana. A entrada será sempre menor ou igual a 3000.

# [Tuplas, Listas Infinitas]pell

Os números de Pell são definidos pela seguinte relação de recorrência:

...

Em outras palavras, a sequência de Pell começa com 0 e 1, e cada número de Pell é a soma

de duas vezes o número de Pell anterior e o número de Pell antes do anterior.

Os primeiros termos dessa sequência são: 0,1,2,5,12,29,70,...

Defina a função pell :: Int -> (Int, Int) tal que pell n devolve a seguinte par ( P(n-1), P(n)). A

função pell está difinida para todo n >= 1.

pell 1 == (0,1)

pell 2 == (1,2)

pell 3 == (2,5)

pell 25 == (543339720,1311738121)

# [Recursao]binario

Escreva a definição da função binario :: Int -> [Int] que calcula a representação de um inteiro positivo em algarismos binários (0 ou 1). A lista resultado deve estar ordenada do algarismo menos significativo para o mais significativo.

Exemplo:

binario 6 = [0, 1, 1]

# [Recursao, Listas]subidas

Vamos representar as temperaturas médias de vários dias consecutivospor uma lista de valores Float.

Escreva uma definição da função subidas :: [Float] -> Int que calcula quantas vezes a temperatura subiu (isto é, a temperatura do dia anterior foi estritamente inferior à do dia atual). No caso de a lista de temperaturas ter menos de dois valores, o resultado deverá ser zero.
Exemplos:

```haskell
subidas [19,20,21,22] = 3
subidas [19,20,20,22] = 2
subidas [20,19,18,19] = 1
subidas [20,21,20,19,19,22,23] = 3
subidas [20,20] = 0
subidas [20] = 0
subidas [] = 0
```

# [Tuplas]maiorIndices

Escreva a função maiorIndices tal que (maiorIndices xs) devolve uma tupla (z,ys) onde z é o maior elemento da lista xs e ys é uma lista das posições de z em xs.

```haskell
maiorIndices [1,6,4,6] == (6, [1,3])
maiorIndices [1,3,3,3,2,2,3] == (3,[1,2,3,6])
```

# [Recursao]fracaoContinua

Uma fração contínua simples é uma expressão da forma

...

Os termos  são denominados quocientes parciais. Por exemplo,

...

Os quocientes parciais de uma fração contínua podem ser obtidos pelo algoritmo de Euclides. Aplicando o algoritmo de Euclides para encontrar o máximo divisor comum de 10 e 7 temos:

...

obtendo que o mdc é 1. A fração contínua pode ser obtida da seguinte maneira:

...

Observe que os quocientes do algoritmo de Euclides para ... e  ... são exatamente os quocientes parciais da fração contínua .

Considere a seguinte definição de Fração:

data Fracao = F Int Int

Defina uma função fracaoContinua :: Fracao -> [Int] tal que fracaoContinua f devolve uma lista de inteiros representando os quocientes parciais da fração f.

- Main> fracaoContinua (F 10 7)

[1,2,3]

- Main> fracaoContinua (F 137 33)

[4,6,1,1,2]

- Main> fracaoContinua (F 81 35)

[2,3,5,2]

# [Recursão]caminho

Considere a representação de um grafo dirigido de vértices inteiros como uma lista de arestas (isto é, pares ordenados de verties).

Escreva uma função caminho :: [(Int,Int)] -> [Int] -> Bool tal que caminho g xs é True se xs é uma lista de vértices que representa um caminho no grafo (isto é, se cada dois vérties consecutivos correspondem a uma aresta) e False caso contrário. Exemplos:

```haskell
caminho [(1, 2),(2, 1),(2, 3)] [] = True
caminho [(1, 2),(2, 1),(2, 3)] [1] = True
caminho [(1, 2),(2, 1),(2, 3)] [1, 2, 1, 2, 3] = True
caminho [(1, 2),(2, 1),(2, 3)] [1, 2, 1, 3] = False
```

# [Tipo Arvore]kMaior

Considere a seguinte definição de árvore binária:

```haskell
data Arv a = Vazia | No a ( Arv a ) ( Arv a ) deriving (Eq , Show)
```

Escreva a função kMaior :: Ord a => Int -> Arv a -> a tal que (kMaior k arv ) devolve o k-ésimo maior numa árvore de pesquisa ordenada arv com tamanho pelo menos k tal que os valores menores ou iguais ao elemento raiz estão na subárvore da esquerda e os valores maiores estão na subárvore da direita.

Por exemplo,

```haskell
kMaior 3 (No 10 (No 4 (No 2 Vazia Vazia) Vazia) (No 20 (No 15 Vazia Vazia) (No 40 Vazia Vazia))) == 15

kMaior 6 (No 1 Vazia (No 4 (No 2 Vazia Vazia) (No 7 (No 5 Vazia Vazia) (No 9 Vazia Vazia)))) == 1

Entrada: k = 3
    10
    / \
   4  20
  /   / \
 2   15 40
Saida : 15

Entrada k = 6
    1
   / \
  4  7
 /  / \
2  5 9
Saida: 1
 
Entrada: k = 1
   10
   / \
  4  20
 /  / \
2  15 40
Saida : 40

Entrada: k = 2
    10
   / \ 
  4  20
 /  / \
2  15 40
Saida : 20

Entrada: k = 4
   10
  / \
 4  20
/  / \
2 15 40
Saida : 10
```

PS: Não vale fazer o percurso em ordem na árvore.

# [Tipo Arvore]isHeap

Considere a seguinte definição de árvore biária:

```haskell
data Arvore a = Vazia | No a (Arvore a) (Arvore a) deriving (Show)
```

Para uma árvore binária precisa cumprir uma condição para ser um heap:

- O valor de cada nó deve ser maior ou igual ao seu nó filho (considerando o heap máximo).

Defina uma função isHeap :: Arvore a -> Bool tal que (isHeap arv) verifica se a árvore binária satisfaz a propriedade heap ou não.

```haskell
Entrada:
    97
   /  \
  46  37
 / \  / \
12 3  7 31
Saida:
True

Entrada:
    97
   / \
  46  37
 / \  / \
12 3  7 38
Saida:
False

Exemplo:
isHeap ( No 25 (No 12 Vazia (No 6 Vazia Vazia)) (No 15 Vazia (No 4 Vazia Vazia)) ) == True

```

Dica: Use a função getValue :: Arvore a -> a que devolve o valor do nó.
getValue (No x esq dir) = x

# [Tipo Arvore]minMax

Considere a seguinte definição de árvore binária:

```haskell
data Arv a = Vazia | No a ( Arv a ) ( Arv a ) deriving (Eq , Show)
```

Escreva a função minMax :: Ord a => Arv a -> (a,a) tal que (minMax arv)
devolve o menor e o maior elemento numa árvore de pesquisa ordenada arv não vazia tal que os valores menores ou iguais ao elemento raiz estão na subárvore da esquerda e os valores maiores estão na subárvore da direita.

```haskell
minMax (No 4 (No 1 Vazia (No 3 Vazia Vazia)) (No 7 Vazia Vazia)) == (1,7)
minMax (No 4 (No 2 (No 1 Vazia Vazia) Vazia) (No 17 (No 10 (No 9 (No 5 Vazia Vazia) Vazia) Vazia) Vazia)) == (1,17)
```

PS: Não vale fazer o pecurso em ordem na árvore.

# [Desafio]coconut

A história conta sobre cinco homens e um macaco que naufragaram em uma ilha. Eles passaram a primeira noite reunindo cocos. Durante a noite, um homem acordou e decidiu tomar sua parte dos oscocos. Ele os dividiu em cinco pilhas. Um coco sobrou então ele deu para o macaco, depois escondeu sua parte e voltou a dormir.

Logo um segundo homem acordou e fez a mesma coisa. Depois de dividir os cocos em cinco pilhas, sobrou um coco que ele deu ao macaco. Ele então escondeu sua parte e voltou para a cama.

O terceiro, quarto e quinto homem seguiam exatamente o mesmo procedimento. Na manhã seguinte, depois que eles todos acordaram, dividiram os cocos remanescentes em cinco partes iguais. Desta vez não havia cocos sobrando.

Uma pergunta óbvia é "quantos cocos eles originalmente reuniram?”. Há um infinito número de respostas, mas a mais menor delas é de 3121. Mas isso não é problema nosso aqui.

Suponhamos que resolvamos o problema. Se sabemos o número de cocos que foram recolhidos, qual é o número máximo de pessoas (e um macaco) que poderiam ter naufragado se o mesmo procedimento poderia ocorrer?

Defina uma função coconut :: Int -> Int tal que (coconut cocos) devolve o número máximo de pessoas com um macaco poderiam ter naufragado se o mesmo procedimento acontecesse e devolve -1 caso não seja possível realizar o mesmo procedimento.

```haskell
coconut 25 == 3
coconut 997 == 3
coconut 10 == -1
```

Explicação para o caso 1:

O primeiro marinheiro encontra 25 cocos divide em 3 partes com 8 cocos e sobra 1 coco para o macaco.

O segundo marinheiro encontra 16 cocos divide em 3 partes com 5 cocos e sobra 1 coco para o macaco

O terceiro marinheiro encontra 10 cocos divide em 3 partes com 3 cocos e sobra 1 coco para o macaco.

No final sobram 6 cocos que serão divididos em 3 partes com 2 cocos.