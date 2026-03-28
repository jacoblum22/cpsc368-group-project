# Q1: SQL vs. MongoDB Comparison

Both versions answer the same question, and the trends are consistent. High ($30+) games lead median CCU in most genres, Low ($0.01–$9.99) games underperform across the board, and Free MMOs dominate their tier — all matching Oracle's findings.

The main structural difference is that MongoDB needs no join since `player_stats` is embedded in each game document. The main computational difference is median: Oracle has a built-in `MEDIAN()`, while MongoDB requires pre-sorting and picking the middle array element with `$arrayElemAt`. This approximation causes small numeric differences between phases (e.g. Free/Action median CCU: 12.5 in Oracle vs. 16 in MongoDB), but the overall patterns are the same.
