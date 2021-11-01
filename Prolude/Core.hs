module Prolude.Core
  ( -- * Applicative re-exports
    module Control.Applicative
    -- * Monad re-exports
  , module Control.Monad
  , module Control.Monad.Fail
  , module Data.Monoid
    -- * Base re-exports
  , module Data.Bool
  , module Data.Bifunctor
  , module Data.Either
  , module Data.Eq
  , module Data.Foldable
  , module Data.Function
  , module Data.Functor
  , module Data.Kind
  , module Data.Ord
  , module Data.Proxy
  , module Data.Semigroup
  , module Data.Traversable
  , module GHC.Base
  , module GHC.Err
  , module GHC.Generics
  , module GHC.IO.Exception
  , module GHC.Show
  , module System.IO
  , module Text.Read
    -- * List re-exports
  , module Data.List
  , module GHC.List
    -- * Number re-exports
  , module Data.Int
  , module GHC.Enum
  , module GHC.Float
  , module GHC.Num
  , module GHC.Real
    -- * String + Text re-exports
  , module Data.Char
  , module Data.String
  , module Data.Word
    -- * Tuple re-exports
  , module Data.Tuple
    -- * Identity
  , identity
  , stm
  )
where

import Control.Applicative (Applicative(pure, (*>), (<*), (<*>)))
import Control.Monad (Monad((>>), (>>=)))
import Control.Monad.Fail (MonadFail(fail))
import Control.Concurrent.STM (STM, atomically)
import Control.Monad.IO.Class (MonadIO, liftIO)
import Data.Bool (Bool(False, True), not, otherwise, (&&), (||))
import Data.Bifunctor (Bifunctor(bimap, first, second))
import Data.Char (Char, chr, ord)
import Data.Either (Either(Left, Right), either)
import Data.Eq (Eq((/=), (==)))
import Data.Foldable
  (Foldable(elem, foldMap, foldr, length, null, sum), all, and, any, concat, concatMap, mapM_, or)
import Data.Function ((&), (.))
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
import Data.Monoid (Monoid(mempty), mappend, mconcat)
import Data.Ord (Ord(compare, (<=)), Ordering(EQ, GT, LT), max, min, (<), (>), (>=))
import Data.Proxy (Proxy(Proxy))
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

stm :: MonadIO m => STM a -> m a
stm = liftIO . atomically