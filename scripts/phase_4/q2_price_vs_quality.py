import altair as alt
import pandas as pd 
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

#Map results to their respective dictionaries
critic_scores = {}
user_scores = {}

for doc in results:
    genre = doc["genre"]
    price_tier = doc["price_tier"]
    avg_critic_score = doc["avg_critic_score"]
    avg_user_score = doc["avg_user_score"]

    if genre not in critic_scores:
        critic_scores[genre] = {}
    if genre not in user_scores:
        user_scores[genre] = {}

    critic_scores[genre][price_tier] = avg_critic_score
    user_scores[genre][price_tier] = avg_user_score

#Convert dictionaries to dataframes for visualization
critic_df = pd.DataFrame.from_dict(critic_scores, orient="index").fillna(0).reset_index().melt(
    id_vars="index", var_name="price_tier", value_name="avg_critic_score"
    ).rename(columns={"index": "genre"})
user_df = pd.DataFrame.from_dict(user_scores, orient="index").fillna(0).reset_index().melt(
    id_vars="index", var_name="price_tier", value_name="avg_user_score"
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
    color=alt.Color("avg_critic_score:Q", title="Average Critic Score", scale=alt.Scale(scheme="viridis")),
    tooltip=["genre", "price_tier", alt.Tooltip("avg_critic_score:Q", format=".2f")],
).properties(title="Average Critic Score by Genre and Price Tier", width=350, height=300)

#Heatmap 2: User Scores Heatmap
heatmap_user = alt.Chart(user_df).mark_rect().encode(
    x=alt.X("price_tier:N", title="Price Tier", sort=tier_order),
    y=alt.Y("genre:N", title="Genre"),
    color=alt.Color("avg_user_score:Q", title="Average User Score", scale=alt.Scale(scheme="viridis")),
    tooltip=["genre", "price_tier", alt.Tooltip("avg_user_score:Q", format=".2f")],
).properties(title="Average User Score by Genre and Price Tier", width=350, height=300)

combined = alt.hconcat(heatmap_critic, heatmap_user).resolve_scale(color="independent")

combined.save("figures/phase_4/q2_price_vs_quality.png")
