import TestUtils

import DataSources.CoinMarketCap

main :: IO ()
main = do
        json <- getJSONFromFile "test/data/CoinMarketCap/ETC-1month-12-30-18.json"
        print $ parse json