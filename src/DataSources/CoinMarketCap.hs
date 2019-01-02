{-# LANGUAGE LambdaCase #-}
{- | 
Module          : CoinMarketCap
Description     : Interace for interacting with data pulled from  "https://coinmarketcap.com"

Author          : Forest Gafford

Module that allows parsing of raw API calls and stored JSON from coinmarketcap.com

Example URL (visual): 
https://coinmarketcap.com/currencies/ethereum-classic/#charts

Example API request: 
https://graphs2.coinmarketcap.com/currencies/ethereum-classic/1543614245000/1546292645000/
-}
module DataSources.CoinMarketCap 
    ( parse
    , parseAs
    ) where

import Snapshot

import Data.Aeson
import qualified Data.Text as T
import qualified Data.ByteString.Lazy.Internal as B

parseAs :: String -> B.ByteString -> [Snapshot]
parseAs sym bs = case parse bs of 
                    Just (Prices times) -> asSnapshot sym <$> times
                    Nothing -> []

parse :: B.ByteString -> Maybe Prices 
parse = decode

instance FromJSON TimeUSD where
    parseJSON json = do
        [time, usd] <- parseJSON json
        return $ TimeUSD time usd

instance FromJSON Prices where
    parseJSON = \case
        Object o -> (o .: T.pack "price_usd") >>= fmap Prices . parseJSON
        x -> fail $ "unexpected json: " ++ show x