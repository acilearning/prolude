module Prolude.Aws
  ( -- * Aws re-exports
    module Network.AWS
    -- * Alias types
  , AwsEnv
    -- * Alias functions
  , sendAws
  )
where

import Network.AWS (MonadAWS, liftAWS)
import qualified Network.AWS as Aws

type AwsEnv = Aws.Env

sendAws :: (MonadAWS m, Aws.AWSRequest a) => a -> m (Aws.Rs a)
sendAws = Aws.send
