module Prolude.Servant
  ( -- * Servant re-exports
    module Servant
    -- * Alias types
  , HttpDescription
  , HttpJson
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
  , Summary
  , ToHttpApiData
  )
import qualified Servant.API as Servant

type HttpDescription = Servant.Description
type HttpJson = Servant.JSON