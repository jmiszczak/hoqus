# hoqus

This repo contains some functions used for playing with quantum mechanics in
Haskell. Much of this work is based on [package for
Mathematica](https://zksi.iitis.pl/wiki/projects:mathematica-qi).

# Example

The simplest example is the calculation of the sum of two complex numbers using
```ghci``` interpreter. This requires loading ```Cplx.hs``` module.

```haskell
ghci> :load Cplx
[1 of 1] Compiling Cplx             ( Cplx.hs, interpreted )
Ok, modules loaded: Cplx.
ghci> let a = 1+:2
ghci> let b = 3+:3
ghci> a+b
(4.0,5.0)
```

The following program (see ``examples/ex01_overlap.hs```) calculates the overlap
of two ket vectors

```haskell
module Main where
import Cplx
import LinAlg

main = do
  let dim = 12
  let a = ket dim 3
  let b = ket dim 6
  let res = overlap a b
  print res
```

In order to compile on of the exampes use ```ghc``` in the main directory

```
ghc --make examples/ex01_overlap
```

To run the programm issue

```
./examples/ex01_overlap
```

in the main directory.
