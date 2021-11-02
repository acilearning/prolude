{-# LANGUAGE ConstraintKinds #-}

module Prolude.Swagger
  ( -- * SwaggerType re-export
    Swagger.SwaggerType(..)
  -- * Alias types
  , SwaggerToSchema
  , SwaggerToParamSchema
  -- * Functions
  , defaultDeclareNamedSchema
  , nameSchema
  )
where

import qualified Data.Swagger as Swagger
import qualified Data.Text as Text
import qualified Data.Typeable as Typeable

type SwaggerToParamSchema = Swagger.ToParamSchema

type SwaggerToSchema = Swagger.ToSchema

-- | This function makes it easy to define a 'Swagger.ToSchema' instance. Just
-- pass in a function that modifies the default empty schema and you're good to
-- go. For example:
--
-- > instance ToSchema SomeType where
-- >   declareNamedSchema = defaultDeclareNamedSchema
-- >     $ set type_ (Just SwaggerObject)
-- >     . set title (Just "some type")
defaultDeclareNamedSchema
  :: (Typeable.Typeable a, Applicative f)
  => (Swagger.Schema -> Swagger.Schema)
  -> proxy a
  -> f Swagger.NamedSchema
defaultDeclareNamedSchema modify proxy =
  let
    schema = modify mempty
    namedSchema = nameSchema proxy schema
  in pure namedSchema

-- | Generates a unique name for the given type and adds that name to the
-- schema. The generated name will be like @ModuleName.TypeName@. For example
-- it might be @Data.Maybe.Maybe@.
nameSchema :: Typeable.Typeable a => proxy a -> Swagger.Schema -> Swagger.NamedSchema
nameSchema proxy schema =
  let
    typeRep = Typeable.typeRep proxy
    tyCon = Typeable.typeRepTyCon typeRep
    moduleName = Typeable.tyConModule tyCon
    typeName = Typeable.tyConName tyCon
    nameString = mconcat [moduleName, ".", typeName]
    nameText = Text.pack nameString
  in Swagger.NamedSchema (Just nameText) schema
