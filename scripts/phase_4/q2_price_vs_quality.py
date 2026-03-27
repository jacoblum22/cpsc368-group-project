import altair as alt
import pandas as pd 
from mongo_config import init_mongo_client

db = init_mongo_client()


# Aggregation Pipeline: median critic and user score by genre and price tier
pipeline = [
    # stage 1: Create price tiers through addFields oeprator
    {
        "$addFields": {
            "price_tier": {
                "$switch": {
                    "branches": [
                        # free tier
                        {"case": {"$eq": ["$price_usd", 0]}, "then": "Free"},
                        # low tier
                        {
                            "case": {
                                "$and": [
                                    {"$gt": ["$price_usd", 0]},
                                    {"$lte": ["$price_usd", 9.99]},
                                ]
                            },
                            "then": "Low Price ($0.01-$9.99)",
                        },
                        # medium tier
                        {
                            "case": {
                                "$and": [
                                    {"$gte": ["$price_usd", 10.00]},
                                    {"$lte": ["$price_usd", 29.99]},
                                ]
                            },
                            "then": "Medium Price ($10.00-$29.99)",
                        },
                        # high tier
                        {
                            "case": {"$and": [{"$gte": ["$price_usd", 30.00]}]},
                            "then": "High Price ($30+)",
                        },
                    ]
                }
            }
        }
    },
    # stage 2: assign price tier to each document via match operator
    {"$match": {"price_tier": {"$exists": True}}},
    # stage 3: sort the scores by order and extract median by dividing by 2
    {
        "$facet": {
            "critic_stats": [
                {
                    "$sort": {
                        "genre": 1,
                        "price_tier": 1,
                        "review_summary.metascore": 1
                    }
                },
                {
                    "$group": {
                        "_id": {
                            "genre": "$genre",
                            "price_tier": "$price_tier"
                        },
                        "critic_scores": {"$push": "$review_summary.metascore"},
                        "count": {"$sum": 1}
                    }
                },
                {
                    "$project": {
                        "_id": 1,
                        "count": 1,
                        "median_critic_score": {
                            "$arrayElemAt": [
                                "$critic_scores",
                                {
                                    "$floor": {
                                        "$divide": [
                                            {"$size": "$critic_scores"},
                                            2
                                        ]
                                    }
                                }
                            ]
                        }
                    }
                }
            ],
            "user_stats": [
                {
                    "$sort": {
                        "genre": 1,
                        "price_tier": 1,
                        "review_summary.user_score": 1
                    }
                },
                {
                    "$group": {
                        "_id": {
                            "genre": "$genre",
                            "price_tier": "$price_tier"
                        },
                        "user_scores": {"$push": "$review_summary.user_score"}
                    }
                },
                {
                    "$project": {
                        "_id": 1,
                        "median_user_score": {
                            "$arrayElemAt": [
                                "$user_scores",
                                {
                                    "$floor": {
                                        "$divide": [
                                            {"$size": "$user_scores"},
                                            2
                                        ]
                                    }
                                }
                            ]
                        }
                    }
                }
            ]
        }
    }
]

results = list(db.aggregate(pipeline))[0]

#Map results to their respective dictionaries
critic_results = results["critic_stats"]
user_results = results["user_stats"]

critic_scores = {}
user_scores = {}

for doc in critic_results:
    genre = doc["_id"]["genre"]
    price_tier = doc["_id"]["price_tier"]
    median_critic_score = doc["median_critic_score"]
    if genre not in critic_scores:
        critic_scores[genre] = {}
    
    critic_scores[genre][price_tier] = median_critic_score

for doc in user_results:
    genre = doc["_id"]["genre"]
    price_tier = doc["_id"]["price_tier"]
    median_user_score = doc["median_user_score"]

    if genre not in user_scores:
        user_scores[genre] = {}

    user_scores[genre][price_tier] = median_user_score


#Convert dictionaries to dataframes for visualization
critic_df = pd.DataFrame.from_dict(critic_scores, orient="index").fillna(0).reset_index().melt(
    id_vars="index", var_name="price_tier", value_name="median_critic_score"
    ).rename(columns={"index": "genre"})
user_df = pd.DataFrame.from_dict(user_scores, orient="index").fillna(0).reset_index().melt(
    id_vars="index", var_name="price_tier", value_name="median_user_score"
).rename(columns={"index": "genre"})

tier_order = [
    "Free",
    "Low Price ($0.01-$9.99)",
    "Medium Price ($10.00-$29.99)",
    "High Price ($30+)",
]

#Heatmap 1: Critic Scores Heatmap 
heatmap_critic = alt.Chart(critic_df).mark_rect().encode(
    x=alt.X("price_tier:N", title="Price Tier", sort=tier_order),
    y=alt.Y("genre:N", title="Genre"),
    color=alt.Color("median_critic_score:Q", title="Median Critic Score", scale=alt.Scale(scheme="viridis")),
    tooltip=["genre", "price_tier", alt.Tooltip("median_critic_score:Q", format=".2f")],
).properties(title="Median Critic Score by Genre and Price Tier", width=350, height=300)

#Heatmap 2: User Scores Heatmap
heatmap_user = alt.Chart(user_df).mark_rect().encode(
    x=alt.X("price_tier:N", title="Price Tier", sort=tier_order),
    y=alt.Y("genre:N", title="Genre"),
    color=alt.Color("median_user_score:Q", title="Median User Score", scale=alt.Scale(scheme="viridis")),
    tooltip=["genre", "price_tier", alt.Tooltip("median_user_score:Q", format=".2f")],
).properties(title="Median User Score by Genre and Price Tier", width=350, height=300)

combined = alt.hconcat(heatmap_critic, heatmap_user).resolve_scale(color="independent")

combined.save("figures/phase_4/q2_price_vs_quality.png")
