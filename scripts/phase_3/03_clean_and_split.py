"""
Step 3: Merge all four datasets and produce clean CSVs for Oracle.

Input:
  raw/mendeley_metacritic_joined.csv  -- Mendeley + Metacritic joined
  raw/steamspy_data.csv               -- SteamSpy API data
  raw/steamcharts_data.csv            -- Steam Charts historical player data

Output (Oracle-ready CSVs, max ~2000 rows each):
  clean/games.csv     -- one row per game: app_id, name, genre, price_usd,
                         release_year, is_free
  clean/reviews.csv    -- one row per game: app_id, metascore, user_score
  clean/player_stats.csv   -- one row per game: app_id, ccu, owners, avg_playtime_min,
                         ccu_at_1yr, ccu_peak

Rules:
  - Drop rows with missing metascore, ccu, or price
  - Standardize genre to a controlled set
  - price_tier is NOT computed here (done in SQL)
  - Keep at most 2000 rows (filter applied at end if needed)
"""

import re
import pandas as pd

RAW = "data/raw"
CLEAN = "data/clean"

import os

os.makedirs(CLEAN, exist_ok=True)

JOINED_FILE = f"{RAW}/mendeley_metacritic_joined.csv"
STEAMSPY_FILE = f"{RAW}/steamspy_data.csv"
STEAMCHARTS_FILE = f"{RAW}/steamcharts_data.csv"

# ---------------------------------------------------------------------------
# Genre normalization map
# ---------------------------------------------------------------------------
# Tier 1 — distinctive/specific genres that override Steam's listing order.
# A game tagged "Action, Racing" is first-and-foremost a Racing game; the Action
# label is incidental. These genres are unambiguously more informative than the
# catch-all broad categories below.
GENRE_TIER1 = {
    "massively multiplayer": "MMO",
    "mmo": "MMO",
    "racing": "Racing",
    "sports": "Sports",
    "fighting": "Fighting",
    "platformer": "Platformer",
    "shooter": "Shooter",
    "horror": "Horror",
    "puzzle": "Puzzle",
}

# Tier 2 — broad/overlapping categories.
# Action, Adventure, RPG, etc. legitimately co-occur and neither outranks the
# other in specificity (e.g., "Action, RPG" is ambiguous). For these genres,
# Steam's listing order is the best available signal: the first-listed genre is
# the publisher's own primary classification.
# NOTE: "Free to Play" is intentionally absent — it is a pricing model, not a
# genre, and is already captured by the is_free column.
GENRE_TIER2 = {
    "rpg": "RPG",
    "role-playing": "RPG",
    "role playing": "RPG",
    "strategy": "Strategy",
    "simulation": "Simulation",
    "adventure": "Adventure",
    "action": "Action",
    "indie": "Indie",
    "casual": "Casual",
}

OTHER_GENRE = "Other"


def normalize_genre(genre_str: str) -> str:
    """Return the most meaningful genre from a comma-separated genre string.

    Two-tier classification:
    - Tier 1 (distinctive genres): checked by key priority across all parts.
      A game tagged "Action, Racing" is classified as Racing, not Action.
    - Tier 2 (broad genres): Steam's listing order is respected—the first part
      that matches a tier-2 keyword wins, since these genres legitimately
      co-occur with no clear specificity ordering between them.
    """
    if not isinstance(genre_str, str) or not genre_str.strip():
        return OTHER_GENRE
    parts = [g.strip().lower() for g in genre_str.split(",")]
    # Tier 1: specific genre wins regardless of position in Steam's list
    for key, val in GENRE_TIER1.items():
        if any(key in part for part in parts):
            return val
    # Tier 2: respect Steam's listing order
    for part in parts:
        for key, val in GENRE_TIER2.items():
            if key in part:
                return val
    return OTHER_GENRE


# ---------------------------------------------------------------------------
# Load and merge
# ---------------------------------------------------------------------------
print("Loading joined dataset ...")
joined = pd.read_csv(JOINED_FILE)
print(f"  {len(joined)} rows")

print("Loading SteamSpy data ...")
steamspy = pd.read_csv(STEAMSPY_FILE)
steamspy = steamspy.rename(columns={"appid": "app_id"})
steamspy["app_id"] = steamspy["app_id"].astype(int)
print(f"  {len(steamspy)} rows")

print("Merging ...")
merged = joined.merge(steamspy, on="app_id", how="inner")
print(f"  After merge with SteamSpy: {len(merged)} rows")

if os.path.exists(STEAMCHARTS_FILE):
    print("Loading Steam Charts data ...")
    sc = pd.read_csv(STEAMCHARTS_FILE)
    sc["app_id"] = sc["app_id"].astype(int)
    sc["ccu_at_1yr"] = pd.to_numeric(sc["ccu_at_1yr"], errors="coerce")
    sc["ccu_peak"] = pd.to_numeric(sc["ccu_peak"], errors="coerce")
    sc = sc[["app_id", "ccu_at_1yr", "ccu_peak"]]
    print(f"  {len(sc)} rows  (non-null ccu_at_1yr: {sc['ccu_at_1yr'].notna().sum()})")
    merged = merged.merge(sc, on="app_id", how="left")
    print(f"  After LEFT JOIN with Steam Charts: {len(merged)} rows")
else:
    print(
        "  WARNING: steamcharts_data.csv not found — ccu_at_1yr/ccu_peak will be null"
    )
    merged["ccu_at_1yr"] = None
    merged["ccu_peak"] = None


# ---------------------------------------------------------------------------
# Drop rows with missing key values
# ---------------------------------------------------------------------------
before = len(merged)
merged = merged.dropna(subset=["metascore", "ccu", "price_usd"])
print(
    f"  After dropping missing metascore/ccu/price: {len(merged)} (dropped {before - len(merged)})"
)

# Drop rows where ccu = 0 AND owners = "0 .. 0" (games with essentially no data)
merged = merged[~((merged["ccu"] == 0) & (merged["owners"].astype(str) == "0 .. 0"))]
print(f"  After dropping zero-activity rows: {len(merged)}")

# Deduplicate: if multiple Steam app_ids match the same Metacritic entry, keep
# the one with the highest current CCU (the primary/most-played version).
before_dedup = len(merged)
merged = merged.sort_values("ccu", ascending=False).drop_duplicates(
    subset="metacritic_name", keep="first"
)
print(
    f"  After deduplicating by Metacritic title (kept highest-CCU entry): {len(merged)} (removed {before_dedup - len(merged)} duplicate editions)"
)


# ---------------------------------------------------------------------------
# Normalize values
# ---------------------------------------------------------------------------
# Genre
merged["genre"] = merged["genre"].apply(normalize_genre)

# Ensure numeric types
merged["metascore"] = pd.to_numeric(merged["metascore"], errors="coerce")
merged["user_score"] = pd.to_numeric(merged["user_score"], errors="coerce")
merged["ccu"] = pd.to_numeric(merged["ccu"], errors="coerce").fillna(0).astype(int)
merged["average_forever"] = (
    pd.to_numeric(merged["average_forever"], errors="coerce").fillna(0).astype(int)
)
merged["price_usd"] = pd.to_numeric(merged["price_usd"], errors="coerce")

# Release year: already int, but re-cast to be safe
merged["release_year"] = pd.to_numeric(merged["release_year"], errors="coerce")
merged = merged.dropna(subset=["release_year"])
merged["release_year"] = merged["release_year"].astype(int)
merged = merged[merged["release_year"].between(2020, 2024)]
print(f"  After year filter (2020-2024): {len(merged)}")


# ---------------------------------------------------------------------------
# Cap at 2000 rows if needed (keep highest-metascore games to maintain quality)
# ---------------------------------------------------------------------------
MAX_ROWS = 2000
if len(merged) > MAX_ROWS:
    merged = merged.sort_values("metascore", ascending=False).head(MAX_ROWS)
    print(f"  Capped at {MAX_ROWS} rows (top by metascore)")
else:
    print(f"  No capping needed ({len(merged)} rows)")


# ---------------------------------------------------------------------------
# Build output tables
# ---------------------------------------------------------------------------

# games.csv
games = merged[
    ["app_id", "name", "genre", "price_usd", "release_year", "is_free"]
].copy()
games = games.drop_duplicates(subset="app_id")
games.to_csv(f"{CLEAN}/games.csv", index=False)
print(f"\nWrote {CLEAN}/games.csv ({len(games)} rows)")
print(f"  Columns: {list(games.columns)}")

# reviews.csv
score_cols = ["app_id", "metascore", "user_score"]
reviews = merged[score_cols].copy()
reviews = reviews.drop_duplicates(subset="app_id")
reviews.to_csv(f"{CLEAN}/reviews.csv", index=False)
print(f"Wrote {CLEAN}/reviews.csv ({len(reviews)} rows)")
print(f"  Columns: {list(reviews.columns)}")

# player_stats.csv
player_stats = merged[
    ["app_id", "ccu", "owners", "average_forever", "ccu_at_1yr", "ccu_peak"]
].copy()
player_stats = player_stats.rename(columns={"average_forever": "avg_playtime_min"})
player_stats["ccu_at_1yr"] = pd.to_numeric(
    player_stats["ccu_at_1yr"], errors="coerce"
).round(0)
player_stats["ccu_peak"] = pd.to_numeric(
    player_stats["ccu_peak"], errors="coerce"
).round(0)
player_stats = player_stats.drop_duplicates(subset="app_id")
player_stats.to_csv(f"{CLEAN}/player_stats.csv", index=False)
print(f"Wrote {CLEAN}/player_stats.csv ({len(player_stats)} rows)")
print(f"  Columns: {list(player_stats.columns)}")

print("\nSummary:")
print(f"  Total games: {len(games)}")
print(f"  Release years: {sorted(merged['release_year'].unique().tolist())}")
print(f"  Genres: {sorted(merged['genre'].unique().tolist())}")
print(
    f"  Price range: ${merged['price_usd'].min():.2f} – ${merged['price_usd'].max():.2f}"
)
print(f"  Free-to-play games: {games['is_free'].sum()}")
print(
    f"  Metascore range: {merged['metascore'].min():.0f} – {merged['metascore'].max():.0f}"
)
