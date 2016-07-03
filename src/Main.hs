{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module Main where

import System.Environment
import GHC.Generics
import qualified Configuration.Dotenv as Dotenv
import Control.Lens
import Data.Aeson
import Data.List
import Data.Maybe
import Data.Text.Encoding
import qualified Data.ByteString.Lazy as BL
import qualified Data.Text as T
import Network.Wreq

data Payload = Payload { channel :: String, username :: String, icon_url :: String, text :: String } deriving (Show, Generic)

instance ToJSON Main.Payload

postToSlack :: String -> IO ()
postToSlack text = do
  Dotenv.loadFile False "env"
  slackUrl <- getEnv "SLACK_INCOMING_WEBHOOK_URL"
  slackChannelName <- getEnv "SLACK_CHANNEL_NAME"
  slackUsername <- getEnv "SLACK_USER_NAME"
  slackIconUrl <- getEnv "SLACK_ICON_URL"
  let payload = Payload { channel = slackChannelName, username = slackUsername, icon_url = slackIconUrl, text = text }
      payloadText = decodeUtf8 . BL.toStrict . encode $ payload
  r <- post slackUrl [partText "payload" payloadText]
  print $ r ^. responseStatus

main :: IO ()
main = do
  arg <- listToMaybe <$> getArgs
  case arg of
    Nothing -> putStrLn "Error: Argument required"
    Just text -> postToSlack text
