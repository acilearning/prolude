{-# LANGUAGE ConstraintKinds #-}

module Prolude.Csv
    ( module Data.Csv
    , FromCsvField
    , ToCsvField
    , parseCsvField
    , toCsvField
    )
where

import Data.Csv 
    ( DefaultOrdered
    , ToNamedRecord
    )
import qualified Data.Csv as Csv

type FromCsvField = Csv.FromField
type ToCsvField = Csv.ToField

parseCsvField :: FromCsvField a => Csv.Field -> Csv.Parser a
parseCsvField = Csv.parseField

toCsvField :: ToCsvField a => a -> Csv.Field
toCsvField = Csv.toField