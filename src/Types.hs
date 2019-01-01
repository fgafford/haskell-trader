module Types where

data Snapshot = 
    Snapshot { time:: Float
             , usd:: Float
             , sign:: String
             } deriving Show

