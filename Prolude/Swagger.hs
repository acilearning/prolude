{-# LANGUAGE DataKinds #-}
{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}

module Prolude.Swagger 
    ( Swagger.SwaggerType(Swagger.SwaggerString)
    , ToSwaggerSchema
    , ToSwaggerParamSchema
    , defaultDeclareNamedSchema
    , withDefaultNamedSchema
    )
where

import Control.Monad.Identity (Identity)
import qualified Data.Aeson as Aeson
import qualified Data.Char as Char
import qualified Data.List as List
import qualified Data.Maybe as Maybe
import qualified Data.String as String
import qualified Data.Swagger as Swagger
import qualified Data.Swagger.Declare as Swagger
import qualified Data.Swagger.Internal.Schema as Swagger
import qualified Data.Swagger.Internal.TypeShape as Swagger
import qualified Data.Typeable as Typeable
import qualified GHC.Generics as Generics

type ToSwaggerParamSchema a = Swagger.ToParamSchema a
type ToSwaggerSchema a = Swagger.ToSchema a

defaultDeclareNamedSchema
  :: Applicative f => (Swagger.Schema -> Swagger.Schema) -> proxy a -> f Swagger.NamedSchema
defaultDeclareNamedSchema f = const . pure . Swagger.NamedSchema Nothing $ f mempty

withDefaultNamedSchema
  :: ( Typeable.Typeable a
     , Swagger.GenericHasSimpleShape
         a
         "genericDeclareSchemaUnrestricted"
         (Swagger.GenericShape (Generics.Rep a))
     , Generics.Generic a
     , Swagger.GToSchema (Generics.Rep a)
     )
  => (Swagger.Schema -> Swagger.Schema)
  -> Typeable.Proxy a
  -> Swagger.DeclareT (Swagger.Definitions Swagger.Schema) Identity Swagger.NamedSchema
withDefaultNamedSchema lens proxy = do
  schema <- Swagger.genericDeclareSchema (swaggerOptions proxy) proxy
  pure . Swagger.NamedSchema Nothing $ lens schema

swaggerOptions :: Typeable.Typeable a => Typeable.Proxy a -> Swagger.SchemaOptions
swaggerOptions = Swagger.fromAesonOptions . jsonOptions

jsonOptions :: Typeable.Typeable a => Typeable.Proxy a -> Aeson.Options
jsonOptions proxy =
  let prefix = typeName proxy
  in
    Aeson.defaultOptions
      { Aeson.constructorTagModifier = (overFirst Char.toLower)
        . partialDropPrefix (overFirst Char.toUpper $ prefix) -- thisIsARecord
      , Aeson.fieldLabelModifier = (overFirst Char.toLower)
        . partialDropPrefix (overFirst Char.toLower $ prefix) -- thisIsAField
      , Aeson.sumEncoding = Aeson.ObjectWithSingleField
      , Aeson.unwrapUnaryRecords = True
      }

typeName :: Typeable.Typeable a => Typeable.Proxy a -> String.String
typeName = Typeable.tyConName . Typeable.typeRepTyCon . Typeable.typeRep

overFirst :: (a -> a) -> [a] -> [a]
overFirst f xs = case xs of
  [] -> xs
  x : ys -> f x : ys

partialDropPrefix :: (Eq a, Show a) => [a] -> [a] -> [a]
partialDropPrefix prefix list = case list of
  [] -> []
  _ -> Maybe.fromMaybe
    (error (unwords [show prefix, "is not a prefix of", show list]))
    (List.stripPrefix prefix list)
    