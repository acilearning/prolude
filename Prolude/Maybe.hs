module Prolude.Maybe
  ( module Data.Maybe
  , note
  , hush
  )
where

import Data.Maybe 
    ( Maybe(Just, Nothing)
    , catMaybes
    , fromMaybe
    , isJust
    , isNothing
    , listToMaybe
    , mapMaybe
    , maybe
    , maybeToList
    )

{-# INLINE hush #-}
-- | Suppress the 'Left' value of an 'Either'
hush :: Either a b -> Maybe b
hush = either (const Nothing) Just

{-# INLINE note #-}
-- | Tag the 'Nothing' value of a 'Maybe'
note :: a -> Maybe b -> Either a b
note a = maybe (Left a) Right
