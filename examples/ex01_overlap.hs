module Main where
import LinAlg

main = do
  let dim = 12
  let a = ket dim 3
  let b = ket dim 6
  let res = overlap a b
  print res
