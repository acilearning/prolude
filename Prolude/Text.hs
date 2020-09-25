module Prolude.Text
  ( module Data.Text
  , fromText
  , toText
  )
where

import Data.Text (Text, pack, unpack)

fromText :: Text -> String
fromText = unpack

toText :: String -> Text
toText = pack
