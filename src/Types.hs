module Types where
    
data Snapshots = Snapshots [Snapshot] deriving Show
data Snapshot = 
    Snapshot { time:: Float
             , usd:: Float
             , sign:: String
             } deriving Show
