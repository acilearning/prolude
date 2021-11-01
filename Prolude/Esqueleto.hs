{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE FlexibleContexts #-}

module Prolude.Esqueleto 
  ( -- * Esqueleto re-exports
    -- $esqueleto
    module Database.Esqueleto.Experimental
    -- * Alias type
    -- $alias
  , EsqueletoValue
    -- * Alias functions
    -- $functions
  , esqueletoFrom
  , esqueletoOn
  , esqueletoSelect
  , esqueletoVal
  ) 
where

import qualified Control.Monad.IO.Class as IO
import qualified Data.Bool as Bool
import qualified Database.Esqueleto.Experimental as Esqueleto
import qualified Database.Esqueleto.Experimental.From as Esqueleto.From
import qualified Database.Esqueleto.Experimental.From.Join as Esqueleto.From.Join
import qualified Database.Esqueleto.Internal.Internal as Esqueleto.Internal
import Database.Esqueleto.Experimental 
  ( (=.)
  , (==.)
  , (^.)
  , (&&.)
  , (<.)
  , (>=.)
  , InnerJoin(InnerJoin)
  , in_
  , unSingle
  , valList
  , where_
  )

{- $esqueleto
These are our re-exports from Esqueleto. They include: (=.), (==.), (^.), (&&.), (<.), (>=.), InnerJoin(InnerJoin), in_, unSingle, valList, and where_  
-}

{- $alias
We created a type alias for Esqueleto.Value.
-}

{- $functions
We created aliases for from, on, select, and val.
-}

type EsqueletoValue = Esqueleto.Value

esqueletoFrom :: Esqueleto.From.ToFrom a a' => a -> Esqueleto.SqlQuery a'
esqueletoFrom = Esqueleto.from

esqueletoSelect 
  :: (Esqueleto.Internal.SqlSelect a r, IO.MonadIO m) 
  => Esqueleto.SqlQuery a 
  -> Esqueleto.SqlReadT m [r]
esqueletoSelect = Esqueleto.select

esqueletoOn 
  :: Esqueleto.From.Join.ValidOnClause a
  => a 
  -> (b -> Esqueleto.SqlExpr (EsqueletoValue Bool.Bool)) 
  -> (a, b -> Esqueleto.SqlExpr (EsqueletoValue Bool.Bool))
esqueletoOn = Esqueleto.on

esqueletoVal :: Esqueleto.PersistField typ => typ -> Esqueleto.SqlExpr (EsqueletoValue typ)
esqueletoVal = Esqueleto.val