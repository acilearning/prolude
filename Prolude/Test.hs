module Prolude.Test where

import Test.QuickCheck (Arbitrary(arbitrary))
import qualified Control.Monad.IO.Class as Monad
import qualified Data.ByteString as ByteString
import qualified Data.Functor as Functor
import qualified Data.Text as Text
import qualified Data.UUID as Uuid
import qualified GHC.Show as Show

newtype AlphaNumText = AlphaNumText { unAlphaTxt :: Text.Text }

instance Arbitrary AlphaNumText where
  arbitrary = Functor.fmap (AlphaNumText . Text.pack) . resize 10 $ sublistOf
    (['A' .. 'Z'] <> ['a' .. 'z'] <> ['0' .. '9'])

newtype AlphaNumByteString = AlphaNumByteString ByteString

instance Arbitrary AlphaNumByteString where
  arbitrary = Functor.fmap (AlphaNumByteString . Text.encodeUtf8 . unAlphaTxt) arbitrary

newtype TextUuid = TextUuid Text.Text deriving Show.Show

instance Arbitrary TextUuid where
  arbitrary = do
    uuid <- arbitrary @Uuid.UUID
    pure . TextUuid $ Uuid.toText uuid

arbitraryIO :: (Arbitrary a, Monad.MonadIO m) => m a
arbitraryIO = Monad.liftIO (generate arbitrary)
