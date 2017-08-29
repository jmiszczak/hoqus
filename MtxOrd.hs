module MtxOrd where
import Data.List (transpose)

-- |Function vec implements the vectorization and it is equvalent to concat. We
-- are using column vectors and matrices are stored in column-order.
vec :: [[a]] -> [a]
vec m = concat m

-- |Res is equavalent to the vectorization in the row order.
res :: [[a]] -> [a]
res m = concat $ transpose m

