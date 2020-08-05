## Answers

# Cuidado! Listas Infinitas.

## Kolakoski

A sequência Kolakoski ([seqüência OEIS A000002](https://oeis.org/A000002)) é a seqüência infinita  de uns e dois consistindo de um bloco de  de uns, seguido de um bloco de  de dois, seguido de um bloco  de uns, e assim por diante.

## Hamming

Os números de Hamming formam uma seqüência estritamente crescente de números que atendem às seguintes condições:

1. O número 1 está na sequência.

2. Se x estiver na sequência, então, 2x, 3x e 5x são também.

3. Nenhum outro número está na sequência.

Defina a seguinte lista hamming :: [Int] de modo que hamming é a sequência de Hamming. Por exemplo,

```haskell
take 12 hamming == [1,2,3,4,5,6,8,9,10,12,15,16]
```

Dica: Defina a função mescla3 tal que (mescla3 xs ys zs) é a lista obtida mesclando as listas ordenadas xy, ys e zs eliminando os elementos duplicados. Por exemplo,

mescla3 [2,4,6,8,10] [3,6,9,12] [5,10] == [2,3,4,5,6,8,9,10,12]

## Collatz

Considere o seguinte algoritmo que gera uma sequência de inteiros. Comece com um inteiro positivo n. Se n é par, divida por 2. Se n é ímpar, multiplique por 3 e some 1. Repita o processo com o novo valor de n, o processo termina quando n = 1. Por exemplo, comece com 

n = 6, [6, 3, 10, 5, 16, 8, 4 , 2, 1]

Esta sequência é conhecida como sequência Collatz. Uma conjectura bastante conhecida defende que este algoritmo de fato termina para todo n positivo.

Defina a funcão collatz :: Integer -> [Integer] tal que collatz n é a sequência de Collatz obtida começando com o valor n usando a função iterate. Por exemplo,

```haskell
collatz 13 = [13,40,20,10,5,16,8,4,2,1]
```

Dica: Defina a funçao seguinte :: Integer -> Integer tal que seguinte n é o próximo número obtido na sequência de Collatz.

## FechoKleene

O fecho de Kleene é uma operação unária aplicada a conjuntos. A aplicação do fecho de Kleene num conjunto A é escrito como A^* . Se A é um conjunto de caracteres, então A^* é o menor conjunto de strings que contém \epsilon (string vazia) e o conjunto A é fechado para operação de concatenação. A^* também pode ser descrito como o conjunto de todos os elementos que podem ser formados através da concatenação de zero ou mais elementos de A .

## Goldbach

A conjetura de Goldbach, proposta pelo matemático prussiano Christian Goldbach, é um dos problemas mais antigos não resolvidos da matemática, mais precisamente da teoria dos números.

Ela diz que todo número par maior que 2 pode ser representado pela soma de dois números primos.

Por exemplo: 4 = 2 + 2; 6 = 3 + 3; 8 = 5 + 3; 10 = 3 + 7 = 5 + 5; 12 = 5 + 7; etc.

Verificações por computador já confirmaram a conjetura de Goldbach para vários
números. No entanto, a efetiva demonstração matemática ainda não
ocorreu.

Defina uma função goldbach :: Int -> [(Int,Int,Int)] tal que (goldbach n) devolve uma lista contendo triplas (x,y,z) , onde x é um número par maior que 2 e menor que n e y e z são dois primos tal que x = y+z.

## PrimosPalindromos

Um número primo palindromo é um número primo que é palíndromo, ou seja, é o mesmo se lido da direita para a esquerda ou da esquerda para a direita.

Defina a função primosPalindromo :: [Integer] tal que (primosPalindromo) devolve a lista de todos os números primos palíndromos.

Por exemplo,

```haskell
take 8 primosPalindromo == [2,3,5,7,11,101,131,151]
take 10 primosPalindromo == [2,3,5,7,11,101,131,151,181,191]
```

## PrimosGemeos

Números primos gémeos, na teoria dos números, são dois números primos cuja diferença é igual a dois. Os primeiros pares de números primos gémeos são (3, 5),(5,7),(11, 13),(17,19),(29,31),(41, 43),(59, 61),(71, 73),(101,103),(107, 109),(137, 139).

Defina a função primosGemeos :: [(Integer,Integer)] tal que (primosGemeos) devolve a lista de todos os números primos gémeos.

Por exemplo,

```haskell
take 3 primosGemeos == [(3,5),(5,7),(11,13)]
take 5 primosGemeos == [(3,5),(5,7),(11,13),(17,19),(29,31)]
```
