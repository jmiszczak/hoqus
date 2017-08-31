-- |Module for operating on vectors and matrices. It includes some functions for
-- using bra-ket notation.
module LinAlg where

import Cplx

-- |Function 'ket' provide basic functionality for producing vectors from the
-- canonical basis.  Vectors are represented as lists (as in Mathematica).
ket :: Int -> Int -> [Cplx]
ket d i = (take i zeros) ++ [1] ++ (take (d-1-i) zeros)
  where zeros = replicate (d-1) 0

-- |The 'norm' function calculates the Euclidean norm of a vector.
norm :: [Cplx] -> Double
norm a = sqrt $ re $ sum [ x^2 | x<-a ]

-- |The 'proj' function builds d-dimensional operator |i><j|.
proj :: Int -> Int -> Int -> [Cplx]
proj d i j = outerWith (*) (ket d i) (ket d j)

-- |The 'outer' defines the form of outer product resulting in paris of elements. 
outer :: [a] -> [b] -> [(a,b)]
outer a b = [ (x,y) | x<-a, y<-b ]

-- |General form of the outer product resulting in paris of elements.
outerWith :: (a -> b -> c) -> [a] -> [b] -> [c]
outerWith f a b = [ f x y | x<-a, y<-b ]

-- |Kronecker product is defined in terms of the outer product
kron ::  Num a => [a] -> [a] -> [a]
kron a b = outerWith (*) a b

-- |Function 'overlap' for calculating the inner product of two vectors. In
-- Dirac notation this is represented as <v|w>.
overlap :: [Cplx] -> [Cplx] -> Double
overlap vec1 vec2 = re $ sum $ zipWith (*) vec1 vec2
