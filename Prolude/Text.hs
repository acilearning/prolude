module Prolude.Text
  ( -- * Types
    LazyText
  , Text.Text
    -- * Functions
    -- $functions
  , lazyTextToString
  , lazyTextToText
  , stringToLazyText
  , stringToText
  , textToLazyText
  , textToString
  )
where

{- $functions
+----------+------------------+------------------+----------------+
| From/To  | LazyText         | String           | Text           |
+----------+------------------+------------------+----------------+
| LazyText | -                | lazyTextToString | lazyTextToText |
+----------+------------------+------------------+----------------+
| String   | stringToLazyText | -                | stringToText   |
+----------+------------------+------------------+----------------+
| Text     | textToLazyText   | textToString     | -              |
+----------+------------------+------------------+----------------+
-}

import qualified Data.Text as Text
import qualified Data.Text.Lazy as LazyText

type LazyText = LazyText.Text

stringToText :: String -> Text.Text
stringToText = Text.pack

textToString :: Text.Text -> String
textToString = Text.unpack

stringToLazyText :: String -> LazyText
stringToLazyText = LazyText.pack

lazyTextToString :: LazyText -> String
lazyTextToString = LazyText.unpack

textToLazyText :: Text.Text -> LazyText
textToLazyText = LazyText.fromStrict

lazyTextToText :: LazyText -> Text.Text
lazyTextToText = LazyText.toStrict
