{-|
Module      : ADS Manhã
Description : Prova ADS Manhã
Copyright   : (c) Alexandre Garcia, 2016
                  Eric Andrade, 2016
License     : GPL-3
Maintainer  : no@reply.c-m
Stability   : experimental


Prova de ADS Manhã
Comentários @#Correção de Prova @.
-}
module ADSM where

{-|
* Correção da prova de ADS Manhã


    * 1. (valor 2.5 pontos)
        *(a) (1.0) Monte uma expressão lambda para o que se pede

            * i. Para verificar se um valor é diferente de seu mempty

                @
                (\x -> x /= `mempty` )
                @

            * ii. Para retornar o reverso de uma lista xs concatenada com a própria xs.

                @
                (\xs -> (`reverse` xs) ++ xs )
                @
                
            * iii. Para verificar se o tamanho de uma lista é ímpar e maior que 7.

                @
                (\xs ->  (`mod` (`length` xs) 2) == 1 && (`length` xs) > 7)
                @
            
            * iv. Para verficiar o maior entre os números x e 0.

                @
                (\x -> `min` x 0)
                @
            

        *(b) (0.5) Dê o tipo, o mais geral possível, dos seguintes lambdas

            *i.  :t (\x -> `Just` $ x <> "Ola")

                @
                (\x -> `Just` $ x <> "Ola") :: [`Char`] -> `Maybe` [`Char`]
                @

            *ii. :t \k -> `Just` $ k == `False`

                @
                (\k -> `Just` $ k == `False`) :: `Bool` -> `Maybe` `Bool`
                @

        *(c) (1) Faça funções (dando o tipo da função e da forma mais genérica possível) para o que se pede

            *i. Uma função que verifique se a soma de um vetor de Ints, recebido via parâmetro, é par.

                @
                funSomaPar :: [`Int`] -> `Bool`
                funSomaPar xs = ((`foldl` (+) 0 xs) `mod` 2) == 0
                @

            *ii. Uma função que receba um Maybe Int e retorna um Maybe Bool indicando se este é negativo. Usar pattern matching no Maybe).

                @
                funMaybe :: `Maybe` `Int` -> `Maybe` `Bool`
                funMaybe `Nothing` = `Nothing`
                funMaybe (`Just` x) = `Just` (x >= 0)
                @

            *iii. Uma função que receba uma lista e filtre os memptys.

                @
                filtrarMemptys :: (Eq a, Monoid a) => [a] -> [a]
                filtrarMemptys xs = `filter` ( /= `mempty`) xs
                @

            *iv. Uma função que receba um vetor de Int (de tamanho qualquer) e retorne a soma dos quadrados dos elementos. (Exemplo: se a entrada for [0,2,1] o retorno deve ser 5).

                @
                retornaQuad :: [`Int`] -> `Int`
                retornaQuad [] = 0
                retornaQuad (x:xs) = (x * x) + retornaQuad xs 
                @

-}
exercício1 = putStrLn "exercício1"
{- |  
    *2. (valor 2.5 pontos) Considere a função

        @
        module Aula1 where

        data Tripla a = Tripla a Int a deriving Show

        instance `Functor` Tripla where
         `fmap` f (Tripla x y z) = Tripla (f x ) (`id` y) ((`id` . f . `id`) z)
        @

    e responda

    *(a) (0.25)Qual o valor da expressão fmap (\x -> (`tail` . `tail` . `reverse`) x)$ Tripla "PHP" 2 "HASKELL"?
    
        @
        Tripla \"P\" 2 \"EKSAH\"
        @

    *(b) (0.25) Qual o valor da expressão :t Tripla "." 0 "OLA"?
    
        @
        Tripla "." 0 \"OLA\" :: Tripla [`Char`]
        @

    *(c) (0.25) Qual o valor de :kind (Tripla `Int`)?

        @
        :k (Tripla `Int`)
        (Tripla `Int`) :: *
        @
    
    *(d) (0.5) Crie uma expressão para dobra todos os campos de um Tripla Int;

        @
        (\(Tripla x y z)-> Tripla (x * 2) (y * 2) (z * 2) )
        @

    *(e) (0.25) Qual o valor de :t Tripla `False` 4 `True`?;
    
        @
        :t Tripla `False` 4 `True`
        Tripla `False` 4 `True` :: Tripla `Bool`
        @

    *(f) (0.5) Faça uma função chamada homs que receba Tripla a e retorne (a,Int,a) colocando cada campo na
    respectiva coordenada. Exemplo, homs (Tripla ’w’ 7 ’p’) retorna o valor (’w’,7,’p’);
    
        @
        homs :: (Tripla a) -> ( a , Int , a )
        homs (Tripla x y z) = (x,y,z)
        @

    *(g) (0.5) Do jeito que está,  é possível calcular a expressão Tripla 1 2 3 <> Tripla 1 2 3? Justifique.

        >Não é possível, não existe instância de monoid. Então o haskell não sabe como combinar dois tipos "Tripla"
-}
exercício2 = putStrLn "exercício1"

{- |  
    *3. (valor 2.5 pontos) Implemente o tipo de nome GF3 contendo os value constructors U, A, B e C. Implemente uma instância de Monoid seguindo a tabela abaixo.

    > <> U A B
    > U  U A B 
    > A  A B U
    > B  B U A

    << http://www.azquotes.com/picture-quotes/quote-unfortunately-what-is-little-recognized-is-that-the-most-worthwhile-scientific-books-evariste-galois-58-65-91.jpg galois>>

    @
    import Data.Monoid

    module GF3 where 

    data GF3 = U | A | B  deriving Show

    instance `Monoid` GF3 where
      `mempty` = U 
      `mappend` U U = U
      `mappend` U A = A
      `mappend` U B = B
      `mappend` A U = A
      `mappend` A A = B
      `mappend` A B = U
      `mappend` B U = B
      `mappend` B A = U
      `mappend` B B = A
    @
-}
exercício3 = putStrLn "exercício1"

{- |  
        *4. (valor 2.5 pontos)
            *(a) Crie o tipo EstadoLampada com os value constructors Aceso e Apagado. (b) Implemente a função click que troca o estado da lâmpada.

                @
                data EstadoLampada = Aceso | Apagado deriving (Show,Eq)

                click :: EstadoLampada -> EstadoLampada'
                click Aceso = Apagado
                click Apagado = Aceso
                @

            *(c) Faça uma função que filtre as lâmpadas apagadas de uma lista.

                @
                filtraApagadas :: [EstadoLampada] -> [EstadoLampada]
                filtraApagadas xs = `filter` (Aceso == x) xs
                @

            *(d) Faca uma função que troque o estado de todas as lâmpadas de uma lista

                @
                funTroca :: [EstadoLampada] -> [EstadoLampada]
                funTroca xs = `map` click xs
                @

            *(e) Faça uma instância de Show para este tipo escrevendo uma mensagem diferente para cada estado

                @
                instance Show EstadoLampada where
                    show Aceso   = \"Plim\"
                    show Apagado = "Good Night"
                @


-}
exercício4 = putStrLn "exercício4"