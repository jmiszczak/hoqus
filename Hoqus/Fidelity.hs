-- | Module for providing various functionals used in calculations involving
-- quantum mathematics. This includes the fidelity and trace norm.
module Hoqus.Fidelity where

import Numeric.LinearAlgebra.Data
import Numeric.LinearAlgebra

import Hoqus.MtxFun

-- | Function 'fidelity' calculates the fidelity between two quantum states (or
-- any two square matrices) 
--fidelity :: Matrix C -> Matrix C -> C
--fidelity a b = (sum $ map sqrt $ toList $ eigenvalues $ a <> b ) ** 2

-- | Function 'superFidelity' calculates an upper bound for the fidelity using
-- only trace of the products of input matrices.
superFidelity :: Matrix C -> Matrix C -> C
superFidelity a b = (trace (a <> b)) + (sqrt (1 - trace (a <> a))) * (sqrt (1 - trace (b <> b)))

-- | Function 'subFidelity' calculates a lower bound for the fidelity using only
-- race of the products of input matrices. 
subFidelity :: Matrix C -> Matrix C -> C
subFidelity a b = (trace p) +  (sqrt 2) * (sqrt ((trace p)*(trace p) - trace (p <> p)))
  where p = a <> b
