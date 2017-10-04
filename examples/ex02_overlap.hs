module Main where

import Numeric.LinearAlgebra
import Dirac


main = do
  let dim = 12
  let a = ket dim 3
  let b = ket dim 6
  let res0 = a <.> b
  let res1 = a <.> a
  print res0
  print res1
