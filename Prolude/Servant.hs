module Prolude.Servant
  ( -- * Servant re-exports
    module Servant.API
    -- * Alias types
  , HttpDescription
  , HttpJson
  , HttpSummary
  )
where

import Servant.API 
  ( (:<|>)((:<|>))
  , (:>)
  , Delete
  , DeleteNoContent
  , FromHttpApiData(parseHeader, parseQueryParam, parseUrlPiece)
  , Get
  , GetNoContent
  , NoContent(..)
  , Post
  , PostNoContent
  , Put
  , PutNoContent
  , ReqBody
  , ToHttpApiData
  )
import qualified Servant.API as Servant

type HttpDescription = Servant.Description
type HttpJson = Servant.JSON
type HttpSummary = Servant.Summary