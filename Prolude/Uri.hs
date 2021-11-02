module Prolude.Uri
  ( -- $conversions
    -- * Type alias
    Uri
    -- * Functions
  , stringToUri
  , textToUri
  , uriToString
  , uriToText
  )
where

import qualified Data.Either as Either
import qualified Data.String as String
import qualified Data.Text as Text
import qualified Network.URI as URI

import qualified Prolude.Core as Core
import qualified Prolude.Text as Text

{- $conversions
+---------+-------------+-------------+
| From/To | Uri         | String      |
+---------+-------------+-------------+
| Uri     | -           | uriToString |
+---------+-------------+-------------+
| String  | stringToUri | -           |
+---------+-------------+-------------+

+---------+-----------+-----------+
| From/To | Uri       | Text      |
+---------+-----------+-----------+
| Uri     | -         | uriToText |
+---------+-----------+-----------+
| Text    | textToUri | -         |
+---------+-----------+-----------+
-}

type Uri = URI.URI

stringToUri :: String.String -> Either.Either String.String URI.URI
stringToUri string = case URI.parseURI string of
  Nothing -> Left $ "invalid URI: " <> show string
  Just uri -> Right uri

textToUri :: Text.Text -> Either.Either String.String URI.URI
textToUri = stringToUri . Text.textToString

uriToString :: URI.URI -> String.String
uriToString uri = URI.uriToString Core.identity uri ""

uriToText :: URI.URI -> Text.Text
uriToText = Text.stringToText . uriToString
