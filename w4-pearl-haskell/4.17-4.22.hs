-- 4.17
dividers :: Integral a => a -> [a]
dividers 1 = [1] -- Is 1 a divider of 1?
dividers n = [ i | i <- [1 .. n `div` 2],
                n `mod` i == 0 ]

-- 4.18
isPrime :: Integral a => a -> Bool
isPrime num = length (dividers num) == 1

-- 4.19
asSum :: Int -> [(Int, Int)]
asSum num = [ (a,b) | a <- [ i | i <- primes, i < num `div` 2 ],
                b <- primes, a + b == num]
    where primes = findPrimes num

findPrimes :: Int -> [Int]
findPrimes limit = [ i | i <- [1 .. limit], isPrime i ]

-- 4.20 Provisional
perfect :: Integral a => a -> Bool
perfect num = sum (dividers num) == num

allPerfects :: Integral a => a -> [a]
allPerfects limit = [ i | i <- [1 .. limit], perfect i]

-- 4.21 Provisional
linsearch :: Eq a => a -> [a] -> Int
linsearch x xs
    | null lst    = -1
    | otherwise = head lst
        where lst = search x xs

-- 4.22
search :: Eq a => a -> [a] -> [Int]
search x xs = [ a | (a, b) <- zip [0 .. length xs] xs, b == x ]