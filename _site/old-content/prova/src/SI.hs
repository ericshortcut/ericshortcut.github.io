{-|
Module      : SI (Sistemas para internet)
Description : Prova Sistemas para internet
Copyright   : (c) Alexandre Garcia, 2016
                  Eric Andrade, 2016
License     : GPL-3
Maintainer  : no@reply.c-m
Stability   : experimental


Prova de Sistemas para Internet
Comentários @#Correção de Prova@.
-}

module SI where

{-|
* Correção da prova de Sistemas para internet


    * 1. (valor 2.5 pontos)
        *(a) (1.0) Monte uma expressão lambda para o que se pede

            * i. Lambda para verificar se uma lista tem tamanho 9.

                @
                (\xs -> `length` xs == 9 )
                        ou
                (\xs -> (`length` xs) == 9 )
                @

            * ii. Lambda para filtrar palavras de tamanho maior que 30 de um array de Strings xs.

                @
                (\xss -> `filter` (\xs -> `length` xs <= 30 ) xss)
                @
                
            * iii. Lambda para receber uma String s e retorná -la em ordem reversa sendo do tipo `Maybe` String.

                @
                (\xs ->  `Just` (`reverse` xs))
                @
            
            * iv. Lambda para checar se um número positivo.

                @
                (\x -> x >= 0 )
                @
            

        *(b) (0.5) Dê o tipo das seguintes funções
            * i. \x -> [ ”Ola” ++ x ]

                @
                ( \x -> [ "Ola" ++ x ]) :: [`Char`] -> [[`Char` ]]
                @

            * ii. \t -> `Just` $ t == "True"

                @
                (\t -> `Just` $ t == "True") :: [[`Char`]] -> `Maybe` `Bool`
                @

        *(c) (1) Faça funções (dando o tipo da função e da forma mais genérica possível) para o que se pede
            * i. Uma função que receba uma lista e a devolva sem os dois primeiros elementos (Dica: pattern matching) .

                @
                semDois :: [a] -> [a]
                semDois [] = []
                semDois (x:xs) = x : xs
                semDois (_:_:xs) = xs
                       ou
                semDois :: [a] -> [a]
                semDois xs = `tail` ( `tail` xs )
                @
            * ii. Uma função que receba dois `Maybe` Int e retorne o menor deles (Dica: pattern matching).

                @
                doisMaybeMenor :: `Maybe` Int -> `Maybe` `Int` -> `Maybe` `Int`
                doisMaybeMenor (`Just` x) (`Just` y)
                                            | x > y = `Just` y
                                            | otherwise = `Just` x
                doisMaybeMenor _ _ = `Nothing`
                            ou
                doisMaybeMenor :: `Maybe` `Int` -> `Maybe` `Int` -> `Maybe` `Int`
                doisMaybeMenor (`Just` x) (`Just` y) = `Just` (min x y)
                doisMaybeMenor _ _ = `Nothing`
                @

            * iii. Uma função que receba um valor qualquer e retorne `Nothing`.

                @
                    retornaNothing :: a -> `Maybe` a
                    retornaNothing _ = `Nothing`
                @
            * iv. Uma função que receba um valor e verifique se este é maior que seu mempty.

                @
                maiorQueMempty :: (`Ord` a )=> a -> `Bool`)
                maiorQueMempty x = ( x ) /= `mempty` )

                @

-}
exercício1 = putStrLn "exercício1"
{- |  
    *2. (valor 2.5 pontos) Considere a função

        @
        module Aula1 where

        data Tupla a = Tupla a a deriving Show

        instance `Functor` Tupla where
         `fmap` f (Tupla x y ) = Tupla (`id`.f $ y) (f.`id` $ x)
        @

        e responda

        *(a) (0.25) Qual o valor da expressão fmap (\x->x<3)$ Tupla 4 2?

            @
            Tupla `True` `False`
            @

        *(b) (0.25) Qual o valor da expressão :t Tupla \"W\" \"M\"?

            @
            Tupla \"W\" \"M\" :: Tupla [`Char`]
            @

        *(c) (0.25) Qual o valor de fmap id $ Tupla 4 7?

            @
            `fmap` `id` $ Tupla 4 7
            @

        *(d) (0.5) Faça uma instância de Eq para Tupla, onde duas Tuplas são iguais se o primeiro elemento de uma for igual ao segundo elemento da outra;

            @
            instance (`Eq` a) => `Eq` (Tupla a ) where
                (`==`) (Tupla a _) (Tupla b _) = a == b
            @

        
        *(e) (0.25) Qual o valor de :t Tupla mempty mempty?;

            @
            Tupla `mempty` `mempty` :: `Monoid` a => `Tupla` a
            @

        *(f) (0.5) Faça uma instância de Show para tupla que dado (Tupla x y) mostre na tela “fst: x => snd: y”;

            @
            instance (`Show` a) => `Show` (Tupla a ) where
                `show` (Tupla x y) = "fst: " ++ show x ++" => snd: " ++ show y
            @

        *(g) (0.5)Do jeito que está ocódigo e sem qualquer alteração,é possível calcular a expressão Tupla 1 2 `<>` Tupla 2 3? Justifique.

            @
            >Não é possível, não existe instância de monoid. Então o haskell não sabe como combinar dois tipos "Tupla"
            @

-}
exercício2 = putStrLn "exercício1"

{- |  
    *3. (valor 2.5 pontos)
        *(a) (0.25) Crie um tipo que represente os quatros naipes de um baralho (Ouros, espadas, copas e paus).

            @
            data Naipe = Ouros | Espadas | Copas | Paus deriving (Show)
            @

        *(b) (0.25) Crie o tipo Valor que tenha 13 value constructors representando os 9 números do baralho (2 a 9) e as figuras A, J, Q, K.

            @
            data Valor = A | Um | Dois | Tres | Quatro | Cinco | Seis | Sete | Oito | Nove | J | Q | K deriving Show
            @

        *(c) (0.5) Crie o tipo Carta que possua um Valor e um Naipe como campos.

            @
            data Carta = Carta Valor Naipe deriving Show
            @

        *(d) (1.0) Faça a funçao veremelhoFigura que filtre as figuras de naipes vermelhos (Ouros e Copas).

            @
            veremelhoFigura :: [Carta] -> [Carta]
            veremelhoFigura [] = []
            veremelhoFigura ((Carta v Ouros):xs) = (Carta v Ouros) : veremelhoFigura xs
            veremelhoFigura ((Carta v Copas):xs) = (Carta v Copas) : veremelhoFigura xs
            veremelhoFigura (_:xs) = veremelhoFigura xs
            @

        *(e) (0.5) Faça a função isBlackJack que recebe duas cartas e retorna se este par forma ou não um blackjack. Um black é sempre formado por um A(á s) seguido de J, Q ou K.

            @
            isBlackJack :: `Carta` -> `Carta` -> `Bool`
            isBlackJack (Carta v A) (Carta v J) = True
            isBlackJack (Carta v J) (Carta v A) = True
            isBlackJack (Carta v A) (Carta v Q)  = True
            isBlackJack (Carta v Q) (Carta v A)  = True
            isBlackJack (Carta v A) (Carta v K)  = True
            isBlackJack (Carta v K) (Carta v A)  = True
            isBlackJack _ _ = False
            @

-}
exercício3 = putStrLn "exercício1"