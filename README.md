# hoqus package

## Description

This repo contains some functions used for playing with quantum mechanics in
Haskell. Much of this work is based on [package for
Mathematica](https://github.com/jmiszczak/qi).

## Dependencies

Numerical procedures used in ```hoqus``` are based on [hmatrix package for
Haskell](https://hackage.haskell.org/package/hmatrix).

# Examples

## Quantum computing

The following program (see ```examples/ex01_ket_proj.hs```) demonstrates how to
use kets and projectors along with matrix-vector multiplication.

```haskell
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
```

In order to compile on of the exampes use ```ghc``` in the main directory

```
ghc --make examples/ex01_ket_proj
```

To run the programm issue

```
./examples/ex01_ket_proj
```

in the main directory.

## Other functions

Module ```Cplx``` provides some functionality for manipulating complex numbers.
It is located in ```alternative``` directory as it is not used in the
```hoqus```. The simplest example of using it is the calculation of the sum of
two complex numbers using ```ghci``` interpreter. This requires loading
```Cplx.hs``` module, so you need to make sure that ```ghci``` know whre it is
located.

```haskell
ghci> :load Cplx
[1 of 1] Compiling Cplx             ( Cplx.hs, interpreted )
Ok, modules loaded: Cplx.
ghci> let a = 1+:2
ghci> let b = 3+:3
ghci> a+b
(4.0,5.0)
```

