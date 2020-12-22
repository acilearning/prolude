module Prolude.Time
  ( -- * Data.Time.Calendar re-exports
    module Data.Time.Calendar
    -- * Data.Time.Clock re-exports
  , module Data.Time.Clock
  , module Data.Time.Clock.POSIX
    -- * Data.Time.Format re-exports
  , module Data.Time.Format
    -- * Functions
  , getCurrentTime
  )
where

import Data.Time.Calendar (Day, fromGregorian, toGregorian)
import Data.Time.Clock
  (DiffTime, NominalDiffTime, UTCTime(UTCTime, utctDay, utctDayTime), addUTCTime)
import Data.Time.Clock.POSIX (POSIXTime, getPOSIXTime, posixSecondsToUTCTime, utcTimeToPOSIXSeconds)
import Data.Time.Format (defaultTimeLocale, formatTime)

import qualified Control.Monad.IO.Class as Monad
import qualified Data.Time as Time

-- | Returns now
getCurrentTime :: Monad.MonadIO m => m UTCTime
getCurrentTime = Monad.liftIO Time.getCurrentTime
