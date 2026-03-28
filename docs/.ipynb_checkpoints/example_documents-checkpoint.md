# MongoDB Schema — Example Documents

Two example documents showing the full document structure with real data. Each game document embeds player stats and review summary fields most frequently used together in Q1–Q4.

## Example 1: Hades (Action, Low price tier, 2020)

```json
{
  "app_id": 1145360,
  "name": "Hades",
  "genre": "Action",
  "price_usd": 9.99,
  "is_free": 0,
  "release_year": 2020,
  "player_stats": {
    "ccu": 2253,
    "ccu_peak": 54015,
    "owners": "5,000,000 .. 10,000,000",
    "avg_playtime_min": 2177,
    "ccu_at_1yr": 11527
  },
  "review_summary": {
    "metascore": 93,
    "user_score": 86
  }
}
```

## Example 2: Baldur's Gate 3 (Adventure, High price tier, 2023)

```json
{
  "app_id": 1086940,
  "name": "Baldur's Gate 3",
  "genre": "Adventure",
  "price_usd": 47.99,
  "is_free": 0,
  "release_year": 2023,
  "player_stats": {
    "ccu": 54771,
    "ccu_peak": 875343,
    "owners": "20,000,000 .. 50,000,000",
    "avg_playtime_min": 7523,
    "ccu_at_1yr": 123814
  },
  "review_summary": {
    "metascore": 96,
    "user_score": 92
  }
}
```

## Schema Justification

There are a number of reasons we chose to embed everything in a single games collection. First, all four of our research questions require game data combined with player stats, reviews, or both. Since every query would otherwise require a $lookup, embedding allows us to group price_usd, genre, and player_stats fields in a single $group stage without $lookup. Additionally, all our data is 1:1, meaning each game has exactly one set of stats and one set of review scores. This allows us to sidestep the main problem with embedding like this: if the design is 1:many, embedding it all could make the document very large. We only have ~1600 games, and each document remains small because player stats and review summaries are compact, so embedding does not approach MongoDB's 16MB document size limit. This also gives us data locality. All fields for a game are stored together, and our aggregation pipelines stay simple ($match → $group), making them easier to implement and debug.
