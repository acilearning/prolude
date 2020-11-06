module Prolude.ByteString
    ( module Data.ByteString
    , LazyByteString
    , putLazyStr
    )
where

import Data.ByteString (ByteString, writeFile)
import qualified Data.ByteString.Lazy as LBS
import qualified System.IO as IO

type LazyByteString = LBS.ByteString

putLazyStr :: LazyByteString -> IO.IO ()
putLazyStr = LBS.putStr