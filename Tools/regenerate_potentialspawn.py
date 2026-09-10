import json
import os
import re

# Resolve project folders dynamically relative to the script location
script_dir = os.path.dirname(os.path.abspath(__file__))
project_root = os.path.dirname(script_dir)
aq_dir = os.path.join(project_root, "config", "arcanaquest")
if not os.path.exists(aq_dir):
    aq_dir = os.path.join(project_root, "config", "ArcanaQuest")
incontrol_dir = os.path.join(project_root, "config", "incontrol")

def load_lenient_json(filepath):
    with open(filepath, "r") as f:
        content = f.read()
    content = re.sub(r'//.*$', '', content, flags=re.MULTILINE)
    content = re.sub(r'/\*.*?\*/', '', content, flags=re.DOTALL)
    content = re.sub(r',\s*([\]}])', r'\1', content)
    return json.loads(content)

def load_spawnrules_cfg(filepath):
    # Tuned defaults with limit
    defaults = {
        "common": {"weight": 100, "groupcountmin": 2, "groupcountmax": 4, "limit": 16},
        "uncommon": {"weight": 60, "groupcountmin": 1, "groupcountmax": 3, "limit": 10},
        "rare": {"weight": 20, "groupcountmin": 1, "groupcountmax": 1, "limit": 5},
        "elite": {"weight": 10, "groupcountmin": 1, "groupcountmax": 1, "limit": 3},
        "deadly": {"weight": 7, "groupcountmin": 1, "groupcountmax": 1, "limit": 1},
        "dragon": {"weight": 5, "groupcountmin": 1, "groupcountmax": 1, "limit": 1},
        "boss": {"weight": 1, "groupcountmin": 1, "groupcountmax": 1, "limit": 1}
    }
    if not os.path.exists(filepath):
        print("mob_spawnrules.cfg not found, using script defaults.")
        return defaults
    
    try:
        with open(filepath, "r", encoding="utf-8") as f:
            text = f.read()
        
        # Parse I:tier_param=val
        pattern = re.compile(r'I:([a-zA-Z]+)_([a-zA-Z_]+)\s*=\s*(\d+)')
        parsed = {}
        for match in pattern.finditer(text):
            tier_name = match.group(1).lower()
            param_name = match.group(2).lower()
            value = int(match.group(3))
            
            if tier_name not in parsed:
                parsed[tier_name] = {}
            
            if param_name == "weight":
                parsed[tier_name]["weight"] = value
            elif param_name == "group_min":
                parsed[tier_name]["groupcountmin"] = value
            elif param_name == "group_max":
                parsed[tier_name]["groupcountmax"] = value
            elif param_name == "limit":
                parsed[tier_name]["limit"] = value
        
        # Merge parsed with defaults
        for k, v in parsed.items():
            if k in defaults:
                for pk, pv in v.items():
                    defaults[k][pk] = pv
        
        print("Successfully loaded spawn rules parameters from mob_spawnrules.cfg")
    except Exception as e:
        print(f"Error parsing mob_spawnrules.cfg: {e}. Using script defaults.")
    
    return defaults

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

# Load AQ configs
disabled_path = os.path.join(aq_dir, "disabled_mobs.json")
tier_path = os.path.join(aq_dir, "mob_tier.json")
biometypes_path = os.path.join(aq_dir, "mob_biometypes.json")
extraspawns_path = os.path.join(aq_dir, "mob_extraspawns.json")
mappings_path = os.path.join(aq_dir, "biome_mappings.json")

disabled = set(load_lenient_json(disabled_path))
tier = load_lenient_json(tier_path)
biometypes = load_lenient_json(biometypes_path)
extraspawns = load_lenient_json(extraspawns_path)
mappings = load_lenient_json(mappings_path)

# Initialize defaults from cfg
cfg_path = os.path.join(aq_dir, "mob_spawnrules.cfg")
tier_defaults = load_spawnrules_cfg(cfg_path)

# Map mob to tier
mob_to_tier = {}
for tname, mobs in tier.items():
    for mob in mobs:
        mob_to_tier[mob] = tname

# Helper to get mob parameters
def get_mob_params(mob):
    t = mob_to_tier.get(mob, "common")
    return tier_defaults.get(t, tier_defaults["common"])

# Helper to get mob maxcount
def get_mob_maxcount(mob):
    params = get_mob_params(mob)
    limit_val = params.get("limit", 16)
    return {
        "amount": limit_val,
        "mob": mob,
        "perplayer": True
    }

# Gather water mobs
water_mobs = set(load_lenient_json(os.path.join(aq_dir, "mob_types.json")).get("watercreature", []))

# Load overworld spawntypes for surface/underground categorization
spawntype_path = os.path.join(aq_dir, "mob_overworldspawntype.json")
spawntypes = load_lenient_json(spawntype_path) or {}
surface_set = set(spawntypes.get("surface", []))
underground_set = set(spawntypes.get("underground", []))

surface_only = set(surface_set - underground_set - disabled - water_mobs)
underground_only = set(underground_set - surface_set - disabled - water_mobs)

# Helper to format mob entry
def make_mob_entry(mob):
    params = get_mob_params(mob)
    weight = params["weight"]
    if mob in underground_only:
        weight += 10
    return {
        "mob": mob,
        "weight": weight,
        "groupcountmin": params["groupcountmin"],
        "groupcountmax": params["groupcountmax"]
    }

# Compile sets to filter
extraspawns_mobs = set(sum(extraspawns.values(), []))
nether_mobs = set(biometypes.get("nether", []))
end_mobs = set(biometypes.get("end", []))
dark_mobs = set(biometypes.get("dark", []))
dark_exceptions = {"lycanitesmobs:beholder", "lycanitesmobs:shade", "lycanitesmobs:darkling"}
dark_to_filter = dark_mobs - dark_exceptions

# Generate new rules list
new_rules = []

# Gather all Overworld biomes for each mob
overworld_mob_biomes = {}  # mob -> set of display biome names

for category, mobs_in_cat in biometypes.items():
    if category in {"nether", "end", "dark", "any"}:
        continue
    
    biomes_in_cat = mappings.get(category, [])
    active_in_cat = sorted([m for m in mobs_in_cat if m not in disabled and m not in extraspawns_mobs])
    
    if not biomes_in_cat or not active_in_cat:
        continue
        
    for b in biomes_in_cat:
        if category == "beneath":
            continue
            
        mobs_in_biome = [m for m in active_in_cat if m not in nether_mobs and m not in end_mobs and m not in dark_to_filter]
        for mob in mobs_in_biome:
            if mob not in overworld_mob_biomes:
                overworld_mob_biomes[mob] = set()
            overworld_mob_biomes[mob].add(b)

# Generate one rule block per mob for Overworld biomes
for mob in sorted(overworld_mob_biomes.keys()):
    biomes = sorted(list(overworld_mob_biomes[mob]))
    
    rule = {
        "dimension": 0,
        "biomereg": biomes,
        "maxcount": get_mob_maxcount(mob),
        "mobs": [make_mob_entry(mob)]
    }
    if mob in water_mobs:
        rule["creaturetype"] = "WATER_CREATURE"
        rule["block"] = ["minecraft:water"]
    else:
        rule["creaturetype"] = "MONSTER"
    new_rules.append(rule)

# Add dimension-wide rules helper
def append_dim_rule(dim, mob):
    rule = {
        "dimension": dim,
        "maxcount": get_mob_maxcount(mob),
        "mobs": [make_mob_entry(mob)]
    }
    if mob in water_mobs:
        rule["creaturetype"] = "WATER_CREATURE"
        rule["block"] = ["minecraft:water"]
    else:
        rule["creaturetype"] = "MONSTER"
    new_rules.append(rule)

# Helper for dimension 0 wide rules
def append_dim_0_rule(mob):
    rule = {
        "dimension": 0,
        "maxcount": get_mob_maxcount(mob),
        "mobs": [make_mob_entry(mob)]
    }
    if mob in water_mobs:
        rule["creaturetype"] = "WATER_CREATURE"
        rule["block"] = ["minecraft:water"]
    else:
        rule["creaturetype"] = "MONSTER"
    new_rules.append(rule)

# Load dimensions lists
nether_mobs = sorted([m for m in biometypes.get("nether", []) if m not in disabled])
end_mobs = sorted([m for m in biometypes.get("end", []) if m not in disabled])
beneath_mobs = sorted([m for m in biometypes.get("dark", []) if m not in disabled])
any_mobs = sorted([m for m in biometypes.get("any", []) if m not in disabled])

if nether_mobs:
    for mob in nether_mobs:
        append_dim_rule(-1, mob)
if end_mobs:
    for mob in end_mobs:
        append_dim_rule(1, mob)
if beneath_mobs:
    for mob in beneath_mobs:
        append_dim_rule(10, mob)
if any_mobs:
    for mob in any_mobs:
        append_dim_0_rule(mob)

# Load structure spawns list
structurespawns = load_lenient_json(os.path.join(aq_dir, "mob_structurespawns.json")) or {}
for struct_name, mob_list in sorted(structurespawns.items()):
    active_struct_mobs = sorted([m for m in mob_list if m not in disabled])
    for mob in active_struct_mobs:
        rule = {
            "dimension": 0,
            "structure": struct_name,
            "maxcount": get_mob_maxcount(mob),
            "mobs": [make_mob_entry(mob)]
        }
        if mob in water_mobs:
            rule["creaturetype"] = "WATER_CREATURE"
            rule["block"] = ["minecraft:water"]
        else:
            rule["creaturetype"] = "MONSTER"
        new_rules.append(rule)

# Load depths spawns pool (e.g. bonus/override spawns below Y = -30)
depths_path = os.path.join(aq_dir, "mob_depthsspawns.json")
if os.path.exists(depths_path):
    depths_data = load_lenient_json(depths_path)
    depths_entries = []
    if isinstance(depths_data, dict):
        for mob_id, cfg in depths_data.items():
            if mob_id not in disabled:
                cfg_copy = dict(cfg) if isinstance(cfg, dict) else {}
                cfg_copy["mob"] = mob_id
                depths_entries.append(cfg_copy)
    elif isinstance(depths_data, list):
        for entry in depths_data:
            if isinstance(entry, dict) and entry.get("mob") and entry.get("mob") not in disabled:
                depths_entries.append(entry)
            elif isinstance(entry, str) and entry not in disabled:
                depths_entries.append({"mob": entry})

    for d in depths_entries:
        mob_id = d["mob"]
        max_h = d.get("maxheight", -30)
        params = get_mob_params(mob_id)
        weight = d.get("weight", params.get("weight", 100))
        gmin = d.get("groupcountmin", params.get("groupcountmin", 1))
        gmax = d.get("groupcountmax", params.get("groupcountmax", 2))
        maxcount_val = d.get("maxcount", params.get("limit", 16))

        rule = {
            "dimension": 0,
            "maxheight": max_h,
            "maxcount": {
                "amount": maxcount_val,
                "mob": mob_id,
                "perplayer": True
            },
            "mobs": [
                {
                    "mob": mob_id,
                    "weight": weight,
                    "groupcountmin": gmin,
                    "groupcountmax": gmax
                }
            ]
        }
        if mob_id in water_mobs:
            rule["creaturetype"] = "WATER_CREATURE"
            rule["block"] = ["minecraft:water"]
        else:
            rule["creaturetype"] = "MONSTER"
        new_rules.append(rule)
    print(f"Added {len(depths_entries)} depths pool spawn rules to potentialspawn.json")

# Add rule to remove vanilla mobs from The Beneath
vanilla_mobs_to_remove = [
    "minecraft:zombie",
    "minecraft:skeleton",
    "minecraft:creeper",
    "minecraft:spider",
    "minecraft:cave_spider",
    "minecraft:slime",
    "minecraft:witch",
    "minecraft:enderman",
    "minecraft:zombie_villager",
    "minecraft:husk",
    "minecraft:stray",
    "minecraft:vindication_illager",
    "minecraft:illusion_illager",
    "minecraft:evocation_illager"
]
new_rules.append({
    "dimension": 10,
    "remove": vanilla_mobs_to_remove
})

# Write output to potentialspawn.json
out_path = os.path.join(incontrol_dir, "potentialspawn.json")
with open(out_path, "w", encoding="utf-8") as f:
    json.dump(new_rules, f, indent=2)

print(f"Successfully regenerated potentialspawn.json with {len(new_rules)} rules.")
