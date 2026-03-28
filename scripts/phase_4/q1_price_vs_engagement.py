import altair as alt
import pandas as pd
import matplotlib.pyplot as plt

from mongo_config import init_mongo_client

db = init_mongo_client()

# Shared stage: bin price_usd into 4 tiers
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

# Pipeline 1: Median CCU by price tier and genre
ccu_pipeline = [
    price_tier_stage,
    {"$match": {"price_tier": {"$exists": True}}},
    {"$sort": {"genre": 1, "price_tier": 1, "player_stats.ccu": 1}},  # sort for median
    {
        "$group": {
            "_id": {"genre": "$genre", "price_tier": "$price_tier"},
            "ccu_values": {"$push": "$player_stats.ccu"},
            "count": {"$sum": 1},
        }
    },
    {"$match": {"count": {"$gte": 10}}},  # exclude small groups
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
    {"$sort": {"_id.genre": 1, "_id.price_tier": 1}},
]

# Pipeline 2: Median playtime by price tier and genre
playtime_pipeline = [
    price_tier_stage,
    {"$match": {"price_tier": {"$exists": True}}},
    {"$sort": {"genre": 1, "price_tier": 1, "player_stats.avg_playtime_min": 1}},  # sort for median
    {
        "$group": {
            "_id": {"genre": "$genre", "price_tier": "$price_tier"},
            "playtime_values": {"$push": "$player_stats.avg_playtime_min"},
            "count": {"$sum": 1},
        }
    },
    {"$match": {"count": {"$gte": 10}}},
    {
        "$project": {
            "median_playtime": {
                "$arrayElemAt": [
                    "$playtime_values",
                    {"$floor": {"$divide": [{"$size": "$playtime_values"}, 2]}},
                ]
            },
            "count": 1,
        }
    },
    {"$sort": {"_id.genre": 1, "_id.price_tier": 1}},
]


# run pipe and turn them into DF
def get_q1_df(db):
    ccu_results = list(db.aggregate(ccu_pipeline))
    playtime_results = list(db.aggregate(playtime_pipeline))

    ccu_data = {}
    for doc in ccu_results:
        key = (doc["_id"]["genre"], doc["_id"]["price_tier"])
        ccu_data[key] = {
            "genre": doc["_id"]["genre"],
            "price_tier": doc["_id"]["price_tier"],
            "median_ccu": doc["median_ccu"],
            "game_count": doc["count"],
        }

    for doc in playtime_results:
        key = (doc["_id"]["genre"], doc["_id"]["price_tier"])
        if key in ccu_data:
            ccu_data[key]["median_playtime"] = doc["median_playtime"]

    rows = list(ccu_data.values())
    df = pd.DataFrame(rows)
    return df


# make all the Q1 plots from the df
def make_q1_plots(df):
    tier_order = ["Free", "Low ($0.01-$9.99)", "Mid ($10-$29.99)", "High ($30+)"]
    tiers_present = [t for t in tier_order if t in df["price_tier"].unique()]

    # One bar chart per price tier: Median CCU by genre
    fig, axes = plt.subplots(2, 2, figsize=(16, 10))
    for idx, tier in enumerate(tiers_present):
        ax = axes[idx // 2][idx % 2]
        tier_data = df[df["price_tier"] == tier].sort_values("genre")
        ax.bar(tier_data["genre"], tier_data["median_ccu"])
        ax.set_xticks(range(len(tier_data["genre"])))
        ax.set_xticklabels(tier_data["genre"], rotation=35, ha="right")
        ax.set_ylabel("Median CCU")
        ax.set_title(tier)
    fig.suptitle("Q1: Median CCU by Genre per Price Tier")
    plt.tight_layout()
    plt.savefig("../../figures/phase_4/q1_price_vs_engagement.png")
    plt.close()

    # Q1b — Median playtime by price tier
    playtimes = []
    for tier in tiers_present:
        tier_data = df[df["price_tier"] == tier]
        weighted = (tier_data["median_playtime"] * tier_data["game_count"]).sum()
        playtimes.append(weighted / tier_data["game_count"].sum())

    plt.figure(figsize=(8, 5))
    plt.bar(tiers_present, playtimes)
    plt.ylabel("Weighted Median Avg Playtime (minutes)")
    plt.title("Q1b: Average Playtime by Price Tier")
    plt.tight_layout()
    plt.savefig("../../figures/phase_4/q1b_playtime_by_tier.png")
    plt.close()

    # Altair heatmaps (alternative visualization)
    heatmap_ccu = (
        alt.Chart(df)
        .mark_rect()
        .encode(
            x=alt.X("price_tier:N", sort=tier_order, title="Price Tier"),
            y=alt.Y("genre:N", title="Genre"),
            color=alt.Color(
                "median_ccu:Q",
                title="Median CCU",
                scale=alt.Scale(scheme="orangered"),
            ),
            tooltip=["genre", "price_tier", "median_ccu", "game_count"],
        )
        .properties(
            title="Q1: Median CCU by Price Tier & Genre (MongoDB)",
            width=350,
            height=300,
        )
    )

    text_ccu = heatmap_ccu.mark_text(fontSize=11).encode(
        text=alt.Text("median_ccu:Q", format=".0f"), color=alt.value("black")
    )

    chart_ccu = heatmap_ccu + text_ccu

    heatmap_pt = (
        alt.Chart(df)
        .mark_rect()
        .encode(
            x=alt.X("price_tier:N", sort=tier_order, title="Price Tier"),
            y=alt.Y("genre:N", title="Genre"),
            color=alt.Color(
                "median_playtime:Q",
                title="Median Playtime (min)",
                scale=alt.Scale(scheme="tealblues"),
            ),
            tooltip=["genre", "price_tier", "median_playtime", "game_count"],
        )
        .properties(
            title="Q1: Median Playtime by Price Tier & Genre (MongoDB)",
            width=350,
            height=300,
        )
    )

    text_pt = heatmap_pt.mark_text(fontSize=11).encode(
        text=alt.Text("median_playtime:Q", format=".0f"),
        color=alt.value("black"),
    )

    chart_pt = heatmap_pt + text_pt

    combined = alt.hconcat(chart_ccu, chart_pt).resolve_scale(color="independent")
    combined.save("../../figures/phase_4/q1_heatmaps.png")


def main():
    df = get_q1_df(db)
    make_q1_plots(df)


if __name__ == "__main__":
    main()
