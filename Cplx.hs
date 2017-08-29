-- <DOC>
-- Module for representing and manipulating complex numbers.
-- </DOC>
module Cplx where

-- <DOC>
-- Basic data type for storing complex numbers.
-- </DOC>
data Cplx = Cplx {re :: Double, im :: Double } deriving (Eq)
-- re Cplx a b = a
-- im Cplx a b = b

-- <DOC>
-- Complex conjugate of a number.
-- </DOC>
conj :: Cplx -> Cplx
conj c = Cplx (re c)  (im c)

-- <DOC>
-- Absolute value of a complex number. In contrast to the abs function
-- overloaded fomr Num, this function returns Double.
-- </DOC>
cabs :: Cplx -> Double
cabs c = (sqrt $ (re c)^2 + (im c)^2)

-- <DOC>
-- Operator for creating new complex number from two Double numbers used as
-- a real and as an imaginary part.
-- </DOC>
(+:) :: Double -> Double -> Cplx
a +: b = Cplx a b

-- <DOC>
-- Function overloaded from Num class.
-- </DOC>
instance Num Cplx where
  a + b = (re a + re b) +: (im a + im b)
  a * b = (re a * re b - im a * im b) +: (im a * re b + re a * im b)
  abs a = Cplx (cabs a) 0
  negate a = (negate $ re a) +: (negate $ im a)
  signum a = a
  fromInteger a = ((fromInteger a) :: Double) +: 0.0

-- <DOC>
-- Function overloaded from Show class. Complex numbers are displayed as pairs.
-- </DOC>
instance Show Cplx where
  show (Cplx a b) = "(" ++ show a ++ ","  ++ show b ++ ")"
