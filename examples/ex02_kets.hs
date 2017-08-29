module Main where
import Cplx
import LinAlg

main = do
  let dim = 4
  let v1 = ket dim 0
  let v2 = ket dim 4
  print v1
  print v2
