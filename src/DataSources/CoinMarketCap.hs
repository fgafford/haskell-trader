{-- CoinMarketCap DataSource

Example URL (visual): 
https://coinmarketcap.com/currencies/ethereum-classic/#charts

Example API request: 
https://graphs2.coinmarketcap.com/currencies/ethereum-classic/1543614245000/1546292645000/
--}
module DataSources.CoinMarketCap 
    ( parse
    ) where

data Snapshot = 
  Snapshot { time:: Float
           , usd:: Float
           } deriving Show


parse :: IO () 
parse = putStrLn "ParseFunctionCalled"