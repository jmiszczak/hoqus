-- <doc>
-- Module for operating on vectors and matrices. It includes some functions for
-- using bra-ket notation.
-- </doc>
module LinAlg where

import Cplx

-- <doc>
-- Basic function for producing vectors from the canonical basis.
-- </doc>
ket :: Int -> Int -> [Cplx]
ket d i = (take i zeros) ++ [1] ++ (take (d-1-i) zeros)
  where zeros = replicate (d-1) 0

-- <doc>
-- Euclidean norm of a vector.
-- </doc>
norm :: [Cplx] -> Double
norm a = sqrt $ re $ sum [ x^2 | x<-a ]

-- <doc>
-- Basic function for producing base vectors.
-- </doc>
proj :: Int -> Int -> Int -> [Cplx]
proj d i j = outerWith (*) (ket d i) (ket d j)

-- <doc>
-- Outer product resulting in paris of elements.
-- </doc>
outer :: [a] -> [b] -> [(a,b)]
outer a b = [ (x,y) | x<-a, y<-b ]

-- <doc>
-- General form of the outer product resulting in paris of elements.
-- </doc>
outerWith :: (a -> b -> c) -> [a] -> [b] -> [c]
outerWith f a b = [ f x y | x<-a, y<-b ]

-- <doc>
-- Kronecker product is defined in terms of the outer product
-- </doc>
kron ::  Num a => [a] -> [a] -> [a]
kron a b = outerWith (*) a b

-- <doc>
-- Function for calculating the inner product of vectors.
-- </doc>
overlap :: [Cplx] -> [Cplx] -> Double
overlap vec1 vec2 = re $ sum $ zipWith (*) vec1 vec2
