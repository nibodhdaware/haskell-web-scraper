{-# LANGUAGE OverloadedStrings #-}

import Control.Monad.IO.Class (liftIO)
import Data.Text (Text, unpack)
import Text.HTML.Scalpel

postTitle :: Scraper Text [Text]
postTitle = texts $ "a" @: [hasClass "post-block__title__link"]

main :: IO ()
main = do
  maybeTitles <- scrapeURL "https://techcrunch.com/" postTitle
  case maybeTitles of
    Just titles -> mapM_ (putStrLn . unpack) titles -- print all the titles
    Nothing -> putStrLn "Failed to scrape website"
