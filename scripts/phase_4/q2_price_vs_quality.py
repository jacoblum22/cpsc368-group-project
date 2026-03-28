from pathlib import Path
import altair as alt
import pandas as pd
from mongo_config import init_mongo_client

FIGURES_DIR = Path(__file__).resolve().parents[2] / "figures" / "phase_4"
db = init_mongo_client()

# Shared stage: assign price tiers (matching Q1 / Oracle labels)
price_tier_stage = {
    "$addFields": {
        "price_tier": {
            "$switch": {
                "branches": [
                    {"case": {"$eq": ["$price_usd", 0]}, "then": "Free"},
                    {
                        "case": {
                            "$and": [
                                {"$gt": ["$price_usd", 0]},
                                {"$lte": ["$price_usd", 9.99]},
                            ]
                        },
                        "then": "Low ($0.01-$9.99)",
                    },
                    {
                        "case": {
                            "$and": [
                                {"$gte": ["$price_usd", 10.00]},
                                {"$lte": ["$price_usd", 29.99]},
                            ]
                        },
                        "then": "Mid ($10-$29.99)",
                    },
                    {"case": {"$gte": ["$price_usd", 30.00]}, "then": "High ($30+)"},
                ]
            }
        }
    }
}

# Pipeline 1: Median critic score (metascore) by genre and price tier
critic_pipeline = [
    price_tier_stage,
    {"$match": {"price_tier": {"$exists": True}}},
    # Sort by metascore so $push produces a sorted array
    {"$sort": {"genre": 1, "price_tier": 1, "review_summary.metascore": 1}},
    {
        "$group": {
            "_id": {"genre": "$genre", "price_tier": "$price_tier"},
            "metascore_values": {"$push": "$review_summary.metascore"},
            "count": {"$sum": 1},
        }
    },
    {"$match": {"count": {"$gte": 10}}},
    {
        "$project": {
            "_id": 0,
            "genre": "$_id.genre",
            "price_tier": "$_id.price_tier",
            "median_critic_score": {
                "$arrayElemAt": [
                    "$metascore_values",
                    {"$floor": {"$divide": [{"$size": "$metascore_values"}, 2]}},
                ]
            },
            "count": 1,
        }
    },
]

# Pipeline 2: Median user score (scaled to 0-10) by genre and price tier
user_pipeline = [
    price_tier_stage,
    {"$match": {"price_tier": {"$exists": True}}},
    # Sort by user_score so $push produces a sorted array
    {"$sort": {"genre": 1, "price_tier": 1, "review_summary.user_score": 1}},
    {
        "$group": {
            "_id": {"genre": "$genre", "price_tier": "$price_tier"},
            "user_score_values": {"$push": "$review_summary.user_score"},
            "count": {"$sum": 1},
        }
    },
    {"$match": {"count": {"$gte": 10}}},
    {
        "$project": {
            "_id": 0,
            "genre": "$_id.genre",
            "price_tier": "$_id.price_tier",
            "median_user_score": {
                "$divide": [
                    {
                        "$arrayElemAt": [
                            "$user_score_values",
                            {
                                "$floor": {
                                    "$divide": [{"$size": "$user_score_values"}, 2]
                                }
                            },
                        ]
                    },
                    10,
                ]
            },
            "count": 1,
        }
    },
]

critic_results = list(db.aggregate(critic_pipeline))
user_results = list(db.aggregate(user_pipeline))

# Map results to dictionaries
critic_scores = {}
for doc in critic_results:
    critic_scores.setdefault(doc["genre"], {})[doc["price_tier"]] = doc[
        "median_critic_score"
    ]

user_scores = {}
for doc in user_results:
    user_scores.setdefault(doc["genre"], {})[doc["price_tier"]] = doc[
        "median_user_score"
    ]

# Convert dictionaries to dataframes for visualization
critic_df = (
    pd.DataFrame.from_dict(critic_scores, orient="index")
    .fillna(0)
    .reset_index()
    .melt(id_vars="index", var_name="price_tier", value_name="median_critic_score")
    .rename(columns={"index": "genre"})
)
user_df = (
    pd.DataFrame.from_dict(user_scores, orient="index")
    .fillna(0)
    .reset_index()
    .melt(id_vars="index", var_name="price_tier", value_name="median_user_score")
    .rename(columns={"index": "genre"})
)

tier_order = [
    "Free",
    "Low ($0.01-$9.99)",
    "Mid ($10-$29.99)",
    "High ($30+)",
]

# Heatmap 1: Critic Scores Heatmap
heatmap_critic = (
    alt.Chart(critic_df)
    .mark_rect()
    .encode(
        x=alt.X("price_tier:N", title="Price Tier", sort=tier_order),
        y=alt.Y("genre:N", title="Genre"),
        color=alt.Color(
            "median_critic_score:Q",
            title="Median Critic Score",
            scale=alt.Scale(scheme="viridis"),
        ),
        tooltip=[
            "genre",
            "price_tier",
            alt.Tooltip("median_critic_score:Q", format=".2f"),
        ],
    )
    .properties(
        title="Median Critic Score by Genre and Price Tier", width=350, height=300
    )
)

# Heatmap 2: User Scores Heatmap (scaled to 0-10)
heatmap_user = (
    alt.Chart(user_df)
    .mark_rect()
    .encode(
        x=alt.X("price_tier:N", title="Price Tier", sort=tier_order),
        y=alt.Y("genre:N", title="Genre"),
        color=alt.Color(
            "median_user_score:Q",
            title="Median User Score (0-10)",
            scale=alt.Scale(scheme="viridis"),
        ),
        tooltip=[
            "genre",
            "price_tier",
            alt.Tooltip("median_user_score:Q", format=".2f"),
        ],
    )
    .properties(
        title="Median User Score by Genre and Price Tier", width=350, height=300
    )
)

combined = alt.hconcat(heatmap_critic, heatmap_user).resolve_scale(color="independent")

combined.save(str(FIGURES_DIR / "q2_price_vs_quality.png"))
