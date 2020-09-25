module Prolude.Core
  ( module Control.Applicative
  , module Control.Monad
  , module Control.Monad.Fail
  , module Data.Bool
  , module Data.Char
  , module Data.Either
  , module Data.Eq
  , module Data.Foldable
  , module Data.Function
  , module Data.Functor
  , module Data.Int
  , module Data.Kind
  , module Data.List
  , module Data.Maybe
  , module Data.Monoid
  , module Data.Ord
  , module Data.Semigroup
  , module Data.String
  , module Data.Traversable
  , module Data.Tuple
  , module Data.Word
  , module GHC.Base
  , module GHC.Enum
  , module GHC.Err
  , module GHC.Float
  , module GHC.Generics
  , module GHC.IO.Exception
  , module GHC.List
  , module GHC.Num
  , module GHC.Real
  , module GHC.Show
  , module System.IO
  , module Text.Read
  , identity
  )
where

import Control.Applicative (Applicative(pure, (*>), (<*), (<*>)))
import Control.Monad (Monad((>>), (>>=)))
import Control.Monad.Fail (MonadFail(fail))
import Data.Bool (Bool(False, True), not, otherwise, (&&), (||))
import Data.Char (Char, chr, ord)
import Data.Either (Either(Left, Right), either)
import Data.Eq (Eq((/=), (==)))
import Data.Foldable
  (Foldable(elem, foldMap, foldr, length, null, sum), all, and, any, concat, concatMap, mapM_, or)
import Data.Function ((&))
import Data.Functor (Functor(fmap, (<$)), (<$>))
import Data.Int (Int)
import Data.Kind (Constraint, Type)
import Data.List
  ( break
  , drop
  , dropWhile
  , filter
  , lines
  , replicate
  , reverse
  , splitAt
  , take
  , takeWhile
  , unlines
  , unwords
  , unzip
  , words
  , zip
  , zipWith
  )
import Data.Maybe (Maybe(Just, Nothing), maybe)
import Data.Monoid (Monoid(mempty), mappend, mconcat)
import Data.Ord (Ord(compare, (<=)), Ordering(EQ, GT, LT), max, min, (<), (>), (>=))
import Data.Semigroup (Semigroup((<>)))
import Data.String (String)
import Data.Traversable (Traversable(mapM, sequence, traverse))
import Data.Tuple (curry, fst, snd, uncurry)
import Data.Word (Word)
import GHC.Base (asTypeOf, const, flip, return, seq, undefined, ($), (++), (.), (=<<))
import GHC.Enum (Bounded(maxBound, minBound), Enum(fromEnum, toEnum), pred, succ)
import GHC.Err (error)
import GHC.Float (Double, Float, Floating(logBase, (**)), RealFloat(isInfinite, isNaN))
import GHC.Generics (Generic)
import GHC.IO.Exception (IOError, userError)
import GHC.List (lookup, span)
import GHC.Num (Integer, Num(abs, fromInteger, negate, signum, (*), (+), (-)), subtract)
import GHC.Real
  ( Fractional(fromRational, recip, (/))
  , Integral(div, divMod, mod, quot, quotRem, rem, toInteger)
  , Ratio
  , Rational
  , Real(toRational)
  , RealFrac(ceiling, floor, round, truncate)
  , even
  , fromIntegral
  , gcd
  , lcm
  , odd
  , realToFrac
  , (^)
  , (^^)
  )
import GHC.Show (Show, show)
import System.IO (FilePath, IO, print, putStr, putStrLn)
import Text.Read (Read, read)

identity :: a -> a
identity x = x
{-# INLINE identity #-}

