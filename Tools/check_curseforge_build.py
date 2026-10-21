#!/usr/bin/env python3
"""
check_curseforge_build.py - Audit local mod files against CurseForge releases

Queries the public CFWidget API to retrieve the exact published file size (in bytes),
filename, and File ID for one or more CurseForge mods, then compares them against
the installed .jar files in DEVBOX/mods/ to verify release parity.
"""

import os
import sys
import re
import json
import urllib.request
import argparse
from pathlib import Path

INSTANCE_ROOT = Path(__file__).resolve().parent.parent
MODS_DIR = INSTANCE_ROOT / "mods"

# Default custom / first-party mods in Arcana Quest
DEFAULT_SLUGS = [
    "arcana-quest-tweaks",
    "chunksteward"
]


def extract_slug(input_str: str) -> str:
    """Extracts the mod slug from a full CurseForge URL or raw slug string."""
    input_str = input_str.strip()
    # Match URL pattern like .../mc-mods/<slug>/... or .../mc-mods/<slug>
    m = re.search(r'/mc-mods/([a-zA-Z0-9_\-]+)', input_str)
    if m:
        return m.group(1).lower()
    # Or just strip any trailing slashes or queries
    slug = input_str.split('?')[0].split('#')[0].rstrip('/')
    return slug.lower()


def fetch_curseforge_info(slug: str) -> dict:
    """Fetches mod info and files list from CFWidget API."""
    url = f"https://api.cfwidget.com/minecraft/mc-mods/{slug}"
    req = urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64)"})
    try:
        with urllib.request.urlopen(req, timeout=10) as resp:
            return json.loads(resp.read().decode("utf-8"))
    except Exception as e:
        return {"error": str(e)}


def find_local_jar(slug: str, cf_filename: str = None) -> Path | None:
    """Attempts to find the matching .jar file in DEVBOX/mods/."""
    if not MODS_DIR.exists():
        return None

    # 1. If we know the exact CurseForge filename, check for it directly
    if cf_filename:
        exact = MODS_DIR / cf_filename
        if exact.exists():
            return exact

    # 2. Match by normalized base name / slug keywords
    slug_clean = slug.replace("-", "").replace("_", "").lower()
    candidates = []
    for jar in MODS_DIR.iterdir():
        if jar.is_file() and jar.suffix == ".jar":
            j_clean = jar.stem.replace("-", "").replace("_", "").lower()
            if slug_clean in j_clean or j_clean in slug_clean:
                candidates.append(jar)

    if candidates:
        # Return most recently modified candidate
        candidates.sort(key=lambda x: x.stat().st_mtime, reverse=True)
        return candidates[0]

    return None


def audit_slug(slug_input: str) -> dict:
    """Audits a single mod slug against local mods/."""
    slug = extract_slug(slug_input)
    print(f"Fetching CurseForge info for: {slug}...")

    cf_data = fetch_curseforge_info(slug)
    if "error" in cf_data:
        return {
            "slug": slug,
            "status": "API_ERROR",
            "error": cf_data["error"]
        }

    title = cf_data.get("title", slug)
    files = cf_data.get("files", [])
    if not files:
        return {
            "slug": slug,
            "title": title,
            "status": "NO_FILES_FOUND",
            "error": "No files listed on CurseForge"
        }

    # Latest file is typically the first entry in files list
    latest_cf_file = files[0]
    cf_name = latest_cf_file.get("name", "")
    cf_size = latest_cf_file.get("filesize", 0)
    cf_id = latest_cf_file.get("id", "")
    cf_version = latest_cf_file.get("version", "")

    local_jar = find_local_jar(slug, cf_name)

    if not local_jar:
        return {
            "slug": slug,
            "title": title,
            "status": "LOCAL_FILE_MISSING",
            "cf_name": cf_name,
            "cf_size": cf_size,
            "cf_id": cf_id,
            "cf_version": cf_version
        }

    local_size = local_jar.stat().st_size
    local_name = local_jar.name

    size_match = (local_size == cf_size)
    name_match = (local_name == cf_name)

    if size_match and name_match:
        status = "MATCH (Official Release)"
    elif size_match and not name_match:
        status = "SIZE_MATCH (Different Filename)"
    elif not size_match and name_match:
        status = "BYTE_MISMATCH (Dev / Recompiled Build)"
    else:
        status = "MISMATCH (Both Name and Size Differ)"

    return {
        "slug": slug,
        "title": title,
        "status": status,
        "local_name": local_name,
        "local_size": local_size,
        "cf_name": cf_name,
        "cf_size": cf_size,
        "cf_id": cf_id,
        "cf_version": cf_version,
        "size_diff": local_size - cf_size
    }


def print_report(results: list[dict]):
    """Prints a structured comparison table in terminal."""
    print("\n" + "=" * 90)
    print("CURSEFORGE BUILD AUDIT RESULTS")
    print("=" * 90)

    for res in results:
        slug = res.get("slug", "unknown")
        status = res.get("status", "")
        title = res.get("title", slug)

        print(f"\nMod: {title} ({slug})")
        print(f"Status: {status}")

        if "error" in res:
            print(f"  Error: {res['error']}")
            continue

        if status == "LOCAL_FILE_MISSING":
            print(f"  CurseForge File: {res['cf_name']} ({res['cf_size']:,} bytes) [ID: {res['cf_id']}]")
            print(f"  Local File:      NOT FOUND in {MODS_DIR}")
            continue

        print(f"  Local File:       {res['local_name']} ({res['local_size']:,} bytes)")
        print(f"  CurseForge File:  {res['cf_name']} ({res['cf_size']:,} bytes) [ID: {res['cf_id']}]")

        if res["local_size"] != res["cf_size"]:
            diff = res["size_diff"]
            diff_str = f"+{diff:,} bytes" if diff > 0 else f"{diff:,} bytes"
            print(f"  Difference:       {diff_str} (Local file differs from CurseForge release)")
        else:
            print(f"  Byte Check:       Exact match (100% byte parity)")

    print("\n" + "=" * 90)


def main():
    parser = argparse.ArgumentParser(description="Audit local mod files against CurseForge releases by byte count")
    parser.add_argument("mods", nargs="*", help="Mod slugs or CurseForge URLs to check")
    parser.add_argument("--all", action="store_true", help="Check all default pack custom mods")

    args = parser.parse_args()

    slugs_to_check = args.mods
    if not slugs_to_check or args.all:
        slugs_to_check = DEFAULT_SLUGS

    results = [audit_slug(slug) for slug in slugs_to_check]
    print_report(results)


if __name__ == "__main__":
    main()
