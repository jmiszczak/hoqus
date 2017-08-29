-- |Module for operating on vectors and matrices. It includes some functions for
-- using bra-ket notation.
module LinAlg where

import Cplx

-- |Basic function for producing vectors from the canonical basis.
ket :: Int -> Int -> [Cplx]
ket d i = (take i zeros) ++ [1] ++ (take (d-1-i) zeros)
  where zeros = replicate (d-1) 0

-- |Euclidean norm of a vector.
norm :: [Cplx] -> Double
norm a = sqrt $ re $ sum [ x^2 | x<-a ]

-- |Basic function for producing base vectors.
proj :: Int -> Int -> Int -> [Cplx]
proj d i j = outerWith (*) (ket d i) (ket d j)

-- |Outer product resulting in paris of elements.
outer :: [a] -> [b] -> [(a,b)]
outer a b = [ (x,y) | x<-a, y<-b ]

-- |General form of the outer product resulting in paris of elements.
outerWith :: (a -> b -> c) -> [a] -> [b] -> [c]
outerWith f a b = [ f x y | x<-a, y<-b ]

-- |Kronecker product is defined in terms of the outer product
kron ::  Num a => [a] -> [a] -> [a]
kron a b = outerWith (*) a b

-- |Function for calculating the inner product of vectors.
overlap :: [Cplx] -> [Cplx] -> Double
overlap vec1 vec2 = re $ sum $ zipWith (*) vec1 vec2
