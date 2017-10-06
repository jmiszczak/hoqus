module Main where

import Numeric.LinearAlgebra
import Hoqus.Dirac

main = do
  let dim = 4
  let v1 = ket dim 0
  let v2 = ket dim 4
  let prj = proj 4 0 0
  print v1
  print v2
  print $ v1 + v2
  print $ prj #> v1
  print $ prj #> v2
