module Prolude.Uuid 
  ( -- * Type alias
    Uuid
    -- * Functions
  , randomUuid
  , textToUuid
  , uuidToText
  , wordsToUuid
  )
where

import qualified Control.Monad.IO.Class as Monad
import qualified Data.Maybe as Maybe
import qualified Data.Text as Text
import qualified Data.UUID as UUID
import qualified Data.UUID.V4 as UUID
import qualified Data.Word as Word
import qualified System.IO as IO

type Uuid = UUID.UUID

-- | Converts a Uuid to Text
uuidToText :: Uuid -> Text.Text
uuidToText = UUID.toText

-- | Converts a Text to a Maybe Uuid
textToUuid :: Text.Text -> Maybe.Maybe Uuid
textToUuid = UUID.fromText

-- | Creates a Uuid from Words
wordsToUuid :: Word.Word32 -> Word.Word32 -> Word.Word32 -> Word.Word32 -> Uuid
wordsToUuid = UUID.fromWords

-- | Returns a randomUuid
randomUuid :: Monad.MonadIO m => m Uuid
randomUuid = Monad.liftIO UUID.nextRandom
