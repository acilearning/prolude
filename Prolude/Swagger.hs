{-# LANGUAGE ConstraintKinds #-}

module Prolude.Swagger 
    ( Swagger.SwaggerType(..)
    , SwaggerToSchema
    , SwaggerToParamSchema
    , defaultDeclareNamedSchema
    )
where

import qualified Data.Swagger as Swagger
import qualified Data.Swagger.Declare as Swagger
import qualified Data.Swagger.Internal.Schema as Swagger
import qualified Data.Swagger.Internal.TypeShape as Swagger

type SwaggerToParamSchema = Swagger.ToParamSchema
type SwaggerToSchema = Swagger.ToSchema

defaultDeclareNamedSchema
  :: Applicative f => (Swagger.Schema -> Swagger.Schema) -> proxy a -> f Swagger.NamedSchema
defaultDeclareNamedSchema f = const . pure . Swagger.NamedSchema Nothing $ f mempty
