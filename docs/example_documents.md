# MongoDB Schema — Example Documents

Two example documents showing the full document structure with real data.

## Example 1: Hades (Action, Low price tier, 2020)

```json
{
  "_id": "ObjectId(...)",
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
  "_id": "ObjectId(...)",
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
