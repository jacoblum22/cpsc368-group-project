from mongo_config import init_mongo_client
import matplotlib.pyplot as plt

db = init_mongo_client()

# Pipeline 1: median price + total games + pct free
price_pipeline = [
    {"$sort": {"release_year": 1, "price_usd": 1}},
    {
        "$group": {
            "_id": "$release_year",
            "price_vals": {"$push": "$price_usd"},
            "total_games": {"$sum": 1},
            "free_count": {"$sum": "$is_free"},
        }
    },
    {"$sort": {"_id": 1}},
    {
        "$project": {
            "_id": 0,
            "release_year": "$_id",
            "total_games": 1,
            "median_price": {
                "$arrayElemAt": [
                    "$price_vals",
                    {"$floor": {"$divide": [{"$size": "$price_vals"}, 2]}},
                ]
            },
            "pct_free": {
                "$round": [
                    {"$multiply": [{"$divide": ["$free_count", "$total_games"]}, 100]},
                    1,
                ]
            },
        }
    },
]

# Pipeline 2: median current CCU
ccu_pipeline = [
    {"$sort": {"release_year": 1, "player_stats.ccu": 1}},
    {
        "$group": {
            "_id": "$release_year",
            "ccu_values": {"$push": "$player_stats.ccu"},
            "count": {"$sum": 1},
        }
    },
    {"$sort": {"_id": 1}},
    {
        "$project": {
            "_id": 0,
            "release_year": "$_id",
            "median_ccu_current": {
                "$arrayElemAt": [
                    "$ccu_values",
                    {"$floor": {"$divide": [{"$size": "$ccu_values"}, 2]}},
                ]
            },
            "count": 1,
        }
    },
]

# Pipeline 3: median CCU at 1 year (filter nulls)
ccu_1yr_pipeline = [
    {"$match": {"player_stats.ccu_at_1yr": {"$ne": None}}},
    {"$sort": {"release_year": 1, "player_stats.ccu_at_1yr": 1}},
    {
        "$group": {
            "_id": "$release_year",
            "ccu_values": {"$push": "$player_stats.ccu_at_1yr"},
            "count": {"$sum": 1},
        }
    },
    {"$sort": {"_id": 1}},
    {
        "$project": {
            "_id": 0,
            "release_year": "$_id",
            "median_ccu_at_1yr": {
                "$arrayElemAt": [
                    "$ccu_values",
                    {"$floor": {"$divide": [{"$size": "$ccu_values"}, 2]}},
                ]
            },
            "count": 1,
        }
    },
]

# Pipeline 4: median peak CCU
ccu_peak_pipeline = [
    {"$sort": {"release_year": 1, "player_stats.ccu_peak": 1}},
    {
        "$group": {
            "_id": "$release_year",
            "ccu_values": {"$push": "$player_stats.ccu_peak"},
            "count": {"$sum": 1},
        }
    },
    {"$sort": {"_id": 1}},
    {
        "$project": {
            "_id": 0,
            "release_year": "$_id",
            "median_ccu_peak": {
                "$arrayElemAt": [
                    "$ccu_values",
                    {"$floor": {"$divide": [{"$size": "$ccu_values"}, 2]}},
                ]
            },
            "count": 1,
        }
    },
]

# Run all pipelines
price_results = {r["release_year"]: r for r in db.aggregate(price_pipeline)}
ccu_results = {r["release_year"]: r for r in db.aggregate(ccu_pipeline)}
ccu_1yr_results = {r["release_year"]: r for r in db.aggregate(ccu_1yr_pipeline)}
ccu_peak_results = {r["release_year"]: r for r in db.aggregate(ccu_peak_pipeline)}

years = [2020, 2021, 2022, 2023, 2024]

# Visualization
med_prices = []
med_ccu_1yr = []
med_ccu_now = []
med_ccu_peak = []
pct_free = []
for y in years:
    med_prices.append(price_results[y]["median_price"])
    med_ccu_1yr.append(ccu_1yr_results[y]["median_ccu_at_1yr"])
    med_ccu_now.append(ccu_results[y]["median_ccu_current"])
    med_ccu_peak.append(ccu_peak_results[y]["median_ccu_peak"])
    pct_free.append(price_results[y]["pct_free"])

fig, (ax1, ax2, ax3) = plt.subplots(1, 3, figsize=(15, 5))

# Left: median price over time
ax1.plot(years, med_prices, label="Median Price (USD)")
ax1.set_xlabel("Release Year")
ax1.set_ylabel("Median Price (USD)")
ax1.set_title("Median Release Price")
ax1.set_xticks(years)
ax1.legend()

# Middle: median CCU metrics over time
ax2.plot(years, med_ccu_1yr, label="CCU at 1 Year")
ax2.plot(years, med_ccu_now, label="CCU Current")
ax2.plot(years, med_ccu_peak, label="CCU Peak")
ax2.set_yscale("log")
ax2.set_xlabel("Release Year")
ax2.set_ylabel("Median CCU")
ax2.set_title("Median Player Engagement")
ax2.set_xticks(years)
ax2.legend()

# Right: % free-to-play over time
ax3.bar(years, pct_free)
ax3.set_xlabel("Release Year")
ax3.set_ylabel("% Free-to-Play")
ax3.set_title("% Free-to-Play Games")

fig.suptitle("Q3: Year-over-Year Marketplace Trends on Steam (2020-2024)", fontsize=13)
plt.tight_layout()
plt.savefig("../../figures/phase_4/q3_marketplace_trends.png")
print("\nSaved figure to figures/phase_4/q3_marketplace_trends.png")
