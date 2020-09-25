module Prolude.Json
  ( module Data.Aeson
  , module Data.Aeson.Types
  , jsonEitherDecode
  , jsonEncode
  )
where

import Data.Aeson (FromJSON, ToJSON, eitherDecode, encode, withObject, withText)
import Data.Aeson.Types (Parser)
import Data.ByteString.Lazy (ByteString)
import Data.Either (Either)
import Data.String (String)

jsonEitherDecode :: FromJSON a => ByteString -> Either String a
jsonEitherDecode = eitherDecode

jsonEncode :: ToJSON a => a -> ByteString
jsonEncode = encode
