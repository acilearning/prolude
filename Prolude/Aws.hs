module Prolude.Aws
  ( -- * Aws re-exports
    module Network.AWS
  , module Network.AWS.SNS.Publish
    -- * Alias types
  , AwsEnv
  , PublishSns
  , S3BucketName
  , S3ObjectKey
    -- * Alias functions
  , publishSns
  , sendAws
  )
where 

import Network.AWS (MonadAWS, liftAWS)
import Network.AWS.SNS.Publish (pTopicARN)
import qualified Network.AWS as Aws
import qualified Network.AWS.Data.Text as Text
import qualified Network.AWS.S3 as S3
import qualified Network.AWS.SNS.Publish as Publish

type AwsEnv = Aws.Env
type PublishSns = Publish.Publish
type S3BucketName = S3.BucketName
type S3ObjectKey = S3.ObjectKey

sendAws :: (MonadAWS m, Aws.AWSRequest a) => a -> m (Aws.Rs a)
sendAws = Aws.send

publishSns :: Text.Text -> PublishSns
publishSns = Publish.publish