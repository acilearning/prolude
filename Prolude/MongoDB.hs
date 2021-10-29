{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE ConstraintKinds #-}

module Prolude.MongoDB
  ( -- * MongoDB re-exports
    module Database.MongoDB
    -- * Type aliases
    -- $type
  , MongoAction
  , MongoCollection
  , MongoDatabase
  , MongoDocument
  , MongoField
  , MongoLabel
  , MongoQuery
  , MongoValue
  , MongoVal
    -- * Pattern synonyms
    -- $synonyms
  , pattern MongoArray
  , pattern MongoBin
  , pattern MongoBool
  , pattern MongoDoc
  , pattern MongoFloat
  , pattern MongoFun
  , pattern MongoInt32
  , pattern MongoInt64
  , pattern MongoJavaScr
  , pattern MongoMd5
  , pattern MongoMinMax
  , pattern MongoNull
  , pattern MongoObjId
  , pattern MongoRegEx
  , pattern MongoStamp
  , pattern MongoString
  , pattern MongoSym
  , pattern MongoUserDef
  , pattern MongoUTC
  , pattern MongoUuid
    -- * Function aliases
    -- $functions
  , mongoFailed
  , mongoInsert_
  , mongoModified
  , mongoSelect
  , mongoUpdateMany
    -- * Operators aliases
    -- $operators
  , (>=:)
  , (>:)
  , (<=:)
  , (<:)
  , (<-:)
  , (!<-:)
  , (!=:)
  )
where

import Prolude.Core

import Database.MongoDB (ObjectId, UpdateOption(MultiUpdate), fval, genObjectId, (=:))
import qualified Control.Monad.IO.Class as Monad
import qualified Data.Int as Int
import qualified Data.Text as Text
import qualified Data.Time as Time
import qualified Database.MongoDB as Mongo

{- $type
We created type aliases for specific Mongo types. These include: Action, Collection, Database, Document, Field, Label, Query, Selector, Val, and Value.
-}

{- $synonyms
We created pattern synonyms for the MongoValue constructors.
-}

{- $functions
We created aliases for specific Mongo functions. These include: failed, insert_, nModified, select, and updateMany.
-}

{- $operators
We created aliases for specific Mongo operators. These include: (>=:), (>:), (<=:), (<:), (<-:), (!<-:), and (!=:).
-}

type MongoAction = Mongo.Action
type MongoCollection = Mongo.Collection
type MongoDatabase = Mongo.Database
type MongoDocument = Mongo.Document
type MongoField = Mongo.Field
type MongoLabel = Mongo.Label
type MongoQuery = Mongo.Query
type MongoSelector = Mongo.Selector
type MongoVal = Mongo.Val

type MongoValue = Mongo.Value

(>=:) :: MongoVal v => MongoLabel -> v -> MongoField
f >=: x = f =: [(Text.pack "$gte") =: x]

(>:) :: MongoVal v => MongoLabel -> v -> MongoField
f >: x = f =: [(Text.pack "$gt") =: x]

(<=:) :: MongoVal v => MongoLabel -> v -> MongoField
f <=: x = f =: [(Text.pack "$lte") =: x]

(<:) :: MongoVal v => MongoLabel -> v -> MongoField
f <: x = f =: [(Text.pack "$lt") =: x]

(<-:) :: MongoVal v => MongoLabel -> [v] -> MongoField
f <-: x = f =: [(Text.pack "$in") =: x]

(!<-:) :: MongoVal v => MongoLabel -> [v] -> MongoField
f !<-: x = f =: [(Text.pack "$nin") =: x]

(!=:) :: MongoVal v => MongoLabel -> v -> MongoField
f !=: x = f =: [(Text.pack "$ne") =: x]

pattern MongoFloat :: Double -> MongoValue
pattern MongoFloat x = Mongo.Float x

pattern MongoString :: Text.Text -> MongoValue
pattern MongoString x = Mongo.String x

pattern MongoDoc :: Mongo.Document -> MongoValue
pattern MongoDoc x = Mongo.Doc x

pattern MongoArray :: [Mongo.Value] -> MongoValue
pattern MongoArray x = Mongo.Array x

pattern MongoBin :: Mongo.Binary -> MongoValue
pattern MongoBin x = Mongo.Bin x

pattern MongoFun :: Mongo.Function -> MongoValue
pattern MongoFun x = Mongo.Fun x

pattern MongoUuid :: Mongo.UUID -> MongoValue
pattern MongoUuid x = Mongo.Uuid x

pattern MongoMd5 :: Mongo.MD5 -> MongoValue
pattern MongoMd5 x = Mongo.Md5 x

pattern MongoUserDef :: Mongo.UserDefined -> MongoValue
pattern MongoUserDef x = Mongo.UserDef x

pattern MongoObjId :: Mongo.ObjectId -> MongoValue
pattern MongoObjId x = Mongo.ObjId x

pattern MongoBool :: Bool -> MongoValue
pattern MongoBool x = Mongo.Bool x

pattern MongoUTC :: Time.UTCTime -> MongoValue
pattern MongoUTC x = Mongo.UTC x

pattern MongoNull :: MongoValue
pattern MongoNull = Mongo.Null

pattern MongoRegEx :: Mongo.Regex -> MongoValue
pattern MongoRegEx x = Mongo.RegEx x

pattern MongoJavaScr :: Mongo.Javascript -> MongoValue
pattern MongoJavaScr x = Mongo.JavaScr x

pattern MongoSym :: Mongo.Symbol -> MongoValue
pattern MongoSym x = Mongo.Sym x

pattern MongoInt32 :: Int.Int32 -> MongoValue
pattern MongoInt32 x = Mongo.Int32 x

pattern MongoInt64 :: Int.Int64 -> MongoValue
pattern MongoInt64 x = Mongo.Int64 x

pattern MongoStamp :: Mongo.MongoStamp -> MongoValue
pattern MongoStamp x = Mongo.Stamp x

pattern MongoMinMax :: Mongo.MinMaxKey -> MongoValue
pattern MongoMinMax x = Mongo.MinMax x

{-# COMPLETE
  MongoFloat
  , MongoString
  , MongoDoc
  , MongoArray
  , MongoBin
  , MongoFun
  , MongoUuid
  , MongoMd5
  , MongoUserDef
  , MongoObjId
  , MongoBool
  , MongoUTC
  , MongoNull
  , MongoRegEx
  , MongoJavaScr
  , MongoSym
  , MongoInt32
  , MongoInt64
  , MongoStamp
  , MongoMinMax #-}

mongoFailed :: Mongo.WriteResult -> Bool
mongoFailed = Mongo.failed

mongoInsert_ :: Monad.MonadIO m => MongoCollection -> MongoDocument -> MongoAction m ()
mongoInsert_ = Mongo.insert_

mongoModified :: Mongo.WriteResult -> Maybe Int
mongoModified = Mongo.nModified

mongoSelect :: MongoSelector -> MongoCollection -> MongoQuery
mongoSelect = Mongo.select

mongoUpdateMany
  :: Monad.MonadIO m
  => MongoCollection
  -> [(MongoSelector, MongoDocument, [UpdateOption])]
  -> MongoAction m Mongo.WriteResult
mongoUpdateMany = Mongo.updateMany
