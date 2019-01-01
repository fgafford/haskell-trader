import TestUtils

main :: IO ()
main = do
        json <- getJSONFromFile "test/data/ETC-1month-12-30-18.json"
        print json