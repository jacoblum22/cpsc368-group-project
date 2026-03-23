"""
Generate steam_games.sql: DDL (DROP + CREATE) and DML (INSERT) for Oracle.

Input:
  data/clean/games.csv
  data/clean/reviews.csv
  data/clean/player_stats.csv

Output:
  steam_games.sql  -- run this on the department Oracle server

Format matches the course bookbiz.sql convention:
  - plain drop table (no CASCADE CONSTRAINTS)
  - purge recyclebin
  - create table with inline PK/FK constraints
  - grant select on <table> to public
  - one INSERT INTO ... VALUES (...); per row
"""

import pandas as pd

CLEAN = "data/clean"
OUTPUT = "steam_games.sql"


def esc(val) -> str:
    """Escape a string value for Oracle SQL: wrap in single quotes, escape
    any internal single quotes by doubling them."""
    s = str(val).replace("'", "''")
    return f"'{s}'"


def main():
    games = pd.read_csv(f"{CLEAN}/games.csv")
    reviews = pd.read_csv(f"{CLEAN}/reviews.csv")
    player_stats = pd.read_csv(f"{CLEAN}/player_stats.csv")

    lines = []

    # ------------------------------------------------------------------
    # DROP (child tables first to respect FK order)
    # ------------------------------------------------------------------
    lines += [
        "drop table reviews;",
        "drop table player_stats;",
        "drop table games;",
        "purge recyclebin;",
        "",
    ]

    # ------------------------------------------------------------------
    # CREATE games
    # ------------------------------------------------------------------
    lines += [
        "create table games",
        "\t(app_id      int not null,",
        "\tname         varchar(200) not null,",
        "\tgenre        varchar(50) null,",
        "\tprice_usd    float null,",
        "\trelease_year int null,",
        "\tis_free      int null,",
        "\tprimary key (app_id));",
        "",
        "grant select on games to public;",
        "",
    ]

    # ------------------------------------------------------------------
    # CREATE reviews  (FK → games)
    # ------------------------------------------------------------------
    lines += [
        "create table reviews",
        "\t(app_id     int not null,",
        "\tmetascore   float null,",
        "\tuser_score  int null,",
        "\tprimary key (app_id),",
        "\tforeign key (app_id) references games ON DELETE CASCADE);",
        "",
        "grant select on reviews to public;",
        "",
    ]

    # ------------------------------------------------------------------
    # CREATE player_stats  (FK → games)
    # ------------------------------------------------------------------
    lines += [
        "create table player_stats",
        "\t(app_id          int not null,",
        "\tccu              int null,",
        "\towners           varchar(30) null,",
        "\tavg_playtime_min int null,",
        "\tccu_at_1yr       int null,",
        "\tccu_peak         int null,",
        "\tprimary key (app_id),",
        "\tforeign key (app_id) references games ON DELETE CASCADE);",
        "",
        "grant select on player_stats to public;",
        "",
    ]

    # ------------------------------------------------------------------
    # INSERT games
    # ------------------------------------------------------------------
    for _, row in games.iterrows():
        app_id = int(row["app_id"])
        name = esc(row["name"])
        genre = esc(row["genre"]) if pd.notna(row["genre"]) else "null"
        price = f"{row['price_usd']:.2f}" if pd.notna(row["price_usd"]) else "null"
        year = int(row["release_year"]) if pd.notna(row["release_year"]) else "null"
        is_free = int(row["is_free"]) if pd.notna(row["is_free"]) else "null"
        lines.append(
            f"insert into games\nvalues({app_id}, {name}, {genre}, {price}, {year}, {is_free});"
        )

    lines.append("")

    # ------------------------------------------------------------------
    # INSERT reviews
    # ------------------------------------------------------------------
    for _, row in reviews.iterrows():
        app_id = int(row["app_id"])
        metascore = f"{row['metascore']:.1f}" if pd.notna(row["metascore"]) else "null"
        user_score = int(row["user_score"]) if pd.notna(row["user_score"]) else "null"
        lines.append(
            f"insert into reviews\nvalues({app_id}, {metascore}, {user_score});"
        )

    lines.append("")

    # ------------------------------------------------------------------
    # INSERT player_stats
    # ------------------------------------------------------------------
    for _, row in player_stats.iterrows():
        app_id = int(row["app_id"])
        ccu = int(row["ccu"]) if pd.notna(row["ccu"]) else "null"
        owners = esc(row["owners"]) if pd.notna(row["owners"]) else "null"
        playtime = (
            int(row["avg_playtime_min"])
            if pd.notna(row["avg_playtime_min"])
            else "null"
        )
        at_1yr = int(row["ccu_at_1yr"]) if pd.notna(row["ccu_at_1yr"]) else "null"
        peak = int(row["ccu_peak"]) if pd.notna(row["ccu_peak"]) else "null"
        lines.append(
            f"insert into player_stats\nvalues({app_id}, {ccu}, {owners}, {playtime}, {at_1yr}, {peak});"
        )

    lines += ["", "commit;"]

    # ------------------------------------------------------------------
    # Write file
    # ------------------------------------------------------------------
    with open(OUTPUT, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))

    print(f"Wrote {OUTPUT}")
    print(f"  games rows:        {len(games)}")
    print(f"  reviews rows:      {len(reviews)}")
    print(f"  player_stats rows: {len(player_stats)}")
    total_inserts = len(games) + len(reviews) + len(player_stats)
    print(f"  total INSERT statements: {total_inserts}")


if __name__ == "__main__":
    main()
