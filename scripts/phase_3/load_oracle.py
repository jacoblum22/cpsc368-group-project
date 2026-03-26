"""Load steam_games.sql into Oracle."""

import sys, oracledb

sys.path.insert(0, ".")
import config

dsn = oracledb.makedsn(
    config.ORACLE_HOST, config.ORACLE_PORT, service_name=config.ORACLE_SERVICE
)
conn = oracledb.connect(
    user=config.ORACLE_USERNAME, password=config.ORACLE_PASSWORD, dsn=dsn
)
cur = conn.cursor()

with open("steam_games.sql", encoding="utf-8") as f:
    content = f.read()

statements = [s.strip() for s in content.split(";") if s.strip()]

ok, failed = 0, 0
for i, stmt in enumerate(statements):
    try:
        cur.execute(stmt)
        ok += 1
    except oracledb.DatabaseError as e:
        err = str(e)
        if stmt.lower().startswith("drop") and "ORA-00942" in err:
            pass  # table didn't exist yet
        elif "purge recyclebin" in stmt.lower():
            pass  # ignore recyclebin errors
        else:
            print(f"ERROR at stmt {i}: {e}")
            print(f"  {stmt[:100]}")
            failed += 1
    if i % 500 == 0 and i > 0:
        print(f"  {i}/{len(statements)} statements executed ...")

conn.commit()
print(f"Done. {ok} ok, {failed} errors.")

for tbl in ["games", "reviews", "player_stats"]:
    cur.execute(f"SELECT COUNT(*) FROM {tbl}")
    print(f"  {tbl}: {cur.fetchone()[0]} rows")

cur.close()
conn.close()
