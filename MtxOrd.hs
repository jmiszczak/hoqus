module MtxOrd where

import Data.List (transpose)

-- |Function 'vec' implements the vectorization and it is equvalent to concat.
-- We are using column vectors and matrices are stored in column-order - as a
-- list of columns.
vec :: [[a]] -> [a]
vec m = concat m

-- |Function 'res' is equavalent to the vectorization in the row order. This is
-- implemented by using 'tranpose' function from 'Data.List'.
res :: [[a]] -> [a]
res m = concat $ transpose m

-- |Function 'unvec' provides column-order unvectorization. Note that the size
-- of the input list is not checked and the result might not be a proper matrix.
unvec :: Int -> [a] -> [[a]]
unvec d [] = []
unvec d v = [take d v] ++ unvec d (drop d v)

-- | Function 'unres' provides row-based unvectorization.
unres :: Int -> [a] -> [[a]]
unres d v = transpose $ unvec d v
