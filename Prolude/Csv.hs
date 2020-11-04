{-# LANGUAGE ConstraintKinds #-}

module Prolude.Csv
    ( module Data.Csv
    , CsvFromField
    , CsvToField
    , parseCsvField
    , toCsvField
    )
where

import Data.Csv 
    ( DefaultOrdered
    , ToNamedRecord
    )
import qualified Data.Csv as Csv

type CsvFromField = Csv.FromField
type CsvToField = Csv.ToField

parseCsvField :: CsvFromField a => Csv.Field -> Csv.Parser a
parseCsvField = Csv.parseField

toCsvField :: CsvToField a => a -> Csv.Field
toCsvField = Csv.toField