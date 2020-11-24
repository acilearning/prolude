module Prolude.Text
  ( LazyText
  , Text.Text
  , lazyTextToString
  , lazyTextToText
  , stringToLazyText
  , stringToText
  , textToLazyText
  , textToString
  )
where

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
