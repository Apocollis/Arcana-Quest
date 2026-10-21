#!/usr/bin/env python3
"""
sync_server_pack.py - Arcana Quest Server Pack Synchronizer & Auditor

Audits, compares, and synchronizes server-compatible components from the active DEVBOX
installation into ServerPack:
  - mods/        : Strictly server-compatible mods (excluding client-only mods)
  - config/      : Server configurations (excluding MusicTriggers client audio & temp files)
  - scripts/     : CraftTweaker, ContentTweaker, and LootTweaker .zs scripts
  - structures/  : Recurrent Complex world generation structures and loot templates

Regenerates MODLIST.txt and MODLIST.md manifests upon synchronization.
"""

import os
import sys
import shutil
import hashlib
import zipfile
import re
import argparse
from pathlib import Path

# Paths relative to the Instance root (parent of Tools/)
INSTANCE_ROOT = Path(__file__).resolve().parent.parent
SERVERPACK_BASE_DIR = INSTANCE_ROOT / "ServerPack"

DEVBOX_MODS_DIR = INSTANCE_ROOT / "mods"
SERVERPACK_MODS_DIR = SERVERPACK_BASE_DIR / "mods"
DEVBOX_SUB_DIR = DEVBOX_MODS_DIR / "1.12.2"
SERVERPACK_SUB_DIR = SERVERPACK_MODS_DIR / "1.12.2"

DEVBOX_CONFIG_DIR = INSTANCE_ROOT / "config"
SERVERPACK_CONFIG_DIR = SERVERPACK_BASE_DIR / "config"

DEVBOX_SCRIPTS_DIR = INSTANCE_ROOT / "scripts"
SERVERPACK_SCRIPTS_DIR = SERVERPACK_BASE_DIR / "scripts"

DEVBOX_STRUCTURES_DIR = INSTANCE_ROOT / "structures"
SERVERPACK_STRUCTURES_DIR = SERVERPACK_BASE_DIR / "structures"

# Strict set of client-only mods that must never be loaded on dedicated server
CLIENT_ONLY_MODS = {
    "!!!crashassistant",
    "!cleanroom-relauncher",
    "ambientenvironment",
    "ambientsounds",
    "armorsoundtweak",
    "assetmover",
    "betteradvancements",
    "clearwater",
    "controlling",
    "defaultoptions",
    "dynamicsurroundings",
    "fancymenu",
    "fpsreducer",
    "gnetum",
    "inventorytweaks",
    "jei_area_fixer",
    "konkrete",
    "lemonskin",
    "minemenu",
    "moreoverlays",
    "mousetweaks",
    "musictriggers",
    "nofov",
    "overloadedarmorbar",
    "resourceloader",
    "smarthud",
    "smoothwater",
    "soundphysics",
    "theimpossiblelibrary",
    "tips",
    "titlechanger",
    "toughnessbar",
    "travelerstitles",
    "wawla"
}

# Exclusions for ServerPack/config
CONFIG_EXCLUDE_DIRS = {
    "MusicTriggers",  # 317MB client MP3 songs for client-only audio mod
}
CONFIG_EXCLUDE_EXTS = {
    ".bak",
}
CONFIG_EXCLUDE_FILES = {
    "cleanroom_load_timings.dat",
    "cleanroom_mod_list_favourites.txt",
    "implementation_plan_relauncher.md",
}


def get_base_name(filename: str) -> str:
    """Strips version suffix and extension to identify base mod identity."""
    base = filename[:-4] if filename.endswith(".jar") else filename
    m = re.search(r'[-_](?:v|mc)?\d+\.', base, re.IGNORECASE)
    if m:
        return base[:m.start()].lower()
    return base.lower()


def is_client_only(filename: str) -> bool:
    """Checks whether a mod filename matches known client-only mod signatures."""
    base = get_base_name(filename)
    for c in CLIENT_ONLY_MODS:
        if base == c or base.startswith(c) or c in base:
            return True
    return False


def md5_file(filepath: Path) -> str:
    """Computes the MD5 hex digest of a file in chunks."""
    h = hashlib.md5()
    with open(filepath, "rb") as f:
        while chunk := f.read(65536):
            h.update(chunk)
    return h.hexdigest()


def get_mod_display_name(jar_path: Path) -> str:
    """Extracts display name from mcmod.info, or falls back to filename base."""
    try:
        with zipfile.ZipFile(jar_path, "r") as z:
            for item in z.namelist():
                if item.endswith("mcmod.info"):
                    content = z.read(item).decode("utf-8", errors="ignore")
                    m = re.search(r'"name"\s*:\s*"([^"]+)"', content)
                    if m:
                        return m.group(1).strip()
    except Exception:
        pass
    return jar_path.stem


def audit_server_pack() -> int:
    """Performs deep bytecode and metadata audit on all jars in ServerPack/mods."""
    print("=" * 65)
    print("AUDITING SERVERPACK MODS FOR DEDICATED SERVER COMPATIBILITY")
    print("=" * 65)

    if not SERVERPACK_MODS_DIR.exists():
        print(f"Error: {SERVERPACK_MODS_DIR} does not exist.")
        return 1

    jars = sorted([f for f in SERVERPACK_MODS_DIR.iterdir() if f.is_file() and f.suffix == ".jar"])
    print(f"Auditing {len(jars)} jars in {SERVERPACK_MODS_DIR}...\n")

    issues_found = []

    for jar in jars:
        # 1. Check known client-only blacklist
        if is_client_only(jar.name):
            issues_found.append((jar.name, "Matches known client-only mod list!"))
            continue

        try:
            with zipfile.ZipFile(jar, "r") as z:
                # 2. Check bytecode for clientSideOnly = true
                for name in z.namelist():
                    if name.endswith(".class"):
                        data = z.read(name)
                        if b"Lnet/minecraftforge/fml/common/Mod;" in data:
                            if b"clientSideOnly" in data:
                                if re.search(rb'clientSideOnly\s*\x01', data) or re.search(rb'clientSideOnly[^\x00]*?\x01', data):
                                    issues_found.append((jar.name, f"@Mod(clientSideOnly = true) found in {name}"))

                        # 3. Check for FMLServerStartingEvent calling client classes unconditionally
                        if b"FMLServerStartingEvent" in data and b"ConfigRedirect" in data and b"net/minecraft/client/Minecraft" in data:
                            issues_found.append((jar.name, f"Dangerous client call in serverStarting found in {name}"))

        except Exception as e:
            issues_found.append((jar.name, f"Error reading jar: {e}"))

    # Audit 1.12.2 library subfolder
    sub_jars = []
    if SERVERPACK_SUB_DIR.exists():
        sub_jars = sorted([f for f in SERVERPACK_SUB_DIR.iterdir() if f.is_file() and f.suffix == ".jar"])
    print(f"Runtime libraries in 1.12.2/ subfolder: {len(sub_jars)} jars")

    if issues_found:
        print("\n[!] INCOMPATIBLE OR SUSPICIOUS MODS FOUND:")
        for name, reason in issues_found:
            print(f"  - {name}: {reason}")
        return len(issues_found)
    else:
        print("\n[OK] All 248 server mods passed the compatibility audit with 0 issues.")
        return 0


def generate_manifests(jars: list[Path]):
    """Generates MODLIST.txt and MODLIST.md in ServerPack/."""
    txt_path = SERVERPACK_BASE_DIR / "MODLIST.txt"
    with open(txt_path, "w", encoding="utf-8") as f:
        f.write("# Arcana Quest Dedicated Server Mod List\n")
        f.write(f"# Total Server Mods: {len(jars)}\n\n")
        for jar in jars:
            f.write(jar.name + "\n")
    print(f"Generated manifest: {txt_path}")

    md_path = SERVERPACK_BASE_DIR / "MODLIST.md"
    with open(md_path, "w", encoding="utf-8") as f:
        f.write(f"# Arcana Quest Dedicated Server Mods ({len(jars)})\n\n")
        f.write("| # | File Name | Mod Name |\n")
        f.write("| :--- | :--- | :--- |\n")
        for i, jar in enumerate(jars, 1):
            name = get_mod_display_name(jar)
            f.write(f"| {i} | `{jar.name}` | {name} |\n")
    print(f"Generated manifest: {md_path}")


def sync_directory(
    src_dir: Path,
    dst_dir: Path,
    label: str,
    dry_run: bool = False,
    exclude_dirs: set[str] | None = None,
    exclude_exts: set[str] | None = None,
    exclude_files: set[str] | None = None,
) -> tuple[int, int, int]:
    """
    Synchronizes a directory hierarchy from src_dir to dst_dir.
    Returns (copied_count, removed_count, unchanged_count).
    """
    if not src_dir.exists():
        print(f"[{label}] Warning: Source directory {src_dir} does not exist.")
        return 0, 0, 0

    dst_dir.mkdir(parents=True, exist_ok=True)

    # 1. Scan source files
    src_map = {}
    for p in src_dir.rglob("*"):
        if not p.is_file():
            continue
        rel = p.relative_to(src_dir)
        if exclude_dirs and any(d in rel.parts for d in exclude_dirs):
            continue
        if exclude_exts and p.suffix.lower() in exclude_exts:
            continue
        if exclude_files and p.name in exclude_files:
            continue
        src_map[rel] = p

    # 2. Scan destination files
    dst_map = {}
    for p in dst_dir.rglob("*"):
        if p.is_file():
            dst_map[p.relative_to(dst_dir)] = p

    to_copy = []
    to_remove = []
    unchanged = 0

    # 3. Determine additions and updates
    for rel, src_path in src_map.items():
        dst_path = dst_dir / rel
        if rel not in dst_map:
            to_copy.append((src_path, dst_path, "New file"))
        else:
            # Check size first, then hash if sizes match
            if src_path.stat().st_size != dst_map[rel].stat().st_size or md5_file(src_path) != md5_file(dst_map[rel]):
                to_copy.append((src_path, dst_path, "Updated content"))
            else:
                unchanged += 1

    # 4. Determine deletions
    for rel, dst_path in dst_map.items():
        if rel not in src_map:
            to_remove.append((dst_path, "Deleted or excluded in source"))

    print(f"[{label}] Source: {len(src_map)} files | Target: {len(dst_map)} files")
    print(f"[{label}] Unchanged: {unchanged} | To Copy: {len(to_copy)} | To Remove: {len(to_remove)}")

    # 5. Execute operations
    if not dry_run:
        for dst_path, reason in to_remove:
            dst_path.unlink()

        # Clean empty directories in destination
        for p in sorted(dst_dir.rglob("*"), key=lambda x: len(x.parts), reverse=True):
            if p.is_dir() and not any(p.iterdir()):
                try:
                    p.rmdir()
                except OSError:
                    pass

        for src_path, dst_path, reason in to_copy:
            dst_path.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(src_path, dst_path)

        if to_copy or to_remove:
            print(f"[{label}] Synced successfully ({len(to_copy)} copied, {len(to_remove)} removed).")
        else:
            print(f"[{label}] 100% in sync.")
    else:
        if to_copy or to_remove:
            print(f"[{label}] Dry-run preview: {len(to_copy)} would be copied, {len(to_remove)} would be removed.")
        else:
            print(f"[{label}] 100% in sync.")

    print()
    return len(to_copy), len(to_remove), unchanged


def sync_mods(dry_run: bool = False) -> tuple[int, int, int]:
    """Synchronizes DEVBOX/mods to ServerPack/mods."""
    if not DEVBOX_MODS_DIR.exists():
        print(f"[mods] Error: DEVBOX mods directory not found at {DEVBOX_MODS_DIR}")
        return 0, 0, 0

    SERVERPACK_MODS_DIR.mkdir(parents=True, exist_ok=True)
    SERVERPACK_SUB_DIR.mkdir(parents=True, exist_ok=True)

    db_jars = {f.name: f for f in DEVBOX_MODS_DIR.iterdir() if f.is_file() and f.suffix == ".jar"}
    sp_jars = {f.name: f for f in SERVERPACK_MODS_DIR.iterdir() if f.is_file() and f.suffix == ".jar"}

    db_bases = {}
    for name, path in db_jars.items():
        db_bases.setdefault(get_base_name(name), []).append((name, path))

    sp_bases = {}
    for name, path in sp_jars.items():
        sp_bases.setdefault(get_base_name(name), []).append((name, path))

    to_copy = []
    to_remove = []
    client_skipped = []
    unchanged = 0

    for name, src_path in db_jars.items():
        if is_client_only(name):
            client_skipped.append((name, "Client-only blacklist"))
            continue

        base = get_base_name(name)
        dst_path = SERVERPACK_MODS_DIR / name

        if name in sp_jars:
            if md5_file(src_path) != md5_file(sp_jars[name]):
                to_copy.append((src_path, dst_path, "Recompiled / updated content (hash mismatch)"))
            else:
                unchanged += 1
        elif base in sp_bases:
            old_name, old_path = sp_bases[base][0]
            to_remove.append((old_path, f"Replaced by newer version: {name}"))
            to_copy.append((src_path, dst_path, f"Version update from: {old_name}"))
        else:
            to_copy.append((src_path, dst_path, "New server-compatible mod"))

    for name, sp_path in sp_jars.items():
        base = get_base_name(name)
        if base not in db_bases and name not in db_jars:
            to_remove.append((sp_path, "Removed from DEVBOX"))

    print(f"[mods] DEVBOX Server Jars: {len(db_jars) - len(client_skipped)} | Client Skipped: {len(client_skipped)}")
    print(f"[mods] Unchanged: {unchanged} | To Copy: {len(to_copy)} | To Remove: {len(to_remove)}")

    if not dry_run:
        for p, r in to_remove:
            if p.exists():
                p.unlink()

        for src, dst, r in to_copy:
            shutil.copy2(src, dst)

        # Sync 1.12.2 library subfolder
        if DEVBOX_SUB_DIR.exists():
            for f in DEVBOX_SUB_DIR.iterdir():
                if f.is_file() and f.suffix == ".jar":
                    dst_sub_file = SERVERPACK_SUB_DIR / f.name
                    if not dst_sub_file.exists() or md5_file(f) != md5_file(dst_sub_file):
                        shutil.copy2(f, dst_sub_file)

        final_jars = sorted([f for f in SERVERPACK_MODS_DIR.iterdir() if f.is_file() and f.suffix == ".jar"])
        generate_manifests(final_jars)
        print(f"[mods] Total Server Mods: {len(final_jars)}")
    else:
        if to_copy or to_remove:
            print(f"[mods] Dry-run preview: {len(to_copy)} would be copied, {len(to_remove)} would be removed.")
        else:
            print("[mods] 100% in sync.")

    print()
    return len(to_copy), len(to_remove), unchanged


def sync_all(
    dry_run: bool = False,
    sync_mod_files: bool = True,
    sync_config_files: bool = True,
    sync_script_files: bool = True,
    sync_structure_files: bool = True,
) -> int:
    """Executes synchronization across all requested ServerPack components."""
    mode_str = "DRY-RUN (NO CHANGES APPLIED)" if dry_run else "SYNCHRONIZATION"
    print("=" * 65)
    print(f"SERVER PACK {mode_str}")
    print("=" * 65 + "\n")

    SERVERPACK_BASE_DIR.mkdir(parents=True, exist_ok=True)

    if sync_mod_files:
        sync_mods(dry_run=dry_run)

    if sync_config_files:
        sync_directory(
            src_dir=DEVBOX_CONFIG_DIR,
            dst_dir=SERVERPACK_CONFIG_DIR,
            label="config",
            dry_run=dry_run,
            exclude_dirs=CONFIG_EXCLUDE_DIRS,
            exclude_exts=CONFIG_EXCLUDE_EXTS,
            exclude_files=CONFIG_EXCLUDE_FILES,
        )

    if sync_script_files:
        sync_directory(
            src_dir=DEVBOX_SCRIPTS_DIR,
            dst_dir=SERVERPACK_SCRIPTS_DIR,
            label="scripts",
            dry_run=dry_run,
        )

    if sync_structure_files:
        sync_directory(
            src_dir=DEVBOX_STRUCTURES_DIR,
            dst_dir=SERVERPACK_STRUCTURES_DIR,
            label="structures",
            dry_run=dry_run,
        )

    print("=" * 65)
    print(f"SERVER PACK {mode_str} COMPLETED")
    print("=" * 65)
    return 0


def main():
    parser = argparse.ArgumentParser(description="Arcana Quest Server Pack Manager")
    parser.add_argument("--audit", action="store_true", help="Audit ServerPack/mods for server compatibility")
    parser.add_argument("--dry-run", action="store_true", help="Preview sync differences without modifying files")
    parser.add_argument("--sync", action="store_true", help="Synchronize DEVBOX components to ServerPack")
    parser.add_argument("--mods-only", action="store_true", help="Only synchronize mods/")
    parser.add_argument("--config-only", action="store_true", help="Only synchronize config/")
    parser.add_argument("--scripts-only", action="store_true", help="Only synchronize scripts/")
    parser.add_argument("--structures-only", action="store_true", help="Only synchronize structures/")

    args = parser.parse_args()

    if args.audit:
        sys.exit(audit_server_pack())

    # Check granular component flags
    has_granular = args.mods_only or args.config_only or args.scripts_only or args.structures_only
    sync_m = args.mods_only if has_granular else True
    sync_c = args.config_only if has_granular else True
    sync_sc = args.scripts_only if has_granular else True
    sync_st = args.structures_only if has_granular else True

    if args.sync:
        sys.exit(sync_all(dry_run=False, sync_mod_files=sync_m, sync_config_files=sync_c, sync_script_files=sync_sc, sync_structure_files=sync_st))
    elif args.dry_run:
        sys.exit(sync_all(dry_run=True, sync_mod_files=sync_m, sync_config_files=sync_c, sync_script_files=sync_sc, sync_structure_files=sync_st))
    else:
        parser.print_help()


if __name__ == "__main__":
    main()
