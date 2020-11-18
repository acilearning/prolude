{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE MonoLocalBinds #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE UndecidableInstances #-}

module Prolude.Test 
  ( module Test.QuickCheck
  , AlphaNumByteString(..)
  , AlphaNumText(..)
  , ArbitraryUniform(..)
  , TextUuid(..)
  , arbitraryIO
  )
where

import Test.QuickCheck (Arbitrary(arbitrary), generate, resize, sublistOf)
import Test.QuickCheck.Instances ()
import qualified Control.Monad.IO.Class as Monad
import qualified Data.Aeson as Aeson
import qualified Data.ByteString as ByteString
import qualified Data.Functor as Functor
import qualified Data.Text as Text
import qualified Data.Text.Encoding as Text
import qualified Data.UUID as Uuid
import qualified Generic.Random as Random
import qualified GHC.Generics as Generic
import qualified GHC.Show as Show

newtype AlphaNumText = AlphaNumText { unAlphaTxt :: Text.Text } deriving Aeson.ToJSON via Text.Text

instance Arbitrary AlphaNumText where
  arbitrary = Functor.fmap (AlphaNumText . Text.pack) . resize 10 $ sublistOf
    (['A' .. 'Z'] <> ['a' .. 'z'] <> ['0' .. '9'])

newtype AlphaNumByteString = AlphaNumByteString ByteString.ByteString

instance Arbitrary AlphaNumByteString where
  arbitrary = Functor.fmap (AlphaNumByteString . Text.encodeUtf8 . unAlphaTxt) arbitrary

newtype TextUuid = TextUuid Text.Text deriving Show.Show

instance Arbitrary TextUuid where
  arbitrary = do
    uuid <- arbitrary @Uuid.UUID
    pure . TextUuid $ Uuid.toText uuid

newtype ArbitraryUniform a = ArbitraryUniform  { unArbitraryUniform :: a }
  deriving Generic.Generic via a

instance (Random.GArbitrary Random.UnsizedOpts a, Random.GUniformWeight a) =>  Arbitrary (ArbitraryUniform a) where
  arbitrary = Random.genericArbitraryU

arbitraryIO :: (Arbitrary a, Monad.MonadIO m) => m a
arbitraryIO = Monad.liftIO (generate arbitrary)
