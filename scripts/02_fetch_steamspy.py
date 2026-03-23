"""
Step 2: Fetch SteamSpy data for all AppIDs in the joined dataset.

Input:
  raw/mendeley_metacritic_joined.csv  -- output of step 1

Output:
  raw/steamspy_data.csv   -- one row per AppID with SteamSpy fields

SteamSpy API: https://steamspy.com/api.php?request=appdetails&appid={id}
Rate limit: ~200 requests / 5 min. We use 4 concurrent workers each sleeping 6 sec
between their own requests, giving ~40 req/min total — within the limit.
"""

import time
import threading
import requests
import pandas as pd
from concurrent.futures import ThreadPoolExecutor, as_completed

RAW = "data/raw"
JOINED_FILE = f"{RAW}/mendeley_metacritic_joined.csv"
OUTPUT_FILE = f"{RAW}/steamspy_data.csv"

WORKERS = 4  # concurrent threads
SLEEP_SEC = 6.0  # each worker sleeps this long → 4 workers × (1/6 req/s) = ~40 req/min

_print_lock = threading.Lock()


def fetch_steamspy(app_id: int) -> dict | None:
    url = f"https://steamspy.com/api.php?request=appdetails&appid={app_id}"
    try:
        resp = requests.get(url, timeout=15)
        resp.raise_for_status()
        data = resp.json()
        # SteamSpy returns {"appid": null, "name": null} for unknown games
        if data.get("name") is None:
            return None
        return data
    except Exception as e:
        with _print_lock:
            print(f"  ERROR for AppID {app_id}: {e}")
        return None


def worker(app_id: int, max_retries: int = 3) -> dict | None:
    """Fetch with retry. On None/error, wait and retry up to max_retries times."""
    for attempt in range(1, max_retries + 1):
        result = fetch_steamspy(app_id)
        if result is not None:
            time.sleep(SLEEP_SEC)
            return result
        if attempt < max_retries:
            wait = SLEEP_SEC * attempt  # 6s, 12s, 18s
            with _print_lock:
                print(
                    f"  RETRY {attempt}/{max_retries} for AppID {app_id} (waiting {wait:.0f}s)"
                )
            time.sleep(wait)
    with _print_lock:
        print(f"  GIVING UP on AppID {app_id} after {max_retries} attempts")
    time.sleep(SLEEP_SEC)
    return None


# Load joined dataset to get list of AppIDs
joined = pd.read_csv(JOINED_FILE)
app_ids = joined["app_id"].dropna().astype(int).unique().tolist()
print(f"Fetching SteamSpy data for {len(app_ids)} AppIDs ...")
print(
    f"Estimated time: ~{len(app_ids) / (WORKERS / SLEEP_SEC) / 60:.1f} minutes with {WORKERS} workers"
)

# Resume support: if output already exists, skip already-fetched IDs
try:
    existing = pd.read_csv(OUTPUT_FILE)
    done_ids = set(existing["appid"].astype(int).tolist())
    print(
        f"  Resuming: {len(done_ids)} already fetched, {len(app_ids) - len(done_ids)} remaining"
    )
except FileNotFoundError:
    existing = None
    done_ids = set()

remaining = [aid for aid in app_ids if aid not in done_ids]

rows = []
completed = 0

with ThreadPoolExecutor(max_workers=WORKERS) as executor:
    futures = {executor.submit(worker, aid): aid for aid in remaining}
    for future in as_completed(futures):
        app_id = futures[future]
        completed += 1
        data = future.result()
        if data is not None:
            rows.append(
                {
                    "appid": app_id,
                    "ccu": data.get("ccu"),
                    "owners": data.get("owners"),
                    "average_forever": data.get("average_forever"),
                    "median_forever": data.get("median_forever"),
                    "positive": data.get("positive"),
                    "negative": data.get("negative"),
                    "steamspy_price": data.get("price"),  # in cents
                }
            )
            with _print_lock:
                print(
                    f"  [{completed}/{len(remaining)}] AppID {app_id}: ccu={data.get('ccu')}, owners={data.get('owners')}"
                )
        else:
            with _print_lock:
                print(
                    f"  [{completed}/{len(remaining)}] AppID {app_id}: no data returned"
                )

        # Save incrementally every 50 fetches so progress isn't lost on interrupt
        if completed % 50 == 0:
            checkpoint_df = pd.DataFrame(rows)
            if existing is not None:
                checkpoint_df = pd.concat([existing, checkpoint_df], ignore_index=True)
            checkpoint_df.to_csv(OUTPUT_FILE, index=False)
            with _print_lock:
                print(
                    f"  [checkpoint] saved {len(checkpoint_df)} rows to {OUTPUT_FILE}"
                )

# Combine with any previously fetched rows
new_df = pd.DataFrame(rows)
if existing is not None:
    final_df = pd.concat([existing, new_df], ignore_index=True)
else:
    final_df = new_df

final_df.to_csv(OUTPUT_FILE, index=False)
print(f"\nDone. {len(final_df)} total rows saved to {OUTPUT_FILE}")
