import oracledb, config

dsn = oracledb.makedsn(
    config.ORACLE_HOST, config.ORACLE_PORT, service_name=config.ORACLE_SERVICE
)
conn = oracledb.connect(
    user=config.ORACLE_USERNAME, password=config.ORACLE_PASSWORD, dsn=dsn
)
cur = conn.cursor()

# Q1: median CCU by tier (all genres combined)
cur.execute(
    """
SELECT
    CASE WHEN g.price_usd=0 THEN 'Free'
         WHEN g.price_usd<10 THEN 'Low ($0.01-9.99)'
         WHEN g.price_usd<30 THEN 'Mid ($10-29.99)'
         ELSE 'High ($30+)' END AS tier,
    MEDIAN(p.ccu) AS med_ccu,
    COUNT(*) AS n
FROM games g JOIN player_stats p ON g.app_id=p.app_id
GROUP BY
    CASE WHEN g.price_usd=0 THEN 'Free'
         WHEN g.price_usd<10 THEN 'Low ($0.01-9.99)'
         WHEN g.price_usd<30 THEN 'Mid ($10-29.99)'
         ELSE 'High ($30+)' END
ORDER BY MIN(g.price_usd)
"""
)
print("Q1 median CURRENT CCU by price tier (all genres):")
for r in cur.fetchall():
    print(f"  {r[0]}: med_CCU={int(r[1]):,}  n={r[2]}")

# Q1b: median playtime by tier
cur.execute(
    """
SELECT
    CASE WHEN g.price_usd=0 THEN 'Free'
         WHEN g.price_usd<10 THEN 'Low'
         WHEN g.price_usd<30 THEN 'Mid'
         ELSE 'High' END AS tier,
    MEDIAN(p.avg_playtime_min) AS med_play,
    COUNT(*) AS n
FROM games g JOIN player_stats p ON g.app_id=p.app_id
GROUP BY
    CASE WHEN g.price_usd=0 THEN 'Free'
         WHEN g.price_usd<10 THEN 'Low'
         WHEN g.price_usd<30 THEN 'Mid'
         ELSE 'High' END
ORDER BY MIN(g.price_usd)
"""
)
print("\nQ1b median playtime by price tier:")
for r in cur.fetchall():
    print(f"  {r[0]}: {int(r[1])} min ({r[1]/60:.1f} hrs)  n={r[2]}")

# Q2: median scores by tier
cur.execute(
    """
SELECT
    CASE WHEN g.price_usd=0 THEN 'Free'
         WHEN g.price_usd<10 THEN 'Low'
         WHEN g.price_usd<30 THEN 'Mid'
         ELSE 'High' END AS tier,
    ROUND(MEDIAN(r.metascore),1) AS meta,
    ROUND(MEDIAN(r.user_score)/10,1) AS user10,
    COUNT(*) AS n
FROM games g JOIN reviews r ON g.app_id=r.app_id
GROUP BY
    CASE WHEN g.price_usd=0 THEN 'Free'
         WHEN g.price_usd<10 THEN 'Low'
         WHEN g.price_usd<30 THEN 'Mid'
         ELSE 'High' END
ORDER BY MIN(g.price_usd)
"""
)
print("\nQ2 median scores by price tier:")
for r in cur.fetchall():
    print(f"  {r[0]}: metascore={r[1]}  user={r[2]}/10  n={r[3]}")

# Q3: trends by year
cur.execute(
    """
SELECT
    g.release_year,
    COUNT(*) n,
    ROUND(MEDIAN(g.price_usd),2) med_price,
    ROUND(SUM(CASE WHEN g.is_free=1 THEN 1 ELSE 0 END)*100.0/COUNT(*),1) pct_free,
    ROUND(MEDIAN(ps.ccu_at_1yr),0) med_ccu_1yr
FROM games g JOIN player_stats ps ON g.app_id=ps.app_id
GROUP BY g.release_year
ORDER BY g.release_year
"""
)
print("\nQ3 marketplace trends by year:")
for r in cur.fetchall():
    ccu = int(r[4]) if r[4] is not None else "N/A"
    print(f"  {r[0]}: n={r[1]}  price=${r[2]}  free={r[3]}%  ccu_1yr={ccu}")

cur.close()
conn.close()
print("\nDone.")
