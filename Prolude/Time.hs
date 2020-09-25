module Prolude.Time
  ( module Data.Time.Calendar
  , module Data.Time.Clock
  , module Data.Time.Clock.POSIX
  , module Data.Time.Format
  , getCurrentTime
  )
where

import Data.Time.Calendar (Day, fromGregorian, toGregorian)
import Data.Time.Clock
  (DiffTime, NominalDiffTime, UTCTime(UTCTime, utctDay, utctDayTime), addUTCTime)
import Data.Time.Clock.POSIX (POSIXTime, getPOSIXTime, posixSecondsToUTCTime, utcTimeToPOSIXSeconds)
import Data.Time.Format (defaultTimeLocale, formatTime)

import Control.Monad.IO.Class (MonadIO(liftIO))
import qualified Data.Time as Time

-- | Returns now
getCurrentTime :: MonadIO m => m UTCTime
getCurrentTime = liftIO Time.getCurrentTime
