import altair as alt

from mongo_config import init_mongo_client

db = init_mongo_client()


# Aggregation Pipeline: average critic and user score by genre and price tier
pipeline = [
    # stage 1: Create price tiers through addFields oeprator
    {
        "$addFields": {
            "price_tier": {
                "$switch": {
                    "branches": [
                        # free tier
                        {"case": {"$eq": ["$price_usd", 0]}, "then": "free"},
                        # low tier
                        {
                            "case": {
                                "$and": [
                                    {"$gt": ["$price_usd", 0]},
                                    {"$lte": ["$price_usd", 9.99]},
                                ]
                            },
                            "then": "low_price",
                        },
                        # medium tier
                        {
                            "case": {
                                "$and": [
                                    {"$gte": ["$price_usd", 10.00]},
                                    {"$lte": ["$price_usd", 29.99]},
                                ]
                            },
                            "then": "medium_price",
                        },
                        # high tier
                        {
                            "case": {"$and": [{"$gte": ["$price_usd", 30.00]}]},
                            "then": "high_price",
                        },
                    ]
                }
            }
        }
    },
    # stage 2: assign price tier to each document via match operator
    {"$match": {"price_tier": {"$exists": True}}},
    # stage 3: group by critic score and user score
    {
        "$group": {
            "_id": {"genre": "$genre", "price_tier": "$price_tier"},
            "avg_critic_score": {"$avg": "$review_summary.metascore"},
            "avg_user_score": {"$avg": "$review_summary.user_score"},
            "count": {"$sum": 1},
        }
    },
    # stage 4: project the required fields for our visualization
    {
        "$project": {
            "_id": 0,
            "genre": "$_id.genre",
            "price_tier": "$_id.price_tier",
            "avg_critic_score": 1,
            "avg_user_score": 1,
            "count": 1,
        }
    },
]

results = list(db.aggregate(pipeline))
for doc in results:
    print(doc)
