{-# LANGUAGE DuplicateRecordFields #-}
module Snapshot where

data TimeUSD = 
    TimeUSD { time:: Double
            , usd:: Double
            } deriving Show

data Snapshot = 
    Snapshot { time:: Double
             , usd:: Double
             , sign:: String
             } deriving Show

data Prices = 
    Prices [TimeUSD] 
    deriving Show

asSnapshot :: String -> TimeUSD -> Snapshot
asSnapshot sym t = Snapshot (getTime t) (getUSD t) sym

getTime :: TimeUSD -> Double
getTime t = time (t :: TimeUSD)

getUSD :: TimeUSD -> Double
getUSD u = usd (u :: TimeUSD)
