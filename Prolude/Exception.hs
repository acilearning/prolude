module Prolude.Exception
  ( -- * Exception re-exports
    module Control.Exception.Safe
  , UnsafeException.AsyncException(..)
    -- * Exception functions
  , catchIf
  , unsafeEvaluate
  , unsafeThrow
  )
where

import Prolude.Core

import qualified Control.Exception as UnsafeException
import Control.Exception.Safe hiding (catchIO, throwM)

-- | Function alias for Control.Exception.evaluate
unsafeEvaluate :: a -> IO a
unsafeEvaluate = UnsafeException.evaluate

-- | Function alias for Control.Exception.throw
unsafeThrow :: Exception e => e -> a
unsafeThrow = UnsafeException.throw

-- | Catch exception based on a predicate
catchIf :: (MonadCatch m, Exception e) => (e -> Bool) -> m a -> (e -> m a) -> m a
catchIf f a b = catch a $ \e -> if f e then b e else throw e
