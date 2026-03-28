import sys
from pathlib import Path
import pymongo

# Add project root to path so config.py is importable from any working directory
sys.path.insert(0, str(Path(__file__).resolve().parents[2]))
from config import MONGO_CWL, MONGO_SNUM

collection = "games"

def init_mongo_client(CWL: str = MONGO_CWL, SNUM: str = MONGO_SNUM):
    connection_string = f"mongodb://{CWL}:a{SNUM}@localhost:27017/{CWL}"
    client = pymongo.MongoClient(connection_string)
    return client[CWL][collection]
