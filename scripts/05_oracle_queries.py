"""
Oracle connection, SQL queries, and visualizations for the four research questions.

Research Questions:
  Q1 — Price vs Engagement: How does price tier relate to concurrent players and playtime by genre?
  Q2 — Price vs Perceived Quality: How do critic and user scores compare across price tiers and genres?
  Q3 — Marketplace Trends 2020-2024: How has pricing and first-year player engagement changed year-over-year?
  Q4 — Score-to-Engagement Correlation: How strongly do critic and user scores correlate with
       player engagement (CCU today and at one year post-launch), and does this vary by price tier?

Usage:
  1. Fill in config.py with your Oracle credentials.
  2. Run: python scripts/05_oracle_queries.py
  3. Visualizations are saved to figures/

Requirements (beyond stdlib): oracledb, pandas, matplotlib
"""

import os
import oracledb
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.ticker as mticker

import sys

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
import config

FIGURES_DIR = "figures"
os.makedirs(FIGURES_DIR, exist_ok=True)

# ---------------------------------------------------------------------------
# Connect to Oracle
# Requires SSH tunnel: ssh -l <CWL> -L localhost:1522:dbhost.students.cs.ubc.ca:1522 remote.students.cs.ubc.ca
# ---------------------------------------------------------------------------
print("Connecting to Oracle ...")
dsn = oracledb.makedsn(
    config.ORACLE_HOST, config.ORACLE_PORT, service_name=config.ORACLE_SERVICE
)
conn = oracledb.connect(
    user=config.ORACLE_USERNAME,
    password=config.ORACLE_PASSWORD,
    dsn=dsn,
)
print("  Connected.")


def run_query(sql: str, label: str) -> pd.DataFrame:
    """Execute a SQL query and return a DataFrame."""
    print(f"\n[{label}]")
    print("  SQL:", sql[:120].replace("\n", " "), "...")
    cur = conn.cursor()
    cur.execute(sql)
    cols = [d[0].lower() for d in cur.description]
    rows = cur.fetchall()
    cur.close()
    df = pd.DataFrame(rows, columns=cols)
    print(f"  Rows returned: {len(df)}")
    return df


# ---------------------------------------------------------------------------
# Q1 — Price vs Engagement (by Genre)
# Compute median CCU and mean CCU for each price tier × genre combination.
# Price tier is computed in SQL using a CASE expression (no pre-computed column).
# ---------------------------------------------------------------------------

Q1_SQL = """
SELECT
    CASE
        WHEN g.price_usd = 0       THEN 'Free'
        WHEN g.price_usd < 10      THEN 'Low ($0.01-$9.99)'
        WHEN g.price_usd < 30      THEN 'Mid ($10-$29.99)'
        ELSE                            'High ($30+)'
    END AS price_tier,
    g.genre,
    MEDIAN(p.ccu)            AS median_ccu,
    AVG(p.ccu)               AS mean_ccu,
    MEDIAN(p.avg_playtime_min) AS median_playtime,
    COUNT(*)                 AS game_count
FROM games g
JOIN player_stats p ON g.app_id = p.app_id
GROUP BY
    CASE
        WHEN g.price_usd = 0  THEN 'Free'
        WHEN g.price_usd < 10 THEN 'Low ($0.01-$9.99)'
        WHEN g.price_usd < 30 THEN 'Mid ($10-$29.99)'
        ELSE                       'High ($30+)'
    END,
    g.genre
HAVING COUNT(*) >= 10
ORDER BY g.genre, price_tier
"""

q1 = run_query(Q1_SQL, "Q1 Price vs Engagement")

# Visualization: 2×2 panel layout — one subplot per price tier, showing only
# the genres that have ≥10 games in that tier. This avoids the empty-bar gaps
# that appear in a grouped chart when not all genres exist in every tier.
TIER_ORDER = ["Free", "Low ($0.01-$9.99)", "Mid ($10-$29.99)", "High ($30+)"]
TIER_COLORS = {
    "Free": "#4CAF50",
    "Low ($0.01-$9.99)": "#2196F3",
    "Mid ($10-$29.99)": "#FF9800",
    "High ($30+)": "#F44336",
}

tier_labels_present = [t for t in TIER_ORDER if t in q1["price_tier"].unique()]
genre_list_q1 = sorted(q1["genre"].unique().tolist())

fig, ax = plt.subplots(figsize=(15, 6))

bar_width_q1 = 0.18
n_tiers = len(tier_labels_present)
total_group_w = n_tiers * bar_width_q1  # width of all bars in one genre group
half_gap = (1.0 - total_group_w) / 2  # equal whitespace on each side of the group

# Alternating light-blue / white background stripes aligned exactly with each genre group.
for g_idx, _ in enumerate(genre_list_q1):
    if g_idx % 2 == 0:
        ax.axvspan(
            g_idx - half_gap,
            g_idx + total_group_w + half_gap,
            color="#BBCCE8",
            alpha=0.5,
            zorder=0,
        )

for i, tier in enumerate(tier_labels_present):
    tier_data = q1[q1["price_tier"] == tier]
    vals, counts = [], []
    for g in genre_list_q1:
        row = tier_data[tier_data["genre"] == g]
        if len(row) > 0:
            vals.append(max(float(row["median_ccu"].values[0]), 0.5))
            counts.append(int(row["game_count"].values[0]))
        else:
            vals.append(0)
            counts.append(0)
    bars = ax.bar(
        [xi + i * bar_width_q1 for xi in range(len(genre_list_q1))],
        vals,
        bar_width_q1,
        label=tier,
        color=TIER_COLORS.get(tier, "#999"),
        zorder=2,
    )
    for bar, cnt in zip(bars, counts):
        if cnt > 0:
            ax.text(
                bar.get_x() + bar.get_width() / 2,
                bar.get_height() * 1.25,
                f"n={cnt}",
                ha="center",
                va="bottom",
                fontsize=6,
                rotation=90,
                zorder=3,
            )

ax.set_yscale("log")
ax.set_xticks([xi + total_group_w / 2 for xi in range(len(genre_list_q1))])
ax.set_xticklabels(genre_list_q1, rotation=35, ha="right")
ax.set_ylabel("Median Current CCU (SteamSpy snapshot, Mar 2026, log scale)")
ax.set_title(
    "Q1: Median Current CCU by Price Tier and Genre (2020-2024, groups >=10 games)"
)
ax.legend(title="Price Tier")
ax.yaxis.set_major_formatter(mticker.FuncFormatter(lambda v, _: f"{int(v):,}"))
plt.tight_layout()
fig.savefig(f"{FIGURES_DIR}/q1_price_vs_engagement.png", dpi=150, bbox_inches="tight")
plt.close(fig)
print(f"  Saved figures/q1_price_vs_engagement.png")

# genre_list, top_genres, x, and bar_width are used by the Q2 visualization below.
genre_list = sorted(q1["genre"].unique().tolist())
top_genres = genre_list  # Q1 already filtered by HAVING >= 10 in SQL
x = range(len(genre_list))
bar_width = 0.2

# Q1b — Median Avg Playtime by Price Tier (genre-collapsed)
# Weighted median playtime per tier, computed from SQL-returned per-group medians.
q1b_agg = (
    q1.groupby("price_tier")
    .apply(
        lambda df: (df["median_playtime"] * df["game_count"]).sum()
        / df["game_count"].sum()
    )
    .reset_index(name="weighted_median_playtime")
)
tier_order_present = [t for t in TIER_ORDER if t in q1b_agg["price_tier"].values]
playtimes = [
    float(q1b_agg[q1b_agg["price_tier"] == t]["weighted_median_playtime"].values[0])
    for t in tier_order_present
]

fig, ax = plt.subplots(figsize=(8, 5))
colors = [TIER_COLORS[t] for t in tier_order_present]
bars = ax.bar(range(len(tier_order_present)), playtimes, color=colors)
for bar, val in zip(bars, playtimes):
    ax.text(
        bar.get_x() + bar.get_width() / 2,
        bar.get_height() + 5,
        f"{int(val)} min",
        ha="center",
        va="bottom",
        fontsize=10,
    )
ax.set_ylabel("Weighted Median Avg Playtime (minutes)")
ax.set_title("Q1b: Average Playtime by Price Tier (2020\u20132024)")
ax.set_xticks(range(len(tier_order_present)))
ax.set_xticklabels(tier_order_present, rotation=15, ha="right")
plt.tight_layout()
fig.savefig(f"{FIGURES_DIR}/q1b_playtime_by_tier.png", dpi=150)
plt.close(fig)
print(f"  Saved figures/q1b_playtime_by_tier.png")


# ---------------------------------------------------------------------------
# Q2 — Price vs Perceived Quality
# Compute median metascore and median user_score for each price tier × genre.
# NOTE: user_score in this dataset is stored on a 0-100 scale (Metacritic
# stores it as an integer, e.g. 84 for "8.4/10"). Divide by 10 for display.
# ---------------------------------------------------------------------------

Q2_SQL = """
SELECT
    CASE
        WHEN g.price_usd = 0       THEN 'Free'
        WHEN g.price_usd < 10      THEN 'Low ($0.01-$9.99)'
        WHEN g.price_usd < 30      THEN 'Mid ($10-$29.99)'
        ELSE                            'High ($30+)'
    END AS price_tier,
    g.genre,
    MEDIAN(s.metascore)            AS median_metascore,
    MEDIAN(s.user_score) / 10      AS median_user_score_10,
    COUNT(*)                       AS game_count
FROM games g
JOIN reviews s ON g.app_id = s.app_id
GROUP BY
    CASE
        WHEN g.price_usd = 0  THEN 'Free'
        WHEN g.price_usd < 10 THEN 'Low ($0.01-$9.99)'
        WHEN g.price_usd < 30 THEN 'Mid ($10-$29.99)'
        ELSE                       'High ($30+)'
    END,
    g.genre
HAVING COUNT(*) >= 10
ORDER BY g.genre, price_tier
"""

q2 = run_query(Q2_SQL, "Q2 Price vs Perceived Quality")

# Visualization: two side-by-side grouped bar charts with alternating
# background stripes aligned to each genre group (same approach as Q1).
q2_top = q2[q2["genre"].isin(top_genres)].copy()

q2_total_group_w = len(tier_labels_present) * bar_width  # e.g. 4 * 0.2
q2_half_gap = (1.0 - q2_total_group_w) / 2

fig, axes = plt.subplots(1, 2, figsize=(16, 6), sharey=False)

for ax, metric, ylabel, title_suffix in [
    (axes[0], "median_metascore", "Median Metascore (0–100)", "Critic Score"),
    (axes[1], "median_user_score_10", "Median User Score (0–10)", "User Score"),
]:
    for g_idx, _ in enumerate(genre_list):
        if g_idx % 2 == 0:
            ax.axvspan(
                g_idx - q2_half_gap,
                g_idx + q2_total_group_w + q2_half_gap,
                color="#BBCCE8",
                alpha=0.5,
                zorder=0,
            )
    for i, tier in enumerate(tier_labels_present):
        tier_data = q2_top[q2_top["price_tier"] == tier]
        vals = [
            (
                tier_data[tier_data["genre"] == g][metric].values[0]
                if g in tier_data["genre"].values
                else 0
            )
            for g in genre_list
        ]
        ax.bar(
            [xi + i * bar_width for xi in x],
            vals,
            bar_width,
            label=tier,
            color=TIER_COLORS.get(tier, "#999"),
            zorder=2,
        )
    ax.set_xticks([xi + q2_total_group_w / 2 for xi in x])
    ax.set_xticklabels(genre_list, rotation=35, ha="right")
    ax.set_ylabel(ylabel)
    ax.set_title(f"Q2: Median {title_suffix} by Price Tier and Genre")
    ax.legend(title="Price Tier")

plt.suptitle("Q2: Price vs Perceived Quality (2020–2024)", fontsize=13, y=1.01)
plt.tight_layout()
fig.savefig(f"{FIGURES_DIR}/q2_price_vs_quality.png", dpi=150, bbox_inches="tight")
plt.close(fig)
print(f"  Saved figures/q2_price_vs_quality.png")


# ---------------------------------------------------------------------------
# Q3 — Year-over-Year Marketplace Trends (2020–2024)
# Per year: median release price, % free-to-play, median CCU.
# All aggregation in SQL.
# ---------------------------------------------------------------------------

Q3_SQL = """
SELECT
    g.release_year,
    COUNT(*)                                            AS total_games,
    MEDIAN(g.price_usd)                                 AS median_price,
    ROUND(
        SUM(CASE WHEN g.is_free = 1 THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 1)                          AS pct_free,
    MEDIAN(p.ccu)                                       AS median_ccu_current,
    MEDIAN(p.ccu_at_1yr)                                AS median_ccu_at_1yr,
    MEDIAN(p.ccu_peak)                                  AS median_ccu_peak
FROM games g
JOIN player_stats p ON g.app_id = p.app_id
GROUP BY g.release_year
ORDER BY g.release_year
"""

q3 = run_query(Q3_SQL, "Q3 Marketplace Trends")

# Visualization: dual-axis chart.
# ccu_at_1yr: CCU measured ~12 months post-launch — controls for game age,
# enabling a fair temporal comparison across release years.
# ccu_current (SteamSpy snapshot, March 2026) shown separately for reference.
fig, ax1 = plt.subplots(figsize=(10, 5))

color_price = "#1976D2"
color_1yr = "#E53935"
color_current = "#9E9E9E"
color_free = "#43A047"

years = q3["release_year"].tolist()
ax1.plot(
    years,
    q3["median_price"],
    marker="o",
    color=color_price,
    linewidth=2,
    label="Median Release Price (USD)",
)
ax1.set_xlabel("Release Year")
ax1.set_ylabel("Median Release Price (USD)", color=color_price)
ax1.tick_params(axis="y", labelcolor=color_price)
ax1.set_xticks(years)

ax2 = ax1.twinx()
ax2.plot(
    years,
    q3["median_ccu_at_1yr"],
    marker="s",
    color=color_1yr,
    linewidth=2,
    linestyle="--",
    label="Median CCU at 1 Year Post-Launch (Steam Charts)",
)
ax2.plot(
    years,
    q3["median_ccu_current"],
    marker="^",
    color=color_current,
    linewidth=1.5,
    linestyle=":",
    label="Median CCU Today (SteamSpy, Mar 2026)",
)
ax2.set_ylabel("Median Concurrent Players (CCU)", color=color_1yr)
ax2.tick_params(axis="y", labelcolor=color_1yr)
ax2.yaxis.set_major_formatter(mticker.FuncFormatter(lambda v, _: f"{int(v):,}"))

# % free-to-play as bar in background
ax3 = ax1.twinx()
ax3.spines["right"].set_position(("axes", 1.12))
ax3.bar(
    [y - 0.3 for y in years],
    q3["pct_free"],
    width=0.5,
    color=color_free,
    alpha=0.25,
    label="% Free-to-Play",
)
ax3.set_ylabel("% Free-to-Play", color=color_free)
ax3.tick_params(axis="y", labelcolor=color_free)
ax3.set_ylim(0, 100)

lines1, labels1 = ax1.get_legend_handles_labels()
lines2, labels2 = ax2.get_legend_handles_labels()
lines3, labels3 = ax3.get_legend_handles_labels()
ax1.legend(
    lines1 + lines2 + lines3, labels1 + labels2 + labels3, loc="upper left", fontsize=9
)

ax1.set_title("Q3: Year-over-Year Marketplace Trends on Steam (2020–2024)")
plt.tight_layout()
fig.savefig(f"{FIGURES_DIR}/q3_marketplace_trends.png", dpi=150, bbox_inches="tight")
plt.close(fig)
print(f"  Saved figures/q3_marketplace_trends.png")

# ---------------------------------------------------------------------------
# Q4 — Score vs. Engagement Trend
# Fetches raw (score, CCU) rows from Oracle so Python only does display formatting.
# ---------------------------------------------------------------------------

Q4_SQL = """
SELECT
    ROUND(s.metascore / 10, 1)  AS metascore_10,
    ROUND(s.user_score / 10, 1) AS user_score_10,
    p.ccu_at_1yr
FROM games g
JOIN reviews  s ON g.app_id = s.app_id
JOIN player_stats p ON g.app_id = p.app_id
WHERE p.ccu_at_1yr IS NOT NULL
  AND p.ccu_at_1yr > 0
ORDER BY s.metascore
"""
q4 = run_query(Q4_SQL, "Q4 Score vs Engagement")


# Bin both score types into 0.5-unit intervals on the 0-10 scale and compute
# the median CCU at 1 year per bin (bins with fewer than 5 games excluded).
def binned_median(df, score_col, ccu_col, bin_size=0.5, min_count=5):
    df = df.copy()
    df["bin"] = (df[score_col] / bin_size).apply(int) * bin_size
    result = (
        df.groupby("bin")
        .agg(median_ccu=(ccu_col, "median"), n=(ccu_col, "count"))
        .reset_index()
    )
    return result[result["n"] >= min_count]


meta_bins = binned_median(q4, "metascore_10", "ccu_at_1yr")
user_bins = binned_median(q4, "user_score_10", "ccu_at_1yr")

fig, ax = plt.subplots(figsize=(10, 5))
ax.plot(
    meta_bins["bin"],
    meta_bins["median_ccu"],
    "o-",
    color="#1565C0",
    linewidth=2,
    markersize=6,
    label="Metascore ÷ 10",
)
ax.plot(
    user_bins["bin"],
    user_bins["median_ccu"],
    "s--",
    color="#C62828",
    linewidth=2,
    markersize=6,
    label="User Score",
)
ax.set_yscale("log")
ax.set_xlabel("Review Score (0–10 scale)")
ax.set_ylabel("Median CCU at 1 Year Post-Launch (log scale)")
ax.set_title("Q4: Review Score vs. Player Engagement at 1 Year Post-Launch")
ax.legend(fontsize=10)
ax.grid(True, alpha=0.3)
ax.annotate(
    "Each point = median CCU for games in a 0.5-score bin (n \u2265 5)",
    xy=(0.02, 0.03),
    xycoords="axes fraction",
    fontsize=8,
    color="#555",
)
# Annotate the user-score 2.5 spike: driven by review-bombed AAA games
# (Diablo IV, EA FC 24, Battlefield 2042) with high CCU despite low user scores.
spike_x = user_bins.loc[user_bins["bin"] == 2.5, "bin"]
spike_y = user_bins.loc[user_bins["bin"] == 2.5, "median_ccu"]
if not spike_x.empty:
    ax.annotate(
        "Bin ~2.5: Diablo IV,\nEA FC 24, BF2042\n(review-bombed AAA titles)",
        xy=(float(spike_x.iloc[0]), float(spike_y.iloc[0])),
        xytext=(3.2, float(spike_y.iloc[0]) * 2.5),
        fontsize=7,
        color="#C62828",
        arrowprops=dict(arrowstyle="->", color="#C62828", lw=0.8),
    )
plt.tight_layout()
fig.savefig(f"{FIGURES_DIR}/q4_score_vs_engagement.png", dpi=150, bbox_inches="tight")
plt.close(fig)
print(f"  Saved figures/q4_score_vs_engagement.png")

# ------------------------------------------------------------------
# Close connection
# ------------------------------------------------------------------
conn.close()
print("\nDone. Figures saved to figures/")

# Print data summary tables
print("\n--- Q1 Summary (top rows) ---")
print(q1[["price_tier", "genre", "median_ccu", "game_count"]].to_string(index=False))

print("\n--- Q2 Summary (top rows) ---")
print(
    q2[
        [
            "price_tier",
            "genre",
            "median_metascore",
            "median_user_score_10",
            "game_count",
        ]
    ].to_string(index=False)
)

print("\n--- Q3 Summary ---")
print(
    q3[
        [
            "release_year",
            "total_games",
            "median_price",
            "pct_free",
            "median_ccu_at_1yr",
            "median_ccu_current",
        ]
    ].to_string(index=False)
)
