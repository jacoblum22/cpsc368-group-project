from pathlib import Path
import pymongo

# UPDATE THESE before running:
MONGO_CWL = "tchan26"    # your UBC CWL
MONGO_SNUM = "72432586"  # your UBC student number

collection = "games"


def init_mongo_client(CWL: str = MONGO_CWL, SNUM: str = MONGO_SNUM):
    connection_string = f"mongodb://{CWL}:a{SNUM}@localhost:27017/{CWL}"
    client = pymongo.MongoClient(connection_string)
    return client[CWL][collection]
