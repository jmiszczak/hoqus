module MtxFun where
import Cplx
import Data.List (transpose)

-- <doc>
-- Diagonal of a matrix. This function ignores the non-sqare part of the matrix.
-- </doc>
diag :: [[a]] -> [a]
diag m = zipWith (!!) m [0..((min (length m) (length $ transpose m))-1)]

-- <doc>
-- Trace of a matrix. This function ignores the non-sqare part of the matrix.
-- </doc>
tr :: Num a => [[a]] -> a
tr m = sum (diag m)
