module Dirac where
import Cplx

ket :: Int -> Int -> [Cplx]
ket dim idx = [ x | x <- take (idx-1) (repeat 0)] ++ [1] ++ [ x | x <- take (dim-idx) (repeat 0)]

overlap :: [Cplx] -> [Cplx] -> Double
overlap vec1 vec2 = re $ sum $ zipWith (*) vec1 vec2  

-- proj :: Int -> Int -> Int -> Cplx
-- proj dim idx1 idx2

