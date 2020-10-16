module Prolude.Map
    ( module Data.Map
    , mapElems
    , mapEmpty
    , mapFindWithDefault
    , mapFromList
    , mapLookup
    , mapSingleton
    , mapToList
    )
where

import Data.Map (Map)
import qualified Data.Ord as Ord
import qualified Data.Map as Map

mapElems :: Map k a -> [a]
mapElems = Map.elems

mapEmpty :: Map k a
mapEmpty = Map.empty

mapFindWithDefault :: Ord.Ord k => a -> k -> Map k a -> a
mapFindWithDefault = Map.findWithDefault

mapFromList :: Ord.Ord k => [(k, a)] -> Map k a
mapFromList = Map.fromList

mapLookup :: Ord.Ord k => k -> Map k a -> Maybe a
mapLookup = Map.lookup

mapSingleton :: k -> a -> Map k a
mapSingleton = Map.singleton

mapToList :: Map k a -> [(k, a)]
mapToList = Map.toList