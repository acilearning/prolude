module Prolude.Foldable
    ( -- * Foldable re-exports
      module Data.Foldable
      -- * Map re-exports
    , module Data.Map
      -- * Set re-exports
    , module Data.Set
      -- * GHC re-exports
    , module GHC.Exts
    )
where

import Data.Foldable (toList)
import Data.Map (Map)
import Data.Set (Set)
import GHC.Exts (fromList)
