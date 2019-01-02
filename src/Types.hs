module Types where

data TimeUSD = TimeUSD { tm:: Double
                       , us:: Double
                       } deriving Show

data Snapshot = 
    Snapshot { time:: Double
             , usd:: Double
             , sign:: String
             } deriving Show

data Snapshots = Snapshots [TimeUSD] deriving Show

asSnapshot :: String -> TimeUSD -> Snapshot
asSnapshot sym t = Snapshot (tm t) (us t) sym