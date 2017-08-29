module MtxOrd where
import Data.List (transpose)

-- <doc>
-- Function vec implements the vectorization and it is equvalent to concat. We
-- are using column vectors and matrices are stored in column-order.
-- </doc>
vec :: [[a]] -> [a]
vec m = concat m

-- <doc>
--  Res is equavalent to the vectorization in the row order.
-- </doc>
res :: [[a]] -> [a]
res m = concat $ transpose m

