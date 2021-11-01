module Prolude.Esqueleto where

import qualified Database.Esqueleto.Experimental as Esqueleto
import Database.Esqueleto.Experimental 
  ( (=.)
  , (==.)
  , (^.)
  , val
  , where_
  , (&&.)
  , InnerJoin(InnerJoin)
  , in_
  , on
  , select
  , valList
  , unSingle
  , (<.)
  , (>=.)
  )

type EsqueletoValue = Esqueleto.Value

-- esqueletoFrom :: Esqueleto.ToFrom a a' => a -> Esqueleto.SqlQuery a'
-- esqueletoFrom = Esqueleto.from