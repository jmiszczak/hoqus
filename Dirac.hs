-- | Module for operating on vectors and matrices. It includes some functions
-- for using bra-ket notation, based on data types and functios from 'hmarix'
-- package.
module Dirac where

import Numeric.LinearAlgebra.Data

-- This can be used to hide the standard operators.
-- import Prelude hiding ((+))
-- import qualified Prelude

-- | Function 'ket' provides basic functionality for producing vectors from the
-- canonical basis. Vectors and matrices are not represented as lists (as in
-- Mathematica), but using -- This makes possible to use operations on vectors
-- and matrices defined in 'hmatrix'.
ket :: Int -> Int -> Vector C
ket d i = fromList $ (take i zeros) ++ [1] ++ (take (d-1-i) zeros)
  where zeros = replicate (d-1) 0
  
-- | The 'proj' function builds d-dimensional operator |i><j|.
proj :: Int -> Int -> Int -> Matrix C
proj d i j = (d><d) $ outerWith (*) (toList $ ket d i) (toList $ ket d j)

-- | The 'outer' defines the form of outer product resulting in paris of elements. 
outer :: [a] -> [b] -> [(a,b)]
outer a b = [ (x,y) | x<-a, y<-b ]

-- | General form of the outer product resulting in paris of elements.
outerWith :: (a -> b -> c) -> [a] -> [b] -> [c]
outerWith f a b = [ f x y | x<-a, y<-b ]
