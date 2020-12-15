module Prolude.ByteString
  ( -- * ByteString re-exports
    module Data.ByteString
    -- * ByteString functions
  , writeByteStringToFile
    -- * LazyByteString type alias
    -- $alias
  , LazyByteString
    -- * LazyByteString functions
  , putLazyByteString
  )
where

{- $alias
We created a type alias for LazyByteString.ByteString simply called LazyByteString.
-}

import Data.ByteString (ByteString)
import qualified Control.Monad.IO.Class as MonadIO
import qualified Data.ByteString as BS
import qualified Data.ByteString.Lazy as LBS
import qualified System.IO as IO

type LazyByteString = LBS.ByteString

putLazyByteString :: MonadIO.MonadIO m => LazyByteString -> m ()
putLazyByteString = MonadIO.liftIO . LBS.putStr

writeByteStringToFile :: MonadIO.MonadIO m => IO.FilePath -> ByteString -> m ()
writeByteStringToFile path bs = MonadIO.liftIO $ BS.writeFile path bs
