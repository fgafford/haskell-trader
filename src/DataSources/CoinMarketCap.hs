{-# LANGUAGE LambdaCase #-}
{-- CoinMarketCap DataSource

Example URL (visual): 
https://coinmarketcap.com/currencies/ethereum-classic/#charts

Example API request: 
https://graphs2.coinmarketcap.com/currencies/ethereum-classic/1543614245000/1546292645000/
--}
module DataSources.CoinMarketCap 
    ( parse
    ) where

import Types

import Data.Aeson
import Data.Text
import qualified Data.ByteString.Lazy.Internal as B

parse :: B.ByteString -> Maybe Snapshots 
parse = decode

instance FromJSON Snapshot where
    parseJSON json = do
        [time, usd] <- parseJSON json
        return Snapshot { time=time 
                        , usd=usd
                        , sign="ETC"
                        }

instance FromJSON Snapshots where
    parseJSON = \case
        Object o -> (o .: pack "price_usd") >>= fmap Snapshots . parseJSON
        x -> fail $ "unexpected json: " ++ show x