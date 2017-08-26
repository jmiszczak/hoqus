-- <DOC>
-- Module for operating on vectors and matrices. It includes some functions for
-- using bra-ket notation.
-- </DOC>
module LinAlg where

import Cplx

-- <DOC>
-- Basic function for producing vectors from the canonical basis.
-- </DOC>
ket :: Int -> Int -> [Cplx]
ket d i = [ x | x <- take (i-1) zeros] ++ [1] ++ [ x | x <- take (d-i) zeros]
  where zeros = repeat 0

-- <DOC>
-- Euclidean norm of a vector.
-- </DOC>
norm :: [Cplx] -> Double
norm a = sqrt $ re $ sum [ x^2 | x<-a ]

-- <DOC>
-- Basic function for producing base vectors.
-- </DOC>
proj :: Int -> Int -> Int -> [[Cplx]]
proj d i j = outer (ket d i) (ket d j)

-- <DOC>
-- Outer product resulting in paris of elements.
-- </DOC>
outer :: [a] -> [b] -> [(a,b)]
outer a b = [ (x,y) | x<-a, y<-b ]

-- <DOC>
-- General form of the outer product resulting in paris of elements.
-- </DOC>
outerWith :: (a -> b -> c) -> [a] -> [b] -> [c]
outerWith f a b = [ f x y | x<-a, y<-b ]

-- <DOC>
-- Kronecker product is defined in terms of the outer product
-- </DOC>
kron ::  Num a => [a] -> [a] -> [a]
kron a b = outerWith (*) a b

-- <DOC>
-- Function for calculating the inner product of vectors.
-- </DOC>
overlap :: [Cplx] -> [Cplx] -> Double
overlap vec1 vec2 = re $ sum $ zipWith (*) vec1 vec2
