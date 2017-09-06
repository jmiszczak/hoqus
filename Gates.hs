module Gates where

import Data.Complex

gate :: [Complex Double] -> [Complex Double]

sx = [[0, 1], [1, 0]]
sz = [[1, 0], [0, -1]]
