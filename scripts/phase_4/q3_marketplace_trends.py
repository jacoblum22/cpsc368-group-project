import altair as alt
import pandas as pd 
from mongo_config import init_mongo_client

db = init_mongo_client()

pipeline = [
    #stage 1: group games by release year and compute count for each year
    #also prepare arrays for median extraction (price, ccu, pct of free games, etc.)
    {"$group": {
        "_id": "release_year", 
        "game_count": {"$sum": 1}, 
        "price_array": {"$push": "$price_usd"},
        "free_binary_array": {"$push": "$is_free"},
        "ccu_array": {"$push": "$player_stats.ccu"}, 
        "ccu_at_1yr_array": {"$push": "$player_stats.ccu_at_1yr"}, 
        "peak_ccu_array": {"$push": "$player_stats.ccu_peak"},
    }
}, 
    #stage 2: compute median for each array
]