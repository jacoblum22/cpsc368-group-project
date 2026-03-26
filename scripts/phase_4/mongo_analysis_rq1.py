import pymongo
import matplotlib.pyplot as plt

from load_mongodb import db



#Aggregation Pipeline median CCU price tier and genre
pipeline = [
    #stage 1: Create price tiers through addFields oeprator
    {
    "$addFields": {
        "price_tier": {
            "$switch": {
                "branches": [
                    #free tier
                    {
                        "case": {"$eq": ["$price_usd", 0]},
                        "then": "free"
                    },
                    #low tier 
                    {
                        "case": {
                            "$and": [
                                {"$gt": ["$price_usd", 0]},
                                {"$lte": ["$price_usd", 9.99]}
                            ]
                            },
                        "then": "low_price"
                    },
                    #medium tier
                    {
                        "case": {
                            "$and": [
                                {"$gte": ["$price_usd", 10.00]},
                                {"$lte": ["$price_usd", 29.99]}
                            ]
                            },
                        "then": "medium_price"
                    },
                    #high tier
                    {
                        "case": {
                            "$and": [
                                {"$gte": ["$price_usd", 30.00]}
                            ]
                            },
                        "then": "high_price"
                    }
                ]
            }
        }
        }
    }, 
    #stage 2: assign price tier to each document via match operator 
    {"$match": {"price_tier": {"$exists": True}}},
    #stage 3: group by price tier and genre
    {
        "$group": {
            "_id": {"genre": "$genre", "price_tier": "$price_tier"},
            "median_ccu": {
                "$median": {"input" : "$player_stats.ccu", "method": "approximate" }
            }, 
            "median_playtime": {
                "$median": {"input" : "$player_stats.avg_playtime_min", "method": "approximate" }
            }
        }
    }, 
    
]

results = list(db.aggregate(pipeline))
for doc in results:
    print(doc)