{-# LANGUAGE ConstraintKinds #-}

module Prolude.Csv
    ( -- * Csv re-exports
      module Data.Csv
      -- * Alias types
      -- $alias
    , FromCsvField
    , ToCsvField
      -- * Alias functions
      -- $functions
    , parseCsvField
    , toCsvField
    )
where

import Data.Csv 
    ( DefaultOrdered
    , ToNamedRecord
    )
import qualified Data.Csv as Csv

{- $alias
We created type aliases for the Csv.ToField and Csv.FromField classes.
-}

{- $functions
We created aliases for the Csv.parseField and Csv.toField functions.
-}

type FromCsvField = Csv.FromField
type ToCsvField = Csv.ToField

parseCsvField :: FromCsvField a => Csv.Field -> Csv.Parser a
parseCsvField = Csv.parseField

toCsvField :: ToCsvField a => a -> Csv.Field
toCsvField = Csv.toField