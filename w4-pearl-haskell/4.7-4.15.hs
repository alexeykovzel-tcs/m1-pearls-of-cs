{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
import Test.QuickCheck

-- 4.7
interest :: Double -> Double -> Double -> Double
interest n p a
    | n == 0    = a
    | otherwise = interest (n - 1) p calcMoney
        where calcMoney = a * (p / 100 + 1)

-- 4.8 
mylength :: Num p => [p] -> p
mylength [] = 0
mylength (el:lst)
    | null lst  = 1
    | otherwise = 1 + mylength lst

mysum :: Num p => [p] -> p
mysum [] = 0
mysum (el:lst)
    | null lst  = el
    | otherwise = el + mysum lst

myreverse :: [a] -> [a]
myreverse lst
    | null lst = []
    | otherwise = last lst : myreverse (init lst)

mytake :: (Eq t, Num t) => t -> [a] -> [a]
mytake n [] = []
mytake n (el:lst)
    | n == 0    = []
    | null lst  = [el]
    | otherwise = el : mytake (n - 1) lst

myelem :: Eq t => t -> [t] -> Bool
myelem fndEl [] = False
myelem fndEl (el:lst)
    | el == fndEl   = True
    | null lst      = False
    | otherwise     = myelem fndEl lst

myconcat :: [a] -> [a] -> [a]
myconcat [] lst2 = lst2
myconcat (el1:lst1) lst2
    | null lst1   = el1 : lst2
    | otherwise   = el1 : myconcat lst1 lst2

mymaximum :: Ord a => [a] -> a
mymaximum [el] = el
mymaximum (el1:el2:lst)
    | el1 < el2     = mymaximum (el2:lst)
    | otherwise     = mymaximum (el1:lst)

myzip :: [a] -> [b] -> [(a,b)]
myzip [] lst2 = []
myzip lst1 [] = []
myzip (el1:lst1) (el2:lst2)
    | null lst1 || null lst2  = [(el1, el2)]
    | otherwise               = (el1, el2) : myzip lst1 lst2

prop_mylength xs = length xs == mylength xs
prop_mysum xs = mysum xs == sum xs
prop_myreverse xs = myreverse xs == reverse xs
prop_mytake n xs = n >= 0 ==> mytake n xs == take n xs
prop_myelem x ys = myelem x ys == elem x ys
prop_myconcat :: Eq a => [a] -> [a] -> Bool
prop_myconcat lst1 lst2 = myconcat lst1 lst2 == lst1 ++ lst2 -- defined by task
prop_mymaximum xs = not (null xs) ==> mymaximum xs == maximum xs
prop_myzip lst1 lst2 = myzip lst1 lst2 == zip lst1 lst2 -- defined by task

-- 4.9 - Provisional
r :: (Eq t, Num t) => t -> t -> t -> t
r a d i
    | i == 0    = a
    | otherwise = d + r a d (i - 1)

totalSum :: (Ord t, Num t) => t -> t -> t
totalSum i j
    | i > j     = 0
    | i == j    = i
    | otherwise = i + totalSum (i + 1) j

-- 4.10 - Provisional
allEqual :: Eq t => [t] -> Bool
allEqual [] = True
allEqual (el:list)
    | null list = True
    | el        /= head list = False
    | otherwise = allEqual list

diffs :: Num t => [t] -> [t]
diffs (el:lst)
    | null lst  = []
    | otherwise = head lst - el : diffs lst

isAs :: (Eq t, Num t) => [t] -> Bool
isAs lst = allEqual (diffs lst)

-- 4.11
isPalindrome :: Eq t => [t] -> Bool
isPalindrome lst = lst == reverse lst

-- 4.12 Provisional
-- 4.13 Provisional
-- 4.14 Provisional 

-- 4.15
incr :: (Ord a, Num a) => [a] -> Bool
incr [] = True
incr (el1:el2:lst)
    | null lst = el1 < el2
    | el1 >= el2 = False
    | otherwise = incr (el2:lst)