## Q1

### SQL Query

```
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
```

### Summary

Joins games with player_stats on app_id. Groups games by price tier and genre. Computes median/average CCU. Computes median average playtime. Computes the number of games in each category. Only displays categories with more than 10 games. Orders by genre and price tier.

### Results

**Columns:** price_tier, genre, median_ccu, mean_ccu, median_playtime, game_count

**Sample rows (10 of 22):**

| price_tier | genre | median_ccu | mean_ccu | median_playtime | game_count |
| --- | --- | --- | --- | --- | --- |
| Free | Action | 12.50 | 9764.85 | 474.50 | 20 |
| High ($30+) | Action | 91 | 1254.51 | 902.50 | 212 |
| Low ($0.01-$9.99) | Action | 4 | 459.65 | 313 | 110 |
| Mid ($10-$29.99) | Action | 7.50 | 158.24 | 360.50 | 472 |
| High ($30+) | Adventure | 46 | 2139.24 | 860 | 37 |
| Low ($0.01-$9.99) | Adventure | 2 | 27.41 | 172 | 75 |
| Mid ($10-$29.99) | Adventure | 5 | 102.29 | 307.50 | 296 |
| Low ($0.01-$9.99) | Casual | 14 | 137.17 | 166 | 12 |
| Mid ($10-$29.99) | Casual | 28.50 | 681.44 | 489.50 | 36 |
| Mid ($10-$29.99) | Indie | 22 | 103.45 | 584.50 | 64 |

See also: `figures/phase_3/q1_price_vs_engagement.png` and `figures/phase_3/q1b_playtime_by_tier.png`

### MongoDB Aggregation Pipeline

### Results Comparison

## Q2

### SQL Query

```
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
```

### Summary

Joins games with reviews on app_id. Groups games by price tier and genre. Computes median metascore. Computes median userscore on a scale out of 10. Computes the number of games in each category. Only displays categories with more than 10 games. Orders by genre and price tier.

### Results

**Columns:** price_tier, genre, median_metascore, median_user_score_10, game_count

**Sample rows (10 of 22):**

| price_tier | genre | median_metascore | median_user_score_10 | game_count |
| --- | --- | --- | --- | --- |
| Free | Action | 79 | 6.80 | 20 |
| High ($30+) | Action | 75.50 | 7.10 | 212 |
| Low ($0.01-$9.99) | Action | 74 | 7 | 110 |
| Mid ($10-$29.99) | Action | 75 | 7 | 472 |
| High ($30+) | Adventure | 79 | 7.40 | 37 |
| Low ($0.01-$9.99) | Adventure | 76 | 7 | 75 |
| Mid ($10-$29.99) | Adventure | 76 | 7 | 296 |
| Low ($0.01-$9.99) | Casual | 78 | 6.75 | 12 |
| Mid ($10-$29.99) | Casual | 76.50 | 7 | 36 |
| Mid ($10-$29.99) | Indie | 76 | 7.20 | 64 |

See also: `figures/phase_3/q2_price_vs_quality.png`

### MongoDB Aggregation Pipeline

### Results Comparison

## Q3

### SQL Query

```
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
```

### Summary

Joins games with player_stats on app_id. Groups games by release year. Computes number of games in each category. Computes median price. Computes the percentage of free games. Computes median current CCU. Computes median CCU at 1 year after release. Computes median peak CCU. Orders by release year.

### Results

**Columns:** release_year, total_games, median_price, pct_free, median_ccu_current, median_ccu_at_1yr, median_ccu_peak

**All rows (5 of 5):**

| release_year | total_games | median_price | pct_free | median_ccu_current | median_ccu_at_1yr | median_ccu_peak |
| --- | --- | --- | --- | --- | --- | --- |
| 2020 | 332 | 19.99 | 3.60 | 7 | 52 | 413 |
| 2021 | 330 | 19.99 | 2.40 | 10.50 | 68 | 675 |
| 2022 | 315 | 19.99 | 5.10 | 16 | 79 | 729 |
| 2023 | 329 | 23.99 | 2.40 | 14 | 96.50 | 1006.50 |
| 2024 | 330 | 24.99 | 3 | 18 | 71 | 748 |

See also: `figures/phase_3/q3_marketplace_trends.png`

### MongoDB Aggregation Pipeline

### Results Comparison

## Q4

### SQL Query

```
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
```

### Summary

Joins games, reviews, and player_stats on app_id. Gets CCU at one year. Filters out games where the CCU at one year is null or 0. Computes metascore out of 10 for each game. Computes userscore out of 10 for each game. Orders by metascore.

**Note:** The Python code bins/computes median CCU per bin; probably a mistake and something we'd want to do in the aggregation pipeline instead.

### Results

**Columns:** metascore_10, user_score_10, ccu_at_1yr

**Sample rows (10 of 1592):**

| metascore_10 | user_score_10 | ccu_at_1yr |
| --- | --- | --- |
| 3.10 | 4.10 | 78 |
| 3.30 | 1.50 | 13 |
| 3.60 | 3.10 | 2 |
| 3.80 | 4.90 | 5 |
| 3.90 | 6.40 | 13 |
| 4 | 6.70 | 2 |
| 4.30 | 6.70 | 2 |
| 4.30 | 3.60 | 4 |
| 4.40 | 2.80 | 3 |
| 4.40 | 5.90 | 22 |

See also: `figures/phase_3/q4_score_vs_engagement.png`

### MongoDB Aggregation Pipeline

### Results Comparison
