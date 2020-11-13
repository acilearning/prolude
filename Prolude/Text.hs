module Prolude.Text
  ( Text.Text
  , stringToText
  , textToString
  )
where

import qualified Data.Text as Text

stringToText :: String -> Text.Text
stringToText = Text.pack

textToString :: Text.Text -> String
textToString = Text.unpack
