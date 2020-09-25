module Prolude.Exception
  ( module Control.Exception.Safe
  , UnsafeException.AsyncException(..)
  , catchIf
  , unsafeEvaluate
  , unsafeThrow
  )
where

import Prolude.Core

import qualified Control.Exception as UnsafeException
import Control.Exception.Safe hiding (catchIO, throwM)

unsafeEvaluate :: a -> IO a
unsafeEvaluate = UnsafeException.evaluate

unsafeThrow :: Exception e => e -> a
unsafeThrow = UnsafeException.throw

catchIf :: (MonadCatch m, Exception e) => (e -> Bool) -> m a -> (e -> m a) -> m a
catchIf f a b = catch a $ \e -> if f e then b e else throw e
