"""
Step 6: Fetch Steam Charts player-count history for each game.

For each app_id in the joined dataset, queries:
  https://steamcharts.com/app/{appid}/chart-data.json

Returns a list of [timestamp_ms, avg_concurrent] pairs at ~2-day intervals.

We extract:
  - ccu_at_1yr   : average concurrent players in the window 11–13 months post-launch
                   (controls for game age in Q3 temporal analysis)
  - ccu_peak     : all-time peak concurrent players from Steam Charts history

Input:
  data/raw/mendeley_metacritic_joined.csv  (for app_ids)
  data/raw/games.json                      (for exact release dates)

Output:
  data/raw/steamcharts_data.csv

Resume support: already-fetched app_ids are skipped on re-run.
Rate: 4 workers × 1.5 s sleep = ~40 req/min → ~41 minutes for 1,646 games.
"""

import csv
import json
import os
import re
import threading
import time
from queue import Queue

import pandas as pd
import requests

RAW = "data/raw"
JOINED_FILE = f"{RAW}/mendeley_metacritic_joined.csv"
GAMES_JSON = f"{RAW}/games.json"
OUTPUT_FILE = f"{RAW}/steamcharts_data.csv"

HEADERS = {"User-Agent": "Mozilla/5.0 (research project, non-commercial)"}
SLEEP = 1.5
WORKERS = 4
CHECKPOINT_EVERY = 50
MAX_RETRIES = 3


def parse_release_date(raw_games: dict, app_id: int):
    """Return a Unix timestamp (seconds) for the game's release date, or None."""
    from datetime import datetime

    d = raw_games.get(str(app_id), {})
    rd = d.get("release_date", "")
    date_str = rd.get("date", "") if isinstance(rd, dict) else (rd or "")
    if not date_str:
        return None
    # Try multiple formats
    for fmt in ("%b %d, %Y", "%d %b, %Y", "%B %d, %Y", "%Y-%m-%d"):
        try:
            return datetime.strptime(date_str.strip(), fmt).timestamp()
        except ValueError:
            continue
    # Fallback: extract year and use Jan 1
    m = re.search(r"\b(20\d{2})\b", date_str)
    if m:
        from datetime import date as dt

        return dt(int(m.group(1)), 7, 1).toordinal() * 86400  # mid-year approx
    return None


def fetch_steamcharts(app_id: int) -> dict:
    """
    Fetch chart-data.json from Steam Charts and return
    {app_id, ccu_at_1yr, ccu_peak, points_fetched, error}.
    """
    url = f"https://steamcharts.com/app/{app_id}/chart-data.json"
    for attempt in range(1, MAX_RETRIES + 1):
        try:
            r = requests.get(url, headers=HEADERS, timeout=30)
            if r.status_code == 404:
                return {
                    "app_id": app_id,
                    "ccu_at_1yr": None,
                    "ccu_peak": None,
                    "points_fetched": 0,
                    "error": "404",
                }
            if r.status_code == 429:
                time.sleep(30)
                continue
            r.raise_for_status()
            data = r.json()
            if not data:
                return {
                    "app_id": app_id,
                    "ccu_at_1yr": None,
                    "ccu_peak": None,
                    "points_fetched": 0,
                    "error": "empty",
                }
            return {
                "app_id": app_id,
                "_raw": data,
                "points_fetched": len(data),
                "error": None,
            }
        except Exception as e:
            if attempt == MAX_RETRIES:
                return {
                    "app_id": app_id,
                    "ccu_at_1yr": None,
                    "ccu_peak": None,
                    "points_fetched": 0,
                    "error": str(e)[:80],
                }
            time.sleep(attempt * 3)
    return {
        "app_id": app_id,
        "ccu_at_1yr": None,
        "ccu_peak": None,
        "points_fetched": 0,
        "error": "max_retries",
    }


def compute_metrics(raw_data: list, release_ts: float | None) -> tuple:
    """
    Given the raw [[ts_ms, ccu], ...] list and a release Unix timestamp,
    return (ccu_at_1yr, ccu_peak).
    """
    if not raw_data:
        return None, None

    points = [(ts / 1000, ccu) for ts, ccu in raw_data if ccu is not None]
    if not points:
        return None, None

    ccu_peak = max(v for _, v in points)

    ccu_at_1yr = None
    if release_ts:
        target_ts = release_ts + 365 * 86400
        window = [
            (ts, v) for ts, v in points if abs(ts - target_ts) <= 45 * 86400
        ]  # ±45 days
        if window:
            ccu_at_1yr = round(sum(v for _, v in window) / len(window))

    return ccu_at_1yr, ccu_peak


def worker(
    queue: Queue,
    results: list,
    lock: threading.Lock,
    raw_games: dict,
    release_dates: dict,
    counter: list,
):
    while True:
        app_id = queue.get()
        if app_id is None:
            break
        time.sleep(SLEEP)
        result = fetch_steamcharts(app_id)
        raw_data = result.pop("_raw", None)
        if raw_data is not None:
            ccu_at_1yr, ccu_peak = compute_metrics(raw_data, release_dates.get(app_id))
            result["ccu_at_1yr"] = ccu_at_1yr
            result["ccu_peak"] = ccu_peak
        with lock:
            results.append(result)
            counter[0] += 1
            n = counter[0]
            status = f"ccu_at_1yr={result['ccu_at_1yr']}  peak={result['ccu_peak']}"
            print(f"  [{n}] app_id={app_id}  {status}  err={result['error']}")
        queue.task_done()


def main():
    joined = pd.read_csv(JOINED_FILE)
    all_ids = sorted(joined["app_id"].astype(int).unique().tolist())
    print(f"Total app_ids to fetch: {len(all_ids)}")

    # Load existing results (resume support).
    # Only skip rows that succeeded (error is None or '404').
    # Re-fetch rows with network/timeout errors.
    done_ids = set()
    existing_rows = []
    if os.path.exists(OUTPUT_FILE):
        with open(OUTPUT_FILE, newline="", encoding="utf-8") as f:
            reader = csv.DictReader(f)
            for row in reader:
                err = row.get("error", "") or ""
                if err in ("", "None", "404", "empty"):
                    done_ids.add(int(row["app_id"]))
                existing_rows.append(row)
        print(f"  Already completed (success/404): {len(done_ids)}")
        retry_count = sum(
            1
            for r in existing_rows
            if (r.get("error") or "") not in ("", "None", "404", "empty")
        )
        print(f"  Will retry errored rows: {retry_count}")

    remaining = [i for i in all_ids if i not in done_ids]
    print(f"  Remaining: {len(remaining)}")

    if not remaining:
        print("All done — nothing to fetch.")
        return

    # Load release dates from games.json
    print("Loading release dates from games.json ...")
    with open(GAMES_JSON, encoding="utf-8") as f:
        raw_games = json.load(f)
    release_dates = {}
    for aid in remaining:
        ts = parse_release_date(raw_games, aid)
        if ts:
            release_dates[aid] = ts
    print(f"  Release dates found for {len(release_dates)}/{len(remaining)} games")

    # Enqueue work
    queue: Queue = Queue()
    for aid in remaining:
        queue.put(aid)

    results: list = []
    lock = threading.Lock()
    counter = [0]

    threads = []
    for _ in range(WORKERS):
        t = threading.Thread(
            target=worker,
            args=(queue, results, lock, raw_games, release_dates, counter),
            daemon=True,
        )
        t.start()
        threads.append(t)
        queue.put(None)  # sentinel per worker

    # Periodic checkpoint saves
    total = len(remaining)
    last_saved = 0
    while counter[0] < total:
        time.sleep(5)
        with lock:
            n = counter[0]
        if n - last_saved >= CHECKPOINT_EVERY:
            with lock:
                batch = list(results)
            _save(existing_rows, batch, OUTPUT_FILE)
            last_saved = n
            print(f"  [checkpoint] saved {n}/{total}")

    for t in threads:
        t.join()

    _save(existing_rows, results, OUTPUT_FILE)
    errors = sum(1 for r in results if r.get("error"))
    null_1yr = sum(1 for r in results if r.get("ccu_at_1yr") is None)
    print(f"\nDone. Wrote {OUTPUT_FILE}")
    print(f"  Fetched: {len(results)},  errors: {errors}")
    print(f"  ccu_at_1yr null (no 1-yr window data): {null_1yr}")


def _save(existing: list, new_results: list, path: str):
    fieldnames = ["app_id", "ccu_at_1yr", "ccu_peak", "points_fetched", "error"]
    # new_results overwrite existing rows for the same app_id
    rows = {int(r["app_id"]): r for r in existing}
    for r in new_results:
        rows[int(r["app_id"])] = r
    with open(path, "w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames, extrasaction="ignore")
        writer.writeheader()
        for _, row in sorted(rows.items()):
            writer.writerow(row)


if __name__ == "__main__":
    main()
