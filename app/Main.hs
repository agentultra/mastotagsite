{-# LANGUAGE OverloadedStrings #-}
module Main (main) where

import MastoTagSite
import Text.RSS.Types

main :: IO ()
main = do
  maybeRss <- run "inktober2024"
  print $ head . channelItems <$> maybeRss
