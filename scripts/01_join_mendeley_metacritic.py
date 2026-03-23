"""
Step 1: Join Mendeley (games.json) with Metacritic (metacritic_games.csv)

Input:
  raw/games.json              -- Mendeley Steam metadata (65,685 games, 2020-2024)
  raw/metacritic_games.csv    -- Metacritic PC games dataset

Output:
  raw/mendeley_metacritic_joined.csv  -- inner join on normalized title, PC platform only

Join key: normalized game title (lowercase, no punctuation, stripped whitespace)
"""

import json
import re
import pandas as pd

RAW = "data/raw"
MENDELEY_FILE = f"{RAW}/games.json"
METACRITIC_FILE = f"{RAW}/metacritic_games.csv"
OUTPUT_FILE = f"{RAW}/mendeley_metacritic_joined.csv"


def normalize_title(title: str) -> str:
    """Lowercase, remove punctuation/symbols, collapse whitespace."""
    if not isinstance(title, str):
        return ""
    title = title.lower()
    title = re.sub(r"[^\w\s]", "", title)  # remove punctuation
    title = re.sub(r"\s+", " ", title).strip()
    return title


# ---------------------------------------------------------------------------
# Load Mendeley games.json
# ---------------------------------------------------------------------------
print("Loading games.json ...")
with open(MENDELEY_FILE, encoding="utf-8") as f:
    raw_games = json.load(f)

# raw_games is a dict keyed by AppID string, e.g. {"906850": {...}, ...}
# Flatten into a list of records.
mendeley_rows = []
for app_id, data in raw_games.items():
    # Extract release year from "release_date" (may be a plain string like "Apr 28, 2023"
    # or a dict like {"coming_soon": false, "date": "Dec 21, 2020"})
    release_date = data.get("release_date", "")
    if isinstance(release_date, dict):
        date_str = release_date.get("date", "")
    elif isinstance(release_date, str):
        date_str = release_date
    else:
        date_str = ""
    # Parse year (last 4-digit number in the string)
    year_match = re.search(r"\b(20\d{2})\b", date_str)
    if not year_match:
        continue  # skip if no valid year
    release_year = int(year_match.group(1))
    if release_year < 2020 or release_year > 2024:
        continue

    # Price: use price_overview.final (in cents) if available, else 0 if is_free
    is_free = data.get("is_free", False)
    price_cents = None
    price_overview = data.get("price_overview", {})
    if isinstance(price_overview, dict):
        price_cents = price_overview.get("final")
    if price_cents is None:
        price_usd = 0.0 if is_free else None
    else:
        price_usd = price_cents / 100.0

    # Some datasets store price directly as a float already
    if price_usd is None:
        direct_price = data.get("price")
        if direct_price is not None:
            try:
                price_usd = float(direct_price)
            except (ValueError, TypeError):
                price_usd = None

    if price_usd is None:
        continue  # skip games with no price info

    # Genres: list of {"id": ..., "description": "Action"} or just strings
    genres_raw = data.get("genres", [])
    if genres_raw and isinstance(genres_raw[0], dict):
        genres = [g.get("description", "") for g in genres_raw]
    else:
        genres = [str(g) for g in genres_raw]
    genre_str = ", ".join(genres) if genres else ""

    name = data.get("name", "")
    if not name:
        continue

    mendeley_rows.append(
        {
            "app_id": int(app_id),
            "name": name,
            "name_norm": normalize_title(name),
            "release_year": release_year,
            "price_usd": round(price_usd, 2),
            "is_free": (
                1 if price_usd == 0.0 else 0
            ),  # derive from final price, not is_free field
            "genre": genre_str,
        }
    )

mendeley_df = pd.DataFrame(mendeley_rows)
print(f"  Mendeley records loaded (2020-2024, valid price): {len(mendeley_df)}")


# ---------------------------------------------------------------------------
# Load Metacritic CSV
# ---------------------------------------------------------------------------
print("Loading metacritic_games.csv ...")
metacritic_df = pd.read_csv(METACRITIC_FILE)
print(f"  Metacritic raw rows: {len(metacritic_df)}")
print(f"  Metacritic columns: {list(metacritic_df.columns)}")

# Filter to PC platform only
# Common column names: 'platform', 'Platform'
platform_col = next((c for c in metacritic_df.columns if c.lower() == "platform"), None)
# Also check for plural 'platforms' column (comma-separated list)
if not platform_col:
    platform_col = next(
        (c for c in metacritic_df.columns if c.lower() == "platforms"), None
    )
if platform_col:
    before = len(metacritic_df)
    metacritic_df = metacritic_df[
        metacritic_df[platform_col]
        .fillna("")
        .str.contains(r"\bPC\b", case=False, regex=True)
    ].copy()
    print(f"  After filtering to PC: {len(metacritic_df)} (was {before})")
else:
    print("  WARNING: no 'platform' column found — skipping platform filter")

# Normalize column names to lowercase
metacritic_df.columns = [c.lower().strip() for c in metacritic_df.columns]

# Identify name column
name_col = next((c for c in metacritic_df.columns if "name" in c or "title" in c), None)
if not name_col:
    raise ValueError(
        f"Could not find a name/title column in Metacritic CSV. Columns: {list(metacritic_df.columns)}"
    )

metacritic_df["name_norm"] = metacritic_df[name_col].apply(normalize_title)

# Keep only relevant columns.
# NOTE: after lowercasing, Metacritic CSV columns are "userscore" (not "user_score"),
# "releasedate" (not "release_date"), and "genres" (not "genre").
# release_year comes from Mendeley; genre comes from Mendeley — no need to pull from Metacritic.
keep_cols = ["name_norm", name_col]
for col in ["metascore", "userscore", "developer", "publisher"]:
    if col in metacritic_df.columns:
        keep_cols.append(col)
metacritic_df = metacritic_df[keep_cols].copy()
metacritic_df = metacritic_df.rename(
    columns={
        name_col: "metacritic_name",
        "userscore": "user_score",  # standardize to match downstream scripts
    }
)

# Drop duplicates (keep first PC entry per normalized title)
metacritic_df = metacritic_df.drop_duplicates(subset="name_norm", keep="first")
print(f"  Metacritic PC records after dedup: {len(metacritic_df)}")


# ---------------------------------------------------------------------------
# Inner join on normalized title
# ---------------------------------------------------------------------------
print("Joining on normalized title ...")
joined = mendeley_df.merge(metacritic_df, on="name_norm", how="inner")
print(f"  Records after inner join: {len(joined)}")

# Drop the normalized key (not needed in output)
joined = joined.drop(columns=["name_norm"])

# Save
joined.to_csv(OUTPUT_FILE, index=False)
print(f"  Saved to {OUTPUT_FILE}")
print("\nSample:")
print(joined.head(5).to_string())
