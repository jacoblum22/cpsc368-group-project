import pymongo
import pandas as pd
import numpy as np
import json
from pathlib import Path

from mongo_config import init_mongo_client

DATA_DIR = Path(__file__).resolve().parents[2] / "data" / "clean"

# Initialize MongoDB client
db = init_mongo_client()
db.drop()  # Clear existing data in the database

# read datasets
games_df = pd.read_csv(DATA_DIR / "games.csv")
player_stats_df = pd.read_csv(DATA_DIR / "player_stats.csv")
reviews_df = pd.read_csv(DATA_DIR / "reviews.csv")

# merge with app_id
merged_df = games_df.merge(player_stats_df, on="app_id", how="left").merge(
    reviews_df, on="app_id", how="left"
)

# merged_df.to_csv('merged.csv')

# Build one document per game
documents = []

for idx, row in merged_df.iterrows():
    doc = {
        "app_id": int(row["app_id"]),
        "name": row["name"],
        "genre": row["genre"],
        "price_usd": float(row["price_usd"]) if not pd.isna(row["price_usd"]) else None,
        "is_free": int(row["is_free"]) if not pd.isna(row["is_free"]) else None,
        "release_year": (
            int(row["release_year"]) if not pd.isna(row["release_year"]) else None
        ),
        "player_stats": {  # embedded engagement data
            "ccu": int(row["ccu"]) if not pd.isna(row["ccu"]) else None,
            "ccu_peak": int(row["ccu_peak"]) if not pd.isna(row["ccu_peak"]) else None,
            "owners": row["owners"],
            "avg_playtime_min": (
                float(row["avg_playtime_min"])
                if not pd.isna(row["avg_playtime_min"])
                else None
            ),
            "ccu_at_1yr": (
                int(row["ccu_at_1yr"]) if not pd.isna(row["ccu_at_1yr"]) else None
            ),
        },
        "review_summary": {  # embedded review scores
            "metascore": (
                float(row["metascore"]) if not pd.isna(row["metascore"]) else None
            ),
            "user_score": (
                int(row["user_score"]) if not pd.isna(row["user_score"]) else None
            ),
        },
    }
    documents.append(doc)

# Bulk insert all documents
if documents:
    db.insert_many(documents)
    print(f"Inserted {len(documents)} documents into the database.")
