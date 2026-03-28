import pymongo
import pandas as pd
import altair as alt

from load_mongodb import db



#Aggregation Pipeline median CCU price tier and genre
pipeline = [
    #stage 1: Create price tiers
    {
        "$addFields": {
            "price_tier": {
                "$switch": {
                    "branches": [
                        {"case": {"$eq": ["$price_usd", 0]}, "then": "Free"},
                        {
                            "case": {"$and": [
                                {"$gt": ["$price_usd", 0]},
                                {"$lte": ["$price_usd", 9.99]}
                            ]},
                            "then": "Low ($0.01-$9.99)"
                        },
                        {
                            "case": {"$and": [
                                {"$gte": ["$price_usd", 10.00]},
                                {"$lte": ["$price_usd", 29.99]}
                            ]},
                            "then": "Mid ($10-$29.99)"
                        },
                        {
                            "case": {"$gte": ["$price_usd", 30.00]},
                            "then": "High ($30+)"
                        }
                    ]
                }
            }
        }
    },
    #stage 2: filter to docs that got a price tier
    {"$match": {"price_tier": {"$exists": True}}},
    #stage 3: sort by group keys then ccu (so $push collects in order)
    {"$sort": {"genre": 1, "price_tier": 1, "player_stats.ccu": 1}},
    #stage 4: group by price tier and genre, push sorted values
    {
        "$group": {
            "_id": {"genre": "$genre", "price_tier": "$price_tier"},
            "ccu_values": {"$push": "$player_stats.ccu"},
            "playtime_values": {"$push": "$player_stats.avg_playtime_min"},
            "mean_ccu": {"$avg": "$player_stats.ccu"},
            "game_count": {"$sum": 1}
        }
    },
    #stage 5: filter groups with fewer than 10 games
    {"$match": {"game_count": {"$gte": 10}}},
    #stage 6: extract median (middle element of sorted array)
    {
        "$project": {
            "median_ccu": {
                "$arrayElemAt": [
                    "$ccu_values",
                    {"$floor": {"$divide": [{"$size": "$ccu_values"}, 2]}}
                ]
            },
            "median_playtime": {
                "$arrayElemAt": [
                    "$playtime_values",
                    {"$floor": {"$divide": [{"$size": "$playtime_values"}, 2]}}
                ]
            },
            "mean_ccu": 1,
            "game_count": 1
        }
    },
    #stage 7: sort output
    {"$sort": {"_id.genre": 1, "_id.price_tier": 1}},
]

results = list(db.aggregate(pipeline))

results = list(db.aggregate(pipeline))

rows = []
for doc in results:
    rows.append({
        "genre": doc["_id"]["genre"],
        "price_tier": doc["_id"]["price_tier"],
        "median_ccu": doc["median_ccu"],
        "median_playtime": doc["median_playtime"],
        "mean_ccu": round(doc["mean_ccu"], 1),
        "game_count": doc["game_count"]
    })

df = pd.DataFrame(rows)


tier_order = ["Free", "Low ($0.01-$9.99)", "Mid ($10-$29.99)", "High ($30+)"]

# Heatmap 1: Median CCU
heatmap_ccu = alt.Chart(df).mark_rect().encode(
    x=alt.X("price_tier:N", sort=tier_order, title="Price Tier"),
    y=alt.Y("genre:N", title="Genre"),
    color=alt.Color("median_ccu:Q", title="Median CCU", scale=alt.Scale(scheme="orangered")),
    tooltip=["genre", "price_tier", "median_ccu", "game_count"]
).properties(
    title="Q1: Median CCU by Price Tier & Genre (MongoDB)",
    width=350, height=300
)

text_ccu = heatmap_ccu.mark_text(fontSize=11).encode(
    text=alt.Text("median_ccu:Q", format=".0f"),
    color=alt.value("black")
)

chart_ccu = heatmap_ccu + text_ccu

# Heatmap 2: Median Playtime
heatmap_pt = alt.Chart(df).mark_rect().encode(
    x=alt.X("price_tier:N", sort=tier_order, title="Price Tier"),
    y=alt.Y("genre:N", title="Genre"),
    color=alt.Color("median_playtime:Q", title="Median Playtime (min)", scale=alt.Scale(scheme="tealblues")),
    tooltip=["genre", "price_tier", "median_playtime", "game_count"]
).properties(
    title="Q1: Median Playtime by Price Tier & Genre (MongoDB)",
    width=350, height=300
)

text_pt = heatmap_pt.mark_text(fontSize=11).encode(
    text=alt.Text("median_playtime:Q", format=".0f"),
    color=alt.value("black")
)

chart_pt = heatmap_pt + text_pt

combined = alt.hconcat(chart_ccu, chart_pt).resolve_scale(color="independent")

# Save
combined.save("figures/phase_4/q1_mongodb_heatmaps.html")
