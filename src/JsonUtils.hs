module JsonUtils where

-- import from data.Aeson 

import qualified Data.ByteString.Lazy as B
import Network.HTTP.Conduit (simpleHttp)

getJSONFromFile :: String -> IO B.ByteString
getJSONFromFile = B.readFile 

getJSONFromURL :: String -> IO B.ByteString
getJSONFromURL = simpleHttp