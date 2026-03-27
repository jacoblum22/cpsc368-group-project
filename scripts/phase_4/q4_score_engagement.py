from mongo_config import init_mongo_client
import matplotlib.pyplot as plt

db = init_mongo_client()

# Pipeline 1: Group by metascore bin
meta_pipeline = [
    {
        "$match": {
            "player_stats.ccu_at_1yr": {"$ne": None, "$gt": 0},
            "review_summary.metascore": {"$ne": None},
            "review_summary.user_score": {"$ne": None},
        }
    },
    {
        "$addFields": {
            "metascore_10": {
                "$round": [{"$divide": ["$review_summary.metascore", 10]}, 1]
            },
        }
    },
    {
        "$addFields": {
            "meta_bin": {
                "$multiply": [{"$floor": {"$divide": ["$metascore_10", 0.5]}}, 0.5]
            },
        }
    },
    {"$sort": {"meta_bin": 1, "player_stats.ccu_at_1yr": 1}},
    {
        "$group": {
            "_id": "$meta_bin",
            "ccu_values": {"$push": "$player_stats.ccu_at_1yr"},
            "count": {"$sum": 1},
        }
    },
    {"$sort": {"_id": 1}},
    {
        "$project": {
            "median_ccu": {
                "$arrayElemAt": [
                    "$ccu_values",
                    {"$floor": {"$divide": [{"$size": "$ccu_values"}, 2]}},
                ]
            },
            "count": 1,
        }
    },
    {"$match": {"count": {"$gte": 5}}},
]

# Pipeline 2: Group by user score bin
user_pipeline = [
    {
        "$match": {
            "player_stats.ccu_at_1yr": {"$ne": None, "$gt": 0},
            "review_summary.metascore": {"$ne": None},
            "review_summary.user_score": {"$ne": None},
        }
    },
    {
        "$addFields": {
            "user_score_10": {
                "$round": [{"$divide": ["$review_summary.user_score", 10]}, 1]
            },
        }
    },
    {
        "$addFields": {
            "user_bin": {
                "$multiply": [{"$floor": {"$divide": ["$user_score_10", 0.5]}}, 0.5]
            },
        }
    },
    {"$sort": {"user_bin": 1, "player_stats.ccu_at_1yr": 1}},
    {
        "$group": {
            "_id": "$user_bin",
            "ccu_values": {"$push": "$player_stats.ccu_at_1yr"},
            "count": {"$sum": 1},
        }
    },
    {"$sort": {"_id": 1}},
    {
        "$project": {
            "median_ccu": {
                "$arrayElemAt": [
                    "$ccu_values",
                    {"$floor": {"$divide": [{"$size": "$ccu_values"}, 2]}},
                ]
            },
            "count": 1,
        }
    },
    {"$match": {"count": {"$gte": 5}}},
]

meta_results = list(db.aggregate(meta_pipeline))
user_results = list(db.aggregate(user_pipeline))

meta_bins = []
meta_ccus = []
for doc in meta_results:
    meta_bins.append(doc["_id"])
    meta_ccus.append(doc["median_ccu"])

user_bins = []
user_ccus = []
for doc in user_results:
    user_bins.append(doc["_id"])
    user_ccus.append(doc["median_ccu"])

plt.plot(meta_bins, meta_ccus, label="Metascore")
plt.plot(user_bins, user_ccus, label="User Score")
plt.yscale("log")
plt.xlabel("Score")
plt.ylabel("Median CCU")
plt.title("Q4: Score vs. Engagement")
plt.legend()
plt.savefig("../../figures/phase_4/q4_score_engagement.png")
