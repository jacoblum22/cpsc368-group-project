import pymongo 
from pymongo import MongoClient

#enter your credentials before running analysis
CWL = "tchan26"
SNUM = "72432586"
collection = "games"

def init_mongo_client(CWL: str = CWL, SNUM: str = SNUM) -> None: 
    connection_string = f"mongodb://{CWL}:a{SNUM}@localhost:27017/{CWL}"
    client = pymongo.MongoClient(connection_string)
    return client[CWL][collection]
