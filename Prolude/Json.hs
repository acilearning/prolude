module Prolude.Json
  ( -- * Aeson re-exports
    module Data.Aeson
    -- * Aeson.Types re-exports
  , module Data.Aeson.Types
    -- * Aeson functions
  , jsonEitherDecode
  , jsonEncode
  )
where

import Data.Aeson (withObject, withText)
import Data.Aeson.Types (Parser)
import qualified Data.Aeson as Aeson
import qualified Data.ByteString.Lazy as ByteString
import qualified Data.Either as Either
import qualified Data.String as String

-- | Function alias for Aeson.eitherDecode
jsonEitherDecode :: Aeson.FromJSON a => ByteString.ByteString -> Either.Either String.String a
jsonEitherDecode = Aeson.eitherDecode

-- | Function alias for Aeson.encode
jsonEncode :: Aeson.ToJSON a => a -> ByteString.ByteString
jsonEncode = Aeson.encode
