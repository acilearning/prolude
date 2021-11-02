{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE MonoLocalBinds #-}
{-# LANGUAGE UndecidableInstances #-}

module Prolude.Test
  ( -- * QuickCheck re-exports
    module Test.QuickCheck
    -- * Type
  , ArbitraryUniform(..)
    -- * Function
  , arbitraryIO
  )
where

import Test.QuickCheck (Arbitrary(arbitrary), generate, resize, sublistOf)
import Test.QuickCheck.Instances ()
import qualified Control.Monad.IO.Class as Monad
import qualified Generic.Random as Random
import qualified GHC.Generics as Generic

newtype ArbitraryUniform a = ArbitraryUniform  { unArbitraryUniform :: a }
  deriving Generic.Generic via a

instance (Random.GArbitrary Random.UnsizedOpts a, Random.GUniformWeight a) =>  Arbitrary (ArbitraryUniform a) where
  arbitrary = Random.genericArbitraryU

arbitraryIO :: (Arbitrary a, Monad.MonadIO m) => m a
arbitraryIO = Monad.liftIO (generate arbitrary)
