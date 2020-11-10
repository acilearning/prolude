module Prolude.ByteString
    ( module Data.ByteString
    , LazyByteString
    , putLazyByteString
    , writeByteStringToFile
    )
where

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
