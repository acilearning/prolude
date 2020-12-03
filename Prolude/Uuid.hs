module Prolude.Uuid 
    ( Uuid
    , randomUuid
    , textToUuid
    , uuidToText
    , wordsToUuid
    )
where

import qualified Data.Maybe as Maybe
import qualified Data.Text as Text
import qualified Data.UUID as UUID
import qualified Data.UUID.V4 as UUID
import qualified Data.Word as Word
import qualified System.IO as IO

type Uuid = UUID.UUID

uuidToText :: Uuid -> Text.Text
uuidToText = UUID.toText

textToUuid :: Text.Text -> Maybe.Maybe Uuid
textToUuid = UUID.fromText

wordsToUuid :: Word.Word32 -> Word.Word32 -> Word.Word32 -> Word.Word32 -> Uuid
wordsToUuid = UUID.fromWords

randomUuid :: IO.IO Uuid
randomUuid = UUID.nextRandom
