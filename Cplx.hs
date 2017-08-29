-- <doc>
-- Module for representing and manipulating complex numbers.
-- </doc>
module Cplx where

-- <doc>
-- Basic data type for storing complex numbers.
-- </doc>
data Cplx = Cplx {re :: Double, im :: Double } deriving (Eq)
-- re Cplx a b = a
-- im Cplx a b = b

-- <doc>
-- Complex conjugate of a number.
-- </doc>
conj :: Cplx -> Cplx
conj c = Cplx (re c)  (-1*( im c))

-- <doc>
-- Absolute value of a complex number. In contrast to the abs function
-- overloaded fomr Num, this function returns Double.
-- </doc>
cabs :: Cplx -> Double
cabs c = (sqrt $ (re c)^2 + (im c)^2)

-- <doc>
-- Operator for creating new complex number from two Double numbers used as
-- a real and as an imaginary part.
-- </doc>
(+:) :: Double -> Double -> Cplx
a +: b = Cplx a b

-- <doc>
-- Functions overloaded from Num class. In particular they implement the
-- arithmetic on complex numbers.
-- </doc>
instance Num Cplx where
  a + b = (re a + re b) +: (im a + im b)
  a * b = (re a * re b - im a * im b) +: (im a * re b + re a * im b)
  abs a = Cplx (cabs a) 0
  negate a = (negate $ re a) +: (negate $ im a)
  signum a = a
  fromInteger a = ((fromInteger a) :: Double) +: 0.0

-- <doc>
-- Function overloaded from Show class. Complex numbers are displayed as pairs.
-- </doc>
instance Show Cplx where
  show (Cplx a b) = "(" ++ show a ++ ","  ++ show b ++ ")"
