{-# LANGUAGE PatternSynonyms #-}

module Prolude.Aeson
  ( module Data.Aeson
  , JsonOptions
  , JsonValue
  , pattern JsonArray
  , pattern JsonBoolean
  , pattern JsonNull
  , pattern JsonNumber
  , pattern JsonObject
  , pattern JsonString
  )
where

import Data.Aeson
  ( FromJSON
  , ToJSON
  , fromJSON
  , genericParseJSON
  , genericToJSON
  , parseJSON
  , toJSON
  , (.!=)
  , (.:)
  , (.:?)
  , (.=)
  )
import qualified Data.Aeson as Aeson
import qualified Data.Bool as Bool
import qualified Data.Scientific as Scientific
import qualified Data.Text as Text
import qualified Data.Vector as Vector

type JsonOptions = Aeson.Options
type JsonValue = Aeson.Value

pattern JsonNull :: JsonValue
pattern JsonNull = Aeson.Null

pattern JsonBoolean :: Bool.Bool -> JsonValue
pattern JsonBoolean x = Aeson.Bool x

pattern JsonNumber :: Scientific.Scientific -> JsonValue
pattern JsonNumber x = Aeson.Number x

pattern JsonString :: Text.Text -> JsonValue
pattern JsonString x = Aeson.String x

pattern JsonArray :: Vector.Vector JsonValue -> JsonValue
pattern JsonArray x = Aeson.Array x

pattern JsonObject :: Aeson.Object -> JsonValue
pattern JsonObject x = Aeson.Object x

{-# COMPLETE
  JsonNull,
  JsonBoolean,
  JsonNumber,
  JsonString,
  JsonArray,
  JsonObject #-}
