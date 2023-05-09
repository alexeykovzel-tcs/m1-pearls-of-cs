{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
import Data.List
import Test.QuickCheck

-- 4.25
ins :: Ord t => t -> [t] -> [t]
ins el [] = [el]
ins el (lstEl:lst)
    | el < lstEl    = el : lstEl : lst
    | null lst      = [lstEl,el]
    | otherwise     = lstEl : ins el lst

isort :: Ord a => [a] -> [a]
isort (el:lst)
    | null lst          = [el]
    | el == head sorted = el: isort lst
    | otherwise         = isort sorted
        where sorted = ins el lst

-- 4.26 Provisional
-- 4.27
qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (el:lst) = qsort [ i | i <- lst, i <= el ]
                    ++ [el] ++ qsort [ i | i <- lst, i > el ]

-- 4.28 
itn :: (Eq a, Num a) => (a -> a) -> a -> a -> a
itn f a n
    | n == 0    = a
    | otherwise = f (itn f a (n - 1))

-- 4.29
hoSort :: Ord a => (a -> a -> Bool) -> [a] -> [a]
hoSort rel [] = []
hoSort rel (el:lst) = hoSort rel [ i | i <- lst, rel i el ]
                        ++ [el] ++ hoSort rel [ i | i <- lst, not(rel i el) ]

-- 4.30
allDice :: [(Int, Int)]
allDice = [ (a, b) | a <- [1 .. 6], b <- [1 .. 6] ]

diceByVal :: Int -> [(Int, Int)]
diceByVal val = [ (a, b) | (a, b) <- allDice, a == val || b == val ]

diceBySum :: Int -> [(Int, Int)]
diceBySum sum = [ (a, b) | (a, b) <- allDice, a + b == sum ]

sortedDice :: [(Int, Int)]
sortedDice = [ (a, b) | (sum, (a, b)) <- hoSort (>) calcSums ]

calcSums :: [([Int], (Int, Int))]
calcSums = zip [ [a + b] | (a, b) <- diceLst ] diceLst where diceLst = allDice 

-- Tests
prop_qsort lst = qsort lst == sort lst