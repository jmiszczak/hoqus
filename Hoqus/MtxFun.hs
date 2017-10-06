module Hoqus.MtxFun where

import Data.List (transpose)

-- | Diagonal of a matrix. This function ignores the non-sqare part of the
-- matrix.
diag :: [[a]] -> [a]
diag m = zipWith (!!) m [0..((min (length m) (length $ transpose m))-1)]

-- | Trace of a matrix. This function ignores the non-sqare part of the matrix.
tr :: Num a => [[a]] -> a
tr m = sum (diag m)
