{-# LANGUAGE LambdaCase #-}
{-- CoinMarketCap DataSource

Example URL (visual): 
https://coinmarketcap.com/currencies/ethereum-classic/#charts

Example API request: 
https://graphs2.coinmarketcap.com/currencies/ethereum-classic/1543614245000/1546292645000/
--}
module DataSources.CoinMarketCap 
    ( parse
    , parseAs
    ) where

import Types

import Data.Aeson
import qualified Data.Text as T
import qualified Data.ByteString.Lazy.Internal as B

parseAs :: String -> B.ByteString -> [Snapshot]
parseAs sym bs = case parse bs of 
                    Just (Snapshots shots) -> fmap (\shot -> Snapshot (tm shot) (us shot) sym) shots
                    Nothing -> []

parse :: B.ByteString -> Maybe Snapshots 
parse = decode


instance FromJSON TimeUSD where
    parseJSON json = do
        [time, usd] <- parseJSON json
        return $ TimeUSD time usd
        -- return Snapshot { time=time 
        --                 , usd=usd
        --                 , sign="ETC"
        --                 }

instance FromJSON Snapshots where
    parseJSON = \case
        Object o -> (o .: T.pack "price_usd") >>= fmap Snapshots . parseJSON
        x -> fail $ "unexpected json: " ++ show x