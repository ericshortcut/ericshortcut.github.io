{-|
Module      : ADS Noite
Description : Prova ADS Noite
Copyright   : (c) Alexandre Garcia, 2016
                  Eric Andrade, 2016
License     : GPL-3
Maintainer  : no@reply.c-m
Stability   : experimental


Prova de ADS Noite
Comentários @#Correção de Prova @.
-}
module ADSN where

{-|
* Correção da prova de ADS Noite


    * 1. (valor 2.5 pontos)
        *(a) (1.0) Monte uma expressão lambda para o que se pede

            * i. Para verificar se o reverso do reverso de uma lista é sempre ela mesmo (isso é usado em testes de software)

                @
                (\xs -> (`reverse` . `reverse`) xs )
                @

            * ii. Para deixar todas as letras com caixa baixa (use o `toLower` :: `Char` -> `Char` que deixa um char por vez em caixa baixa)

                @
                (\xs ->  `map` `toLower` xs )
                @
                
            * iii. Para verificar se o tamanho de uma lista é par e menor que 144. 

                @
                (\xs ->  (`mod` (`length` xs) 2) == 0 && (`length` xs) < 144)
                @
            
            * iv. Para verficiar o maior entre os números y e 9.

                @
                (\y -> `max` y 9)
                @
            

        *(b) (0.5) Dê o tipo, o mais geral possível, dos seguintes lambdas

            *i.  \x -> [ x > 9 ]

                @
                (\x -> [ x > 9 ]) :: (`Num` a, `Ord` a) => a -> [`Bool`]
                @

            *ii. \k -> [k <> `mempty`]

                @
                (\k -> [k <> `mempty`]) :: `Monoid` t => t -> [t]
                @

        *(c) (1) Faça funções (dando o tipo da função da forma mais genérica possível) para o que se pede.

            *i. Uma função que receba um Maybe Int e retorna um Maybe Bool indicando se este é positivo. (Usar pattern matching no Maybe).

                @
                maybeIntBool :: `Maybe` Int -> `Maybe` `Bool`
                maybeIntBool `Nothing`  = `Nothing`
                maybeIntBool (Just 0) = `Nothing`
                maybeIntBool x = `Just` ( x < 0 )
                @

            *ii. Uma função que receba uma lista e retorne o reverso do reverso dela mesmo.

                @
                funR :: [a] -> [a]
                funR xs = ( `reverse` . `reverse` ) xs
                @

            *iii. Uma função que receba um numero x e retorne a expressão Just(x == 0).
     
                @
                funX ::(`Num` a) => a -> `Maybe` `Bool`
                funX x = `Just` (x == 0)
                @

            *iv. Uma função que verifique se a multiplicação de um vetor de (Product Ints), recebido via parâmetro, é par (Product é um funtor).

                @
                prodPar :: (`Product` a)=> [a] -> `Bool`
                prodPar ps = ( ( `mconcat` ps )``mod`` 2 ) == 0
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

        *(a) (0.25) Qualovalordaexpressão `fmap` (\x -> (`head` . `id` . `tail` . `reverse`) x) $ Tripla \"PHP\" 2 \"HASKELL\"?
        
            @
            `fmap` (\x -> (`head` . `id` . `tail` . `reverse`) x) $ Tripla \"PHP\" 2 \"HASKELL\"
            Tripla 'H' 2 'L'
            @

        *(b) (0.25) Qual o valor da expressão :t Tripla 2.2 0 3.3 ?
        
            @
            Tripla 2.2 0 3.3 :: `Fractional` a => Tripla a
            @

        *(c) (0.25) Qual o valor de :kind Tripla ?

            @
            :k (Tripla )
            (Tripla ) :: * -> *
            @
        
        *(d) (0.5) Crie uma expressão lambda para extrai o primeiro elemento dos campos de um Tripla String;

            @
            ( \(Tripla x _ _ ) -> x )
            @

        *(e) (0.25) Qual o valor de :t Tripla `Nothing` 4 `Nothing`?;
        
            @
            Tripla `Nothing` 4 `Nothing` :: Tripla (`Maybe` a)
            @

        *(f) (0.5) Duas Triplas são iguais se o terceiro campo o for. Faça essa instância de Eq para Tripla;
        
            @
            instance (`Eq` a) => `Eq` (Tripla a) where
                (==) (Tripla _ _ x) (Tripla _ _ y) = x == y

            @

        *(g) (0.5) Do jeito que está, é possível calcular a expressão Tripla 1 2 3 < Tripla 2 5 9? Justifique.

            >Não, pois não existe descrição de instância de Ord para Triplas
-}
exercício2 = putStrLn "exercício2"


{- |  
    *3. (valor 2.5 pontos) Crie o tipo Sozinho com um value constructor Sozinho. Crie uma instância de Monoid para este tipo.

    @
    import `Data`.`Monoid`

    module Sozinho where 
    
    data Sozinho = Sozinho

    instance `Monoid` Sozinho where
        `mempty` = Sozinho
        `mappend` _ _ = Sozinho
    @
-}
exercício3 = putStrLn "exercício3"

{- |  
    *4. (valor 2.5 pontos) Baseando-se na música do Stealers Wheels (1972) ”Clowns to the left of me Jokers to the right, here i am, stuck in the Middle with you”

        *(a) Crie o tipo Position com os value constructors Clowns, Jokers e Middle

            @
            data Position = Clowns | Jokers | Middle deriving Show
            @


        *(b) Crie o typeclass (Music a) que implemente a função whereIn :: a −> P osition

            @
            class Music a where
                whereIn :: a -> Position
            @


        *(c) Crie uma instância de Music para Int que faz com que os positivos sejam Clowns, os negativos Jokers e o zero Middle

            @
            instance Music Int where
                whereIn x
                        | x > 0 = Clowns
                        | x < 0 = Jokers
                        | otherwise = Middle
            @


        *(d) Generalize o item acima para qualquer Monoid (lembre-se de colocar as restrições aqui).

            @
            instance (`Ord` a, `Monoid` a)=> Music a where
                whereIn x
                        | x > `mempty` = Clowns
                        | x < `mempty` = Jokers
                        | otherwise = `mempty`
            @


-}
exercício4 = putStrLn "exercício4"
