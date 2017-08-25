module Cplx where

data Cplx = Cplx {re :: Double, im :: Double } deriving (Eq)
-- re Cplx a b = a
-- im Cplx a b = b

conj :: Cplx -> Cplx
conj c = Cplx (re c)  (im c)
 
abs :: Cplx -> Double
abs c = sqrt $ (re c)^2 + (im c)^2

(+:) :: Double -> Double -> Cplx
a +: b = Cplx a b

instance Num Cplx where
  a + b = (re a + re b) +: (im a + im b)
  a * b = (re a * re b - im a * im b) +: (im a * re b + re a * im b)
  negate a = (negate $ re a) +: (negate $ im a)
  signum a = a
  fromInteger a = ((fromInteger a) :: Double) +: 0.0

cabs c = Cplx (sqrt $ (re c)^2 + (im c)^2) 0

instance Show Cplx where
  show (Cplx a b) = "(" ++ show a ++ ","  ++ show b ++ ")"
