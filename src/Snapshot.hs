{-# LANGUAGE DuplicateRecordFields #-}
{- |
Module          : Snapshot
Description     : Records of Stock/FOREX price at given time

Author          : Forest Gafford

Basic types for dealing with stock/FOREX prices at a given date.
-}
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


{- Duplicate field name boilerplate -}
getTime :: TimeUSD -> Double
getTime t = time (t :: TimeUSD)

getUSD :: TimeUSD -> Double
getUSD u = usd (u :: TimeUSD)
