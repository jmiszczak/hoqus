-- | Module for operating on vectors and matrices. It includes some functions
-- for using bra-ket notation.
module DiracLists where

import Data.Complex
import Data.List (transpose)

-- This can be used to hide the standard operators.
-- import Prelude hiding ((+))
-- import qualified Prelude

-- | Function 'ket' provides basic functionality for producing vectors from the
-- canonical basis. Vectors and matrices are represented as lists and are stored
-- in column-order (as in Mathematica). Operations on vectors and matrices have
-- to be defined using new operators.
ket :: Int -> Int -> [Complex Double]
ket d i = (take i zeros) ++ [1] ++ (take (d-1-i) zeros)
  where zeros = replicate (d-1) 0

-- | The 'norm' function calculates the Euclidean norm of a vector.
norm :: [Complex Double] -> Double
norm a = sqrt $ realPart $ sum [ x^2 | x<-a ]

-- | The 'proj' function builds d-dimensional operator |i><j|.
proj :: Int -> Int -> Int -> [Complex Double]
proj d i j = outerWith (*) (ket d i) (ket d j)

-- | The 'outer' defines the form of outer product resulting in paris of elements. 
outer :: [a] -> [b] -> [(a,b)]
outer a b = [ (x,y) | x<-a, y<-b ]

-- | General form of the outer product resulting in paris of elements.
outerWith :: (a -> b -> c) -> [a] -> [b] -> [c]
outerWith f a b = [ f x y | x<-a, y<-b ]

-- | Kronecker product is defined in terms of the outer product.
kron ::  Num a => [a] -> [a] -> [a]
kron a b = outerWith (*) a b

-- | Function 'overlap' for calculating the inner product of two vectors. In
-- Dirac notation this is represented as <v|w>.
overlap :: Num a => [a] -> [a] -> a
overlap vec1 vec2 = sum $ zipWith (*) vec1 vec2

-- | The scalar product is defined to be consistent with the other operators. It
-- is identical with the 'overlap' function and it suppose to resemble the
-- braket.
(<>) :: [Complex Double] -> [Complex Double] -> Complex Double
(<>) = overlap 

-- | Definition of the vector addition for two complex vectors. The standard '+'
-- operator does not work, and it is not a good idead to hide it.
(+>) :: [Complex Double] -> [Complex Double] -> [Complex Double]
(+>) = zipWith (+)

-- | The multiplication of a vector by a scalar.
(.*) :: Complex Double -> [Complex Double] -> [Complex Double]
(.*) c v = [ c*x | x<-v ]

-- | Matrix-vector multiplication.
(#>) :: [[Complex Double]] -> [Complex Double] -> [Complex Double]
(#>) m v = [ overlap w v | w<-tm ]
  where tm = transpose m
