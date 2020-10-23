module Prolude.Foldable
    ( module Data.Foldable
    , module Data.Map
    , module Data.Set
    , module GHC.Exts
    , emptySet
    , insertSet
    , setMember
    , setSingleton
    , setUnion
    , setUnions
    )
where

import Data.Foldable (toList)
import Data.Map (Map)
import Data.Set (Set)
import GHC.Exts (fromList)
import qualified Data.Bool as Bool
import qualified Data.Foldable as Foldable
import qualified Data.Ord as Ord
import qualified Data.Set as Set

emptySet :: Set a
emptySet = Set.empty

insertSet :: Ord.Ord a => a -> Set a -> Set a
insertSet = Set.insert 

setMember :: Ord.Ord a => a -> Set a -> Bool.Bool
setMember = Set.member

setSingleton :: a -> Set a
setSingleton = Set.singleton

setUnion :: Ord.Ord a => Set a -> Set a -> Set a
setUnion = Set.union

setUnions :: (Foldable.Foldable f, Ord.Ord a) => f (Set a) -> Set a
setUnions = Set.unions