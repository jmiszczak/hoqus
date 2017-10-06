-- | Module providing various functions popular in quantum calculations, but
-- not implemented in "Numeric.LinearAlgebra".
module Hoqus.MtxFun where

import Numeric.LinearAlgebra.Data
import Numeric.LinearAlgebra

-- | Trace of a matrix. This function ignores the non-sqare part of the matrix.
trace :: (Element c, Num c) => Matrix c -> c
trace = sum.toList.takeDiag

-- | Logarithm of a matrix. Based on 'Numeric.LinearAlgebra.matFunc' function
-- from "Numeric.LinearAlgebra" package.
logm :: Matrix C -> Matrix C
logm = matFunc log
