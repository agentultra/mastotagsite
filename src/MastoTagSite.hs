{-# LANGUAGE OverloadedStrings #-}

module MastoTagSite where

import           Data.Conduit
import           Data.Text (Text)
import qualified Data.Text as T
import           Network.HTTP.Simple
import           Text.RSS.Conduit.Parse
import           Text.RSS.Types
import           Text.XML.Stream.Parse

run :: Text -> IO (Maybe (RssDocument NoExtensions))
run hashTag = do
  initReq <- parseRequest . T.unpack $ "https://types.pl/tags/" <> hashTag <> ".rss"
  runConduitRes
    $ httpSource initReq getResponseBody
    .| parseBytes def
    .| rssDocument
