import json
import os
import re

# Resolve project folders dynamically relative to the script location
script_dir = os.path.dirname(os.path.abspath(__file__))
project_root = os.path.dirname(script_dir)
aq_dir = os.path.join(project_root, "config", "ArcanaQuest")
incontrol_dir = os.path.join(project_root, "config", "incontrol")

def load_lenient_json(filepath):
    with open(filepath, "r") as f:
        content = f.read()
    content = re.sub(r'//.*$', '', content, flags=re.MULTILINE)
    content = re.sub(r'/\*.*?\*/', '', content, flags=re.DOTALL)
    content = re.sub(r',\s*([\]}])', r'\1', content)
    return json.loads(content)

# File paths
disabled_path = os.path.join(aq_dir, "disabled_mobs.json")
tier_path = os.path.join(aq_dir, "mob_tier.json")
biometypes_path = os.path.join(aq_dir, "mob_biometypes.json")
extraspawns_path = os.path.join(aq_dir, "mob_extraspawns.json")
potentialspawn_path = os.path.join(incontrol_dir, "potentialspawn.json")
spawn_path = os.path.join(incontrol_dir, "spawn_limits.json")
if not os.path.exists(spawn_path):
    spawn_path = os.path.join(incontrol_dir, "spawn.json")

# Load active config data
disabled = set(load_lenient_json(disabled_path))
tier = load_lenient_json(tier_path)
biometypes = load_lenient_json(biometypes_path)
extraspawns = load_lenient_json(extraspawns_path) or {}
extraspawns_mobs = set(sum(extraspawns.values(), []))
potentialspawn = load_lenient_json(potentialspawn_path)
spawn = load_lenient_json(spawn_path)

# Load spawn rules limit values from mob_spawnrules.cfg
def load_spawnrules_cfg(filepath):
    defaults = {
        "common": 16,
        "uncommon": 10,
        "rare": 5,
        "elite": 3,
        "deadly": 1,
        "dragon": 1,
        "boss": 1,
        "du_tier1_maxheight": 55,
        "du_tier1_healthmultiply": 1.5,
        "du_tier1_damagemultiply": 1.5,
        "du_tier2_maxheight": 30,
        "du_tier2_healthmultiply": 2.0,
        "du_tier2_damagemultiply": 1.75,
        "du_tier2_potion": "minecraft:night_vision,999999,0",
        "du_tier3_maxheight": 0,
        "du_tier3_healthmultiply": 2.5,
        "du_tier3_damagemultiply": 2.5,
        "du_tier3_armoradd": 12.0,
        "du_tier3_potion": "minecraft:night_vision,999999,0",
        "du_tier3_deadly_potion": "dynamicstealth:soulsight,999999,0"
    }
    if not os.path.exists(filepath):
        print("mob_spawnrules.cfg not found, using script defaults.")
        return defaults
    
    try:
        with open(filepath, "r", encoding="utf-8") as f:
            text = f.read()
        
        for line in text.split("\n"):
            line = line.strip()
            if line.startswith("I:") and "=" in line:
                key, val = line[2:].split("=", 1)
                key = key.strip().lower()
                if key.endswith("_limit"):
                    tier_name = key[:-6]
                    defaults[tier_name] = int(val.strip())
                else:
                    defaults[key] = int(val.strip())
            elif line.startswith("D:") and "=" in line:
                key, val = line[2:].split("=", 1)
                defaults[key.strip().lower()] = float(val.strip())
            elif line.startswith("S:") and "=" in line:
                key, val = line[2:].split("=", 1)
                defaults[key.strip().lower()] = val.strip()
        
        print("Successfully loaded spawn rules limits from mob_spawnrules.cfg")
    except Exception as e:
        print(f"Error parsing mob_spawnrules.cfg: {e}. Using script defaults.")
    
    return defaults

cfg_path = os.path.join(aq_dir, "mob_spawnrules.cfg")
tier_limits = load_spawnrules_cfg(cfg_path)

mob_tier_map = {}
for tname, mobs in tier.items():
    for m in mobs:
        mob_tier_map[m] = tname

print("--- ALIGNMENT REPORT (INCONTROL VS ARCANAQUEST CONFIGS) ---\n")

# A. potentialspawn.json check
# Verify that all active mobs in mob_biometypes have a potentialspawn entry
active_biometype_mobs = set()
for category, mobs in biometypes.items():
    for m in mobs:
        if m not in disabled:
            active_biometype_mobs.add(m)

# Find mobs listed in potentialspawn
potentialspawn_mobs = set()
dim_mismatches = []
biome_mismatches = []

# Gather expected dimensions and biomes for each mob
expected_spawns = {}
for category, mobs in biometypes.items():
    for m in mobs:
        if m in disabled or m in extraspawns_mobs:
            continue
        if m not in expected_spawns:
            expected_spawns[m] = {"dims": set(), "biomes": set()}
        
        if category == "nether":
            expected_spawns[m]["dims"].add(-1)
        elif category == "end":
            expected_spawns[m]["dims"].add(1)
        elif category == "beneath" or category == "dark":
            expected_spawns[m]["dims"].add(10)
        elif category == "any":
            expected_spawns[m]["dims"].add(0)
        else:
            # Overworld biomes category
            expected_spawns[m]["dims"].add(0)
            # Resolve biomes from biome_mappings
            mappings = load_lenient_json(os.path.join(aq_dir, "biome_mappings.json"))
            biomes = mappings.get(category, [])
            for b in biomes:
                expected_spawns[m]["biomes"].add(b)

def get_biome_display_name(registry_name):
    overrides = {
        "minecraft:sky": "The End",
        "minecraft:hell": "Hell",
        "minecraft:swampland": "Swampland",
        "minecraft:extreme_hills": "Extreme Hills",
        "minecraft:extreme_hills_with_trees": "Extreme Hills+",
        "minecraft:smaller_extreme_hills": "Smaller Extreme Hills",
        "minecraft:extreme_hills_edge": "Extreme Hills Edge",
        "minecraft:ice_flats": "Ice Plains",
        "minecraft:ice_mountains": "Ice Mountains",
        "minecraft:frozen_ocean": "Frozen Ocean",
        "minecraft:frozen_river": "Frozen River",
        "minecraft:mushroom_island": "Mushroom Island",
        "minecraft:mushroom_island_shore": "Mushroom Island Shore",
        "minecraft:beaches": "Beach",
        "minecraft:desert_hills": "Desert Hills",
        "minecraft:forest_hills": "Forest Hills",
        "minecraft:taiga_hills": "Taiga Hills",
        "minecraft:jungle_hills": "Jungle Hills",
        "minecraft:jungle_edge": "Jungle Edge",
        "minecraft:deep_ocean": "Deep Ocean",
        "minecraft:stone_beach": "Stone Beach",
        "minecraft:cold_beach": "Cold Beach",
        "minecraft:birch_forest": "Birch Forest",
        "minecraft:birch_forest_hills": "Birch Forest Hills",
        "minecraft:roofed_forest": "Roofed Forest",
        "minecraft:taiga_cold": "Cold Taiga",
        "minecraft:taiga_cold_hills": "Cold Taiga Hills",
        "minecraft:redwood_taiga": "Mega Taiga",
        "minecraft:redwood_taiga_hills": "Mega Taiga Hills",
        "minecraft:savanna_rock": "Savanna M",
        "minecraft:mesa_rock": "Mesa Plateau F",
        "minecraft:mesa_clear_rock": "Mesa Plateau",
        "minecraft:void": "The Void",
        "minecraft:mutated_plains": "Sunflower Plains",
        "minecraft:mutated_desert": "Desert M",
        "minecraft:mutated_extreme_hills": "Extreme Hills M",
        "minecraft:mutated_forest": "Flower Forest",
        "minecraft:mutated_taiga": "Taiga M",
        "minecraft:mutated_swampland": "Swampland M",
        "minecraft:mutated_ice_flats": "Ice Plains Spikes",
        "minecraft:mutated_jungle": "Jungle M",
        "minecraft:mutated_jungle_edge": "Jungle Edge M",
        "minecraft:mutated_birch_forest": "Birch Forest M",
        "minecraft:mutated_birch_forest_hills": "Birch Forest Hills M",
        "minecraft:mutated_roofed_forest": "Roofed Forest M",
        "minecraft:mutated_taiga_cold": "Cold Taiga M",
        "minecraft:mutated_redwood_taiga": "Mega Spruce Taiga",
        "minecraft:mutated_redwood_taiga_hills": "Redwood Taiga Hills M",
        "minecraft:mutated_extreme_hills_with_trees": "Extreme Hills+ M",
        "minecraft:mutated_savanna": "Savanna M",
        "minecraft:mutated_savanna_rock": "Savanna Plateau M",
        "minecraft:mutated_mesa": "Mesa (Bryce)",
        "minecraft:mutated_mesa_rock": "Mesa Plateau F M",
        "minecraft:mutated_mesa_clear_rock": "Mesa Plateau M",
    }
    if registry_name in overrides:
        return overrides[registry_name]
    name_part = registry_name.split(":")[-1]
    words = name_part.split("_")
    return " ".join(w.capitalize() for w in words)

actual_spawns = {}
for rule in potentialspawn:
    dim = rule.get("dimension")
    # Resolve dims
    dims_list = dim if isinstance(dim, list) else [dim] if dim is not None else [0]
    
    biomes_list = rule.get("biomereg", []) if "biomereg" in rule else rule.get("biome", [])
    if not isinstance(biomes_list, list):
        biomes_list = [biomes_list]
        
    mobs_in_rule = rule.get("mobs", [])
    for m_entry in mobs_in_rule:
        m = m_entry.get("mob")
        potentialspawn_mobs.add(m)
        if m not in actual_spawns:
            actual_spawns[m] = {"dims": set(), "biomes": set()}
        for d in dims_list:
            actual_spawns[m]["dims"].add(d)
        for b in biomes_list:
            actual_spawns[m]["biomes"].add(b)

missing_potentialspawns = set(m for m in (active_biometype_mobs - potentialspawn_mobs) if not m.startswith("minecraft:"))
if not missing_potentialspawns:
    print("## A. Biome and Dimension Spawning Verification")
    print("PASS: All active mobs in mob_biometypes.json have spawn rules in potentialspawn.json.\n")
else:
    print("## A. Biome and Dimension Spawning Verification")
    print(f"FAIL: {len(missing_potentialspawns)} active mobs are missing spawn rules in potentialspawn.json:")
    for m in sorted(missing_potentialspawns):
        print(f"  - {m}")
    print()

# Check for mismatches
for m, expected in expected_spawns.items():
    if m not in actual_spawns:
        continue
    actual = actual_spawns[m]
    
    # Check dims
    if expected["dims"] != actual["dims"]:
        dim_mismatches.append((m, sorted(list(expected["dims"])), sorted(list(actual["dims"]))))
        
    # Check biomes (only for Overworld)
    if 0 in expected["dims"]:
        missing_biomes = expected["biomes"] - actual["biomes"]
        if missing_biomes:
            biome_mismatches.append((m, sorted(list(missing_biomes))))

if dim_mismatches:
    print("Dimension Mismatches ({}):".format(len(dim_mismatches)))
    for m, exp, act in sorted(dim_mismatches):
        print(f"  - {m}: Expected {exp}, got {act}")
    print()

if biome_mismatches:
    print("Biome Mismatches ({}):".format(len(biome_mismatches)))
    for m, missing in sorted(biome_mismatches):
        print(f"  - {m}:")
        print(f"    - Missing expected: {missing}")
    print()

# B. potentialspawn.json maxcount check
# Verify all active tiered mobs have maxcount caps matching their tier limits in potentialspawn.json
active_tiered_mobs = set()
for tname, mobs in tier.items():
    for m in mobs:
        if m not in disabled and m in active_biometype_mobs:
            active_tiered_mobs.add(m)

pot_path = os.path.join(incontrol_dir, "potentialspawn.json")
pot_rules = load_lenient_json(pot_path)

pot_maxcounts = {}
for rule in pot_rules:
    # Skip depths pool rules when checking baseline tier limits
    if "maxheight" in rule:
        continue
    mc = rule.get("maxcount")
    if isinstance(mc, dict) and mc.get("perplayer") is True:
        mob = mc.get("mob")
        amount = mc.get("amount")
        if mob:
            pot_maxcounts[mob] = amount

missing_limits = []
limit_value_mismatches = []

types_path = os.path.join(aq_dir, "mob_types.json")
mob_types = load_lenient_json(types_path)
cultist_mobs = mob_types.get("cultist", ["thaumcraft:cultistknight", "thaumcraft:cultistcleric", "crimsonrevelations:cultist_archer"])

extraspawns_path = os.path.join(aq_dir, "mob_extraspawns.json")
extraspawns = load_lenient_json(extraspawns_path)
extraspawns_mobs = set(sum(extraspawns.values(), []))

for m in active_tiered_mobs:
    if m in cultist_mobs or m in extraspawns_mobs:
        continue
    
    t = mob_tier_map.get(m)
    exp_limit = tier_limits[t]
    
    if m not in pot_maxcounts:
        missing_limits.append((m, "missing maxcount in potentialspawn.json"))
    elif pot_maxcounts[m] != exp_limit:
        limit_value_mismatches.append((m, t, "potentialspawn maxcount", exp_limit, pot_maxcounts[m]))

print("## B. Spawn Caps (potentialspawn.json maxcount) Verification")
if not missing_limits:
    print("PASS: All active tiered mobs have maxcount caps in potentialspawn.json.")
else:
    print(f"FAIL: {len(missing_limits)} active tiered mobs are missing maxcount caps in potentialspawn.json:")
    for m, reason in sorted(missing_limits):
        print(f"  - {m}: {reason}")

if not limit_value_mismatches:
    print("PASS: All active tiered mobs have the correct maxcount caps matching their tier.\n")
else:
    print(f"FAIL: {len(limit_value_mismatches)} mobs have incorrect maxcount caps in potentialspawn.json:")
    for m, t, rtype, exp, act in sorted(limit_value_mismatches):
        print(f"  - {m} ({t}) [{rtype}]: Expected {exp}, got {act}")
        print(f"  - {m} ({t}) [{rtype}]: Expected {exp}, got {act}")
    print()
