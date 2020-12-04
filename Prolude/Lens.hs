module Prolude.Lens 
    ( setLens
    , viewLens
    )
where

import qualified Control.Monad.Reader as Reader
import qualified Control.Lens as Lens 

setLens :: Lens.ASetter s t a b -> b -> s -> t
setLens = Lens.set

viewLens :: Reader.MonadReader s m => Lens.Getting a s a -> m a
viewLens = Lens.view