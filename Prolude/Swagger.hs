{-# LANGUAGE ConstraintKinds #-}

module Prolude.Swagger 
    ( -- * SwaggerType re-export
      Swagger.SwaggerType(..)
      -- * Alias types
      -- $alias
    , SwaggerToSchema
    , SwaggerToParamSchema
      -- * Functions
    , defaultDeclareNamedSchema
    )
where

{- $alias
We created type aliases for Swagger.ToSchema and Swagger.ToParamSchema.
-}

import qualified Data.Swagger as Swagger
import qualified Data.Swagger.Declare as Swagger
import qualified Data.Swagger.Internal.Schema as Swagger
import qualified Data.Swagger.Internal.TypeShape as Swagger

type SwaggerToParamSchema = Swagger.ToParamSchema
type SwaggerToSchema = Swagger.ToSchema

-- | Function to help with Swagger.ToSchema instances
defaultDeclareNamedSchema
  :: Applicative f => (Swagger.Schema -> Swagger.Schema) -> proxy a -> f Swagger.NamedSchema
defaultDeclareNamedSchema f = const . pure . Swagger.NamedSchema Nothing $ f mempty
