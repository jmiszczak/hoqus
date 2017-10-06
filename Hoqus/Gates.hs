-- | Module providing definitions of basic quantum gates, including parametrized
-- rotation and controlled operations.
module Hoqus.Gates where

import Numeric.LinearAlgebra.Data
import Numeric.LinearAlgebra

-- | Constant for pure imaginary unit
ii = 0:+1

-- | Pauli gate X, logical negation
sx = (2><2) [0, 1, 1, 0] :: Matrix C

-- | Pauli gate Y
-- sy = -ii ( sx <> sz )
sy = (2><2) [0, -ii, ii, 0] :: Matrix C

-- | Pauli gate Z
sz = (2><2) [1, 0, 0, -1] :: Matrix C

-- | Hadamard gate
h = 1/sqrt(2) * (2><2) [1, 1, 1, -1] :: Matrix C
