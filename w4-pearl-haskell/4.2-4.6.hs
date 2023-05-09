import Test.QuickCheck
import Data.Char

-- 4.1
f :: Num p => p -> p
f x = 2*x^2 + 3*x - 5


-- 4.2
circ :: Double -> Double
circ r = 2*pi*r

area :: Double -> Double
area r = pi*r^2


-- 4.3
discr :: Double -> Double -> Double -> Double
discr a b c = b^2 - 4*a*c

roots :: Double -> Double -> Double -> [Double]
roots a b c
    | d < 0   = error "discriminant negative"
    | otherwise         = [(-b - sqrt d) / (2 * a),
                            (-b + sqrt d) / (2 * a)]
    where
        d = discr a b c

root1 :: Double -> Double -> Double -> Double
root1 a b c = root where root = (roots a b c)!!0

root2 :: Double -> Double -> Double -> Double
root2 a b c = root where root = (roots a b c)!!1


-- 4.4
calc :: Double -> Double -> Double -> Double -> Double
calc a b c x = a*x^2 + b*x + c

extrPoint :: Double -> Double -> Double -> [Double]
extrPoint a b c = [x, calc a b c x]
    where x = -b / 2 * a

extrX :: Double -> Double -> Double -> Double
extrX a b c = head (extrPoint a b c)

extrY :: Double -> Double -> Double -> Double
extrY a b c = extrPoint a b c!!1


-- 4.5
smallLetter :: Char -> Bool
smallLetter char = 97 <= i && i <= 122
    where i = ord char

bigLetter :: Char -> Bool
bigLetter char = 65 <= i && i <= 90
    where i = ord char


-- 4,6
total1 :: Int -> Int
total1 0 = 0
total1 n = total1 (n-1) + n

total2 :: Int -> Int
total2 n = (n * (n+1)) `div` 2 -- change 2 to 3 to not pass the test

prop_total n = (n >= 0) ==> total1 n == total2 n