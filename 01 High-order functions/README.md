# Funções de alta ordem

## ConcatenaFold

Escreva a definição da função concatenaFold :: [[a]] -> [a] que concatena uma lista de listas usando a função foldr::(a -> b -> b) -> b -> [a] -> b. Por exemplo,

```haskell
concatenaFold [[1,2],[3,4]] = [1,2,3,4]
concatenaFold [[1,2],[3,4],[6,7,8]] = [1,2,3,4,6,7,8]
```

## InverteFold

Escreva a definição da função inverteFold :: [a] -> [a] tal que (inverteFold xs ) devolve a lista xs invertida usando a

função foldr :: (a -> b -> b) -> b -> [a] -> b

```haskell
inverteFold [1,2,,3,4] == [4,3,2,1]
```

## ParidadeFold

Escreva uma função paridadeFold :: [Bool] -> Bool que calcule a paridade de uma lista de boleanos): se o número de valores True for par então a paridade é True, caso contrário é False. Por exemplo,

```haskell
paridadeFold [True,True, False,True] = False
paridadeFold [True,True, False,True, True] = True
```

## DuplicarFold

A função duplicarFold :: String -> String repete duas vezes cada vogal (letras 'a', 'e', 'i', 'o', 'u' minúsculas ou maiúsculas) numa cadeia de carateres; os outros carateres devem ficar inalterados. Por exemplo,

```haskell
duplicar "Ola, mundo!"== "OOlaa, muundoo!"
```

Dica: Crie uma lista com as vogais minúsculas e maiúsculas.

## FiltraAplicaFold

Defina a função filtraAplicaFold :: (a->b) -> (a->Bool)->[a]->[b] tal que (filtraAplicaFold f p xs) é uma lista obtida aplicando a função f aos elementos de xs que satisfazem o predicado p usando a função foldr. Por exemplo,

```haskell
filtraAplicaFold (4+) (<3) [1..7] == [5,6]
```

## MapFold

Defina função mapFold :: (a->b) -> [a] -> [b] tal que (mapFold f xs) devolve uma lista obtida aplicando a função f a cada elemento da lista xs, ou seja, mapFold f xs == map f xs. Por exemplo,

```haskell
mapFold (*2) [1,2,3] == [2,4,6]
```

## RemoveLista

Usando a função foldr, defina a função removeLista tal que  removeLista xs ys) remove todo elemento de ys que ocorre na lista xs. Por exemplo,

```haskell
removeLista [1,2] [1,1,3,2,2,4,5] == [3,4,5]
```

## AcertosFold

A maioria das universidades brasileiras usa o vestibular para selecionar seus alunos. O vestibular consiste de uma ou mais provas sobre as matérias do Ensino Médio, visando avaliar os conhecimentos dos candidatos.

Um formato popular de prova de vestibular é a prova objetiva. Neste formato de prova, cada candidato deve escolher uma das cinco alternativas apresentadas pela questão como sendo a correta. Durante a correção dos cartões, cada questão onde a alternativa escolhida pelo candidato é a mesma do gabarito, ele ganha um ponto.

Você trabalha no comitê responsável pelo vestibular em uma faculdade e escreva uma função acertosFold usando foldr que, dado o gabarito e as respostas de um dos candidatos, determina o número de acertos daquele candidato.

```haskell
acertosFold "AEDBCCE" "ADDCCBE" == 4
acertosFold "ABCDE" "ABCDE" == 5
```

## DescompactaFold

Usando o foldr, defina a função descompactaFold :: [(a, b)] -> ([a], [b]) que transforma uma lista de pares ordenado em um par ordenado onde o primeiro elemento ´e uma lista dos primeiros
componentes dos pares ordenados e o segundo elemento é uma lista dos segundos componentes dos pares ordenados.

```haskell
descompactaFold [(1,2),(3,4),(5,6),(4,5)] == ([1,3,5,4],[2,4,6,5])

descompactaFold [(1,2),(3,4),(5,6),(4,5),(5,6)] == ([1,3,5,4,5],[2,4,6,5,6])
```