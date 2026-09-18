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

# File paths
disabled_path = os.path.join(aq_dir, "disabled_mobs.json")
tier_path = os.path.join(aq_dir, "mob_tier.json")
spawn_path = os.path.join(incontrol_dir, "spawn.json")
types_path = os.path.join(aq_dir, "mob_types.json")

# Load tiers, disabled list, and types for water creatures
tier = load_lenient_json(tier_path)
disabled = set(load_lenient_json(disabled_path))
mob_types = load_lenient_json(types_path)
water_creatures = set(mob_types.get("watercreature", []))

spawntypes_path = os.path.join(aq_dir, "mob_overworldspawntype.json")
spawntypes = load_lenient_json(spawntypes_path)
surface_set = set(spawntypes.get("surface", []))
underground_set = set(spawntypes.get("underground", []))
surface_only_set = surface_set - underground_set

dayspawns_path = os.path.join(aq_dir, "mob_dayspawns.json")
if os.path.exists(dayspawns_path):
    dayspawn_data = load_lenient_json(dayspawns_path)
    dayspawn_mobs = [m for m in dayspawn_data if m not in disabled]
else:
    dayspawn_mobs = []

depths_path = os.path.join(aq_dir, "mob_depthsspawns.json")
depths_entries = []
if os.path.exists(depths_path):
    depths_data = load_lenient_json(depths_path)
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


def sync_badmobs_config(disabled_mobs):
    badmobs_path = os.path.join(project_root, "config", "badmobs.cfg")
    sorted_mobs = sorted(list(disabled_mobs))
    mobs_text = "\n".join(f"        {m}" for m in sorted_mobs)
    content = f"""# Configuration file

general {{
    # A list of entity IDs to ban from spawning. [default: ]
    S:bannedMobs <
{mobs_text}
     >

    # If true, badmobs will remove banned mobs when they spawn. [default: true]
    B:removeSpawns=true
}}
"""
    with open(badmobs_path, "w", encoding="utf-8") as f:
        f.write(content)
    print(f"Synchronized {len(sorted_mobs)} banned mobs into config/badmobs.cfg")

# Load spawn rules limit values and Deadlier Underground settings from mob_spawnrules.cfg
def load_spawnrules_cfg(filepath):
    defaults = {
        "common": 8,
        "uncommon": 5,
        "rare": 3,
        "elite": 1,
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
        "du_tier3_healthmultiply": 2.0,
        "du_tier3_damagemultiply": 2.5,
        "du_tier3_armoradd": 10.0,
        "du_tier3_potion": "minecraft:night_vision,999999,0",
        "deadly_mob_maxheight": 0,
        "deadly_mob_healthmultiply": 2.5,
        "deadly_mob_damagemultiply": 2.5,
        "deadly_mob_armoradd": 12.0,
        "deadly_mob_potion": "dynamicstealth:soulsight,999999,0",
        "surface_day_limit": 20,
        "surface_day": 20
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
                    defaults[key] = int(val.strip())
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

# Helper to identify if a rule is a perplayer limit rule
def is_limit_rule(rule_obj):
    if "mob" in rule_obj and "mincount" in rule_obj:
        mc = rule_obj["mincount"]
        if isinstance(mc, dict) and mc.get("perplayer") is True:
            return True
    return False

# Read spawn.json text
with open(spawn_path, "r", encoding="utf-8") as f:
    orig_text = f.read()

# Locate main bracket bounds
first_bracket = orig_text.find("[")
last_bracket = orig_text.rfind("]")
array_content = orig_text[first_bracket+1:last_bracket]
trailing = orig_text[last_bracket:]

# Tokenize JSON blocks manually to preserve comments
blocks = []
current_pos = 0
bracket_level = 0
in_string = False
escape = False

for i, char in enumerate(array_content):
    if char == '"' and not escape:
        in_string = not in_string
    if in_string:
        if char == '\\' and not escape:
            escape = True
        else:
            escape = False
        continue
        
    if char == '{':
        if bracket_level == 0:
            start_pos = i
        bracket_level += 1
    elif char == '}':
        bracket_level -= 1
        if bracket_level == 0:
            # Found end of object block
            obj_text = array_content[start_pos:i+1]
            preceding = array_content[current_pos:start_pos]
            blocks.append({
                "preceding": preceding,
                "obj_text": obj_text
            })
            current_pos = i + 1

# Compile Game Stage gating lists
gating_list = []
active_tiered = {m: t for m, t in mob_tier_map.items() if m not in disabled}

def make_gating_rules(mobs, tier_name, limit_val, onjoin=True):
    rules = []
    
    # Filter mobs allowed underground (exclude surface-only mobs)
    underground_mobs_in_tier = sorted([m for m in mobs if m not in surface_only_set])
    
    # Underground buff (Y <= 55) - Tier 1 multipliers
    if underground_mobs_in_tier:
        t1_height = tier_limits.get("du_tier1_maxheight", 55)
        rule_underground = {
            "mob": underground_mobs_in_tier,
            "gamestage": tier_name,
            "maxcount": {
                "amount": limit_val,
                "perplayer": True
            },
            "dimension": 0,
            "maxheight": t1_height,
            "seesky": False,
            "result": "default",
            "healthmultiply": tier_limits.get("du_tier1_healthmultiply", 1.5),
            "damagemultiply": tier_limits.get("du_tier1_damagemultiply", 1.5)
        }
        if onjoin:
            rule_underground["onjoin"] = True
        rules.append({
            "preceding": f",\n\n  // Allow {tier_name.capitalize()} tier mobs underground (Y <= {t1_height}) if player has '{tier_name}' stage and count is under limit ({limit_val} per player)\n  ",
            "obj_text": "\n".join("    " + line for line in json.dumps(rule_underground, indent=2).split("\n")).strip()
        })
    
    # General allow rule (surface/other dimensions)
    rule_gen = {
        "mob": mobs,
        "gamestage": tier_name,
        "maxcount": {
            "amount": limit_val,
            "perplayer": True
        },
        "result": "default"
    }
    if onjoin:
        rule_gen["onjoin"] = True
    rules.append({
        "preceding": f",\n\n  // Allow {tier_name.capitalize()} tier mobs generally if player has '{tier_name}' stage and count is under limit ({limit_val} per player)\n  ",
        "obj_text": "\n".join("    " + line for line in json.dumps(rule_gen, indent=2).split("\n")).strip()
    })
    
    # Deny fallback rule
    rule_deny = {
        "mob": mobs,
        "result": "deny"
    }
    if onjoin:
        rule_deny["onjoin"] = True
    rules.append({
        "preceding": f",\n\n  // Deny {tier_name.capitalize()} tier mobs if player does not have '{tier_name}' stage or count limit is reached\n  ",
        "obj_text": "\n".join("    " + line for line in json.dumps(rule_deny, indent=2).split("\n")).strip()
    })
    
    return rules

dragon_mobs = sorted([m for m, t in active_tiered.items() if t == "dragon"])
if dragon_mobs:
    limit_val = tier_limits["dragon"]
    print(f"Adding game stage gating rules for {len(dragon_mobs)} Dragon tier mobs with limit {limit_val}")
    gating_list.extend(make_gating_rules(dragon_mobs, "dragon", limit_val))

deadly_mobs = sorted([m for m, t in active_tiered.items() if t == "deadly"])
deadly_underground = sorted([m for m in deadly_mobs if m not in surface_only_set])

if deadly_mobs:
    limit_val = tier_limits["deadly"]
    print(f"Adding game stage gating rules for {len(deadly_mobs)} Deadly tier mobs ({len(deadly_underground)} underground) with limit {limit_val}")
    if deadly_underground:
        t3_height = tier_limits.get("deadly_mob_maxheight", 0)
        # Bypass rule for Y <= 0 (Deadly mob multipliers with soulsight potion)
        rule_bypass_0 = {
            "mob": deadly_underground,
            "dimension": 0,
            "minheight": -60,
            "maxheight": t3_height,
            "seesky": False,
            "result": "default",
            "healthmultiply": tier_limits.get("deadly_mob_healthmultiply", 2.5),
            "damagemultiply": tier_limits.get("deadly_mob_damagemultiply", 2.5),
            "armoradd": tier_limits.get("deadly_mob_armoradd", 12.0),
            "potion": tier_limits.get("deadly_mob_potion", "dynamicstealth:soulsight,999999,0"),
            "onjoin": True
        }
        gating_list.append({
            "preceding": f",\n\n  // Allow Deadly tier mobs underground (Y <= {t3_height}) regardless of stage (Tier 3 multipliers)\n  ",
            "obj_text": "\n".join("    " + line for line in json.dumps(rule_bypass_0, indent=2).split("\n")).strip()
        })
    gating_list.extend(make_gating_rules(deadly_mobs, "deadly", limit_val))

elite_mobs = sorted([m for m, t in active_tiered.items() if t == "elite"])
elite_underground = sorted([m for m in elite_mobs if m not in surface_only_set])

if elite_mobs:
    limit_val = tier_limits["elite"]
    print(f"Adding game stage gating rules for {len(elite_mobs)} Elite tier mobs ({len(elite_underground)} underground) with limit {limit_val}")
    if elite_underground:
        t3_height = tier_limits.get("du_tier3_maxheight", 0)
        t2_height = tier_limits.get("du_tier2_maxheight", 30)
        t1_height = tier_limits.get("du_tier1_maxheight", 55)

        # 1. Bypass rule for Y <= 0 (Tier 3 multipliers)
        rule_bypass_0 = {
            "mob": elite_underground,
            "dimension": 0,
            "maxheight": t3_height,
            "seesky": False,
            "result": "default",
            "healthmultiply": tier_limits.get("du_tier3_healthmultiply", 2.5),
            "damagemultiply": tier_limits.get("du_tier3_damagemultiply", 2.5),
            "armoradd": tier_limits.get("du_tier3_armoradd", 12.0),
            "potion": tier_limits.get("du_tier3_potion", "minecraft:night_vision,999999,0"),
            "onjoin": True
        }
        gating_list.append({
            "preceding": f",\n\n  // Allow Elite tier mobs underground (Y <= {t3_height}) regardless of stage (Tier 3 multipliers)\n  ",
            "obj_text": "\n".join("    " + line for line in json.dumps(rule_bypass_0, indent=2).split("\n")).strip()
        })
        
        # 2. Bypass rule for Y <= 30 (Tier 2 multipliers)
        rule_bypass_30 = {
            "mob": elite_underground,
            "dimension": 0,
            "maxheight": t2_height,
            "seesky": False,
            "result": "default",
            "healthmultiply": tier_limits.get("du_tier2_healthmultiply", 2.0),
            "damagemultiply": tier_limits.get("du_tier2_damagemultiply", 1.75),
            "potion": tier_limits.get("du_tier2_potion", "minecraft:night_vision,999999,0"),
            "onjoin": True
        }
        gating_list.append({
            "preceding": f",\n\n  // Allow Elite tier mobs underground (Y <= {t2_height}) regardless of stage (Tier 2 multipliers)\n  ",
            "obj_text": "\n".join("    " + line for line in json.dumps(rule_bypass_30, indent=2).split("\n")).strip()
        })
        
        # 3. Stage-gated underground rule (Y <= 55)
        rule_underground = {
            "mob": elite_underground,
            "gamestage": "elite",
            "maxcount": {
                "amount": limit_val,
                "perplayer": True
            },
            "dimension": 0,
            "maxheight": t1_height,
            "seesky": False,
            "result": "default",
            "healthmultiply": tier_limits.get("du_tier1_healthmultiply", 1.5),
            "damagemultiply": tier_limits.get("du_tier1_damagemultiply", 1.5),
            "onjoin": True
        }
        gating_list.append({
            "preceding": f",\n\n  // Allow Elite tier mobs underground (Y <= {t1_height}) if player has 'elite' stage (Tier 1 multipliers)\n  ",
            "obj_text": "\n".join("    " + line for line in json.dumps(rule_underground, indent=2).split("\n")).strip()
        })
    
    # 4. General stage-gated allow rule
    rule_gen = {
        "mob": elite_mobs,
        "gamestage": "elite",
        "maxcount": {
            "amount": limit_val,
            "perplayer": True
        },
        "result": "default",
        "onjoin": True
    }
    gating_list.append({
        "preceding": f",\n\n  // Allow Elite tier mobs generally if player has 'elite' stage\n  ",
        "obj_text": "\n".join("    " + line for line in json.dumps(rule_gen, indent=2).split("\n")).strip()
    })
    
    # 5. Deny fallback rule
    rule_deny = {
        "mob": elite_mobs,
        "result": "deny",
        "onjoin": True
    }
    gating_list.append({
        "preceding": f",\n\n  // Deny Elite tier mobs if player does not have 'elite' stage or count limit is reached\n  ",
        "obj_text": "\n".join("    " + line for line in json.dumps(rule_deny, indent=2).split("\n")).strip()
    })

cultist_mobs = sorted([m for m in mob_types.get("cultist", ["thaumcraft:cultistknight", "thaumcraft:cultistcleric", "crimsonrevelations:cultist_archer"]) if m not in disabled])
if cultist_mobs:
    limit_val = tier_limits.get("rare", 3)
    print(f"Adding game stage gating rules for {len(cultist_mobs)} Crimson Cult tier mobs with limit {limit_val}")
    gating_list.extend(make_gating_rules(cultist_mobs, "crimsoncult", limit_val, onjoin=False))

# Load overworld spawntypes for height/sky restrictions
spawntype_path = os.path.join(aq_dir, "mob_overworldspawntype.json")
spawntypes = load_lenient_json(spawntype_path)
surface_set = set(spawntypes.get("surface", []))
underground_set = set(spawntypes.get("underground", []))

surface_only = sorted(list(surface_set - underground_set - disabled - water_creatures))
underground_only = sorted(list(underground_set - surface_set - disabled - water_creatures))

# Create custom block rules
custom_rules = []

# 1. Deny Spectre in Overworld
print("Adding rule to deny lycanitesmobs:spectre in Overworld")
spectre_rule = {
    "mob": "lycanitesmobs:spectre",
    "dimension": 0,
    "result": "deny",
    "onjoin": True
}
spectre_text = json.dumps(spectre_rule, indent=2)
spectre_text = "\n".join("    " + line for line in spectre_text.split("\n")).strip()
custom_rules.append({
    "preceding": ",\n\n  // Restrict lycanitesmobs:spectre spawning to non-Overworld dimensions only\n  ",
    "obj_text": spectre_text
})

# 1b. Allow Structure-Specific Mobs to Spawn in Structures (Promoted to Top of spawn.json)
structure_allow_rules = []
structurespawns = load_lenient_json(os.path.join(aq_dir, "mob_structurespawns.json")) or {}
all_struct_mobs = set()
for struct_name, mob_list in sorted(structurespawns.items()):
    active_struct_mobs = sorted([m for m in mob_list if m not in disabled])
    if active_struct_mobs:
        all_struct_mobs.update(active_struct_mobs)
        print(f"Adding structure spawn allow rule for {len(active_struct_mobs)} mobs in structure '{struct_name}'")
        struct_rule = {
            "mob": active_struct_mobs,
            "dimension": 0,
            "structure": struct_name,
            "result": "allow"
        }
        if struct_name.lower() == "mineshaft":
            struct_rule["maxheight"] = 50
            struct_rule["seesky"] = False
        struct_text = json.dumps(struct_rule, indent=2)
        struct_text = "\n".join("    " + line for line in struct_text.split("\n")).strip()
        structure_allow_rules.append({
            "preceding": f",\n\n  // Allow structure-specific mobs to spawn in '{struct_name}'\n  ",
            "obj_text": struct_text
        })

# 2. Restrict Surface-Only and Structure Mobs to Surface (above Y 60 or where sky is visible)
underground_denied_mobs = sorted(list(set(surface_only) | all_struct_mobs))
if underground_denied_mobs:
    print(f"Adding rule to restrict {len(underground_denied_mobs)} surface-only and structure mobs from spawning in regular caves")
    
    # Rule A: Deny if under Y 60 and seesky is False
    so_height_rule = {
        "mob": underground_denied_mobs,
        "dimension": 0,
        "maxheight": 60,
        "seesky": False,
        "result": "deny"
    }
    so_height_text = json.dumps(so_height_rule, indent=2)
    so_height_text = "\n".join("    " + line for line in so_height_text.split("\n")).strip()
    custom_rules.append({
        "preceding": ",\n\n  // Restrict surface-only and structure mobs to above Y 60 or where sky is visible\n  ",
        "obj_text": so_height_text
    })

# 3. Restrict Underground-Only Mobs to Caves (below Y 60)
if underground_only:
    print(f"Adding rule to restrict {len(underground_only)} underground-only mobs from spawning on the surface")
    
    # Rule A: Deny if above Y 60
    uo_height_rule = {
        "mob": underground_only,
        "dimension": 0,
        "minheight": 60,
        "result": "deny"
    }
    uo_height_text = json.dumps(uo_height_rule, indent=2)
    uo_height_text = "\n".join("    " + line for line in uo_height_text.split("\n")).strip()
    custom_rules.append({
        "preceding": ",\n\n  // Restrict underground-only mobs to below Y 60\n  ",
        "obj_text": uo_height_text
    })

# 4. General per-player hostile mob cap (250 per player in Overworld)
print("Adding rule for general 250 per-player hostile mob cap in Overworld")
hostile_cap_rule = {
    "dimension": 0,
    "mincount": {
        "amount": 250,
        "hostile": True,
        "perplayer": True
    },
    "result": "deny"
}
hostile_cap_text = json.dumps(hostile_cap_rule, indent=2)
hostile_cap_text = "\n".join("    " + line for line in hostile_cap_text.split("\n")).strip()
custom_rules.append({
    "preceding": ",\n\n  // Hard cap total hostile mob spawning in Overworld to 250 per player\n  ",
    "obj_text": hostile_cap_text
})

# Process blocks, updating limits and cleaning up old rules
spawner_allow_rules = []

# 1. Deny spawner mobs if they collide with blocks/walls
spawner_deny_rule = {
    "spawner": True,
    "notcolliding": False,
    "result": "deny"
}
spawner_deny_text = json.dumps(spawner_deny_rule, indent=2)
spawner_deny_text = "\n".join("    " + line for line in spawner_deny_text.split("\n")).strip()
spawner_allow_rules.append({
    "preceding": "\n  // Deny spawner mobs if they collide with blocks/walls\n  ",
    "obj_text": spawner_deny_text
})

# 1b. Limit Bone Knight spawners to 1 active entity per chunk
bone_knight_spawner_rule = {
    "mob": "grimoireofgaia:bone_knight",
    "spawner": True,
    "mincount": {
        "amount": 1,
        "perchunk": True
    },
    "result": "deny"
}
bone_knight_spawner_text = json.dumps(bone_knight_spawner_rule, indent=2)
bone_knight_spawner_text = "\n".join("    " + line for line in bone_knight_spawner_text.split("\n")).strip()
spawner_allow_rules.append({
    "preceding": ",\n\n  // Limit Bone Knight spawners to 1 active entity per chunk\n  ",
    "obj_text": bone_knight_spawner_text
})

# 2. Allow spawner mobs in open air (skips light/path checks while preserving collision safety)
spawner_allow_rule = {
    "spawner": True,
    "notcolliding": True,
    "result": "allow"
}
spawner_allow_text = json.dumps(spawner_allow_rule, indent=2)
spawner_allow_text = "\n".join("    " + line for line in spawner_allow_text.split("\n")).strip()
spawner_allow_rules.append({
    "preceding": ",\n\n  // Allow spawner mobs in open air (skips light/path checks while preserving collision safety)\n  ",
    "obj_text": spawner_allow_text
})

exception_allow_rules = []
time_rules = []

# Deny hostile mob spawning in Village structures on surface during daytime and dawn transition
village_day_rules = [
    {
        "structure": "Village",
        "dimension": 0,
        "minheight": 50,
        "mintime": 0,
        "maxtime": 13000,
        "hostile": True,
        "result": "deny",
        "onjoin": True
    },
    {
        "structure": "Village",
        "dimension": 0,
        "minheight": 50,
        "mintime": 23000,
        "maxtime": 24000,
        "hostile": True,
        "result": "deny",
        "onjoin": True
    }
]
print("Adding rules to deny hostile mob spawning in Village structures during daytime and dawn transition")
for vr in village_day_rules:
    vr_text = json.dumps(vr, indent=2)
    vr_text = "\n".join("    " + line for line in vr_text.split("\n")).strip()
    time_rules.append({
        "preceding": ",\n\n  // Deny hostile mob spawning in Village structures during daytime\n  ",
        "obj_text": vr_text
    })

restriction_rules = list(custom_rules)
day_allow_rules = []
entity_modifier_rules = []
underground_buff_rules = []
beneath_buff_rules = []
seen_limit_mobs = set()

if dayspawn_mobs:
    day_limit = tier_limits.get("surface_day_limit", tier_limits.get("surface_day", 20))
    print(f"Adding rule to allow {len(dayspawn_mobs)} hostile surface mobs during daytime (capped at {day_limit} per player)")
    
    # Deny rule when daytime surface cap is reached
    day_deny_rule = {
        "mob": sorted(dayspawn_mobs),
        "dimension": 0,
        "minheight": 60,
        "seesky": True,
        "mintime": 0,
        "maxtime": 13000,
        "mincount": {
            "amount": day_limit,
            "perplayer": True,
            "mob": sorted(dayspawn_mobs)
        },
        "result": "deny"
    }
    day_deny_text = json.dumps(day_deny_rule, indent=2)
    day_deny_text = "\n".join("    " + line for line in day_deny_text.split("\n")).strip()
    restriction_rules.append({
        "preceding": f",\n\n  // Deny surface daytime hostile spawns once daytime cap ({day_limit} per player) is reached\n  ",
        "obj_text": day_deny_text
    })

    # Allow rule with maxcount protection
    day_allow_rule = {
        "mob": sorted(dayspawn_mobs),
        "dimension": 0,
        "minheight": 60,
        "seesky": True,
        "mintime": 0,
        "maxtime": 13000,
        "maxcount": {
            "amount": day_limit,
            "perplayer": True,
            "mob": sorted(dayspawn_mobs)
        },
        "result": "allow"
    }
    day_allow_text = json.dumps(day_allow_rule, indent=2)
    day_allow_text = "\n".join("    " + line for line in day_allow_text.split("\n")).strip()
    day_allow_rules.append({
        "preceding": f",\n\n  // Allow hostile non-undead surface creatures to spawn during daytime up to cap ({day_limit} per player)\n  ",
        "obj_text": day_allow_text
    })


# Give Beneath dimension mobs general buff (1.5x health/damage, night_vision)
print("Adding rule to buff Beneath dimension mobs")
beneath_buff_rule = {
    "dimension": 10,
    "result": "default",
    "healthmultiply": 1.5,
    "damagemultiply": 1.5,
    "potion": "minecraft:night_vision,999999,0",
    "onjoin": True
}
beneath_buff_text = json.dumps(beneath_buff_rule, indent=2)
beneath_buff_text = "\n".join("    " + line for line in beneath_buff_text.split("\n")).strip()
beneath_buff_rules.append({
    "preceding": ",\n\n  // Give Beneath dimension mobs the same buff as Tier 3 Deadlier Underground\n  ",
    "obj_text": beneath_buff_text
})

# Early bypass rules for depths pool mobs (Y <= maxheight, default -30)
# OnJoin bypasses stage gating with Tier 3 underground multipliers (excluding Dragon and Deadly tier mobs)
depths_bypass_rules = []
if depths_entries:
    depths_by_height = {}
    for d in depths_entries:
        mob_id = d["mob"]
        # Do not add to depths override rule group if mob already exists in Dragon or Deadly tiers
        if mob_id in dragon_mobs or mob_id in deadly_mobs:
            print(f"Skipping depths override rule for {mob_id} (already covered by Dragon/Deadly rules)")
            continue
        h = d.get("maxheight", -30)
        if h not in depths_by_height:
            depths_by_height[h] = []
        depths_by_height[h].append(mob_id)
    
    for h, m_list in sorted(depths_by_height.items()):
        sorted_mobs = sorted(list(set(m_list)))
        if not sorted_mobs:
            continue
        print(f"Adding early OnJoin bypass rule for {len(sorted_mobs)} depths pool mobs at Y <= {h}")
        # EntityJoinWorldEvent allow/bypass rule with Tier 3 stat multipliers (bypasses stage gating)
        depths_onjoin_rule = {
            "mob": sorted_mobs,
            "dimension": 0,
            "maxheight": h,
            "result": "default",
            "healthmultiply": tier_limits.get("du_tier3_healthmultiply", 2.5),
            "damagemultiply": tier_limits.get("du_tier3_damagemultiply", 2.5),
            "armoradd": tier_limits.get("du_tier3_armoradd", 12.0),
            "potion": tier_limits.get("du_tier3_potion", "minecraft:night_vision,999999,0"),
            "onjoin": True
        }
        oj_text = json.dumps(depths_onjoin_rule, indent=2)
        oj_text = "\n".join("    " + line for line in oj_text.split("\n")).strip()
        depths_bypass_rules.append({
            "preceding": f",\n\n  // Allow Depths pool mobs underground (Y <= {h}) regardless of stage (Tier 3 multipliers)\n  ",
            "obj_text": oj_text
        })

for block in blocks:
    preceding = block["preceding"]
    obj_text = block["obj_text"]
    rule_obj = json.loads(obj_text)

    # Discard any spawner rules (both old caps and old allows) to cleanly regenerate the top-of-file spawner allow rule
    if rule_obj.get("spawner") is True:
        print(f"Removing old spawner rule: result={rule_obj.get('result')}")
        continue
    
    # Discard obsolete Dark Druid allow bypass rule so Dark Druids are strictly gated by the elite stage
    if rule_obj.get("mob") == "thebetweenlands:dark_druid" and rule_obj.get("result") == "allow":
        print("Removing obsolete Dark Druid allow bypass rule")
        continue
    
    # Check if this is a game stage gating rule to replace
    gamestage = rule_obj.get("gamestage")
    if gamestage in ["!gaia_mobs", "!dragon", "!elite", "dragon", "elite", "crimsoncult", "cultist"]:
        print(f"Removing old stage gating rule for: {gamestage}")
        continue
    
    # Check if this is a stage gating deny fallback (no gamestage field, matched by comment)
    if ("Deny Dragon tier mobs" in preceding or
        "Deny Elite tier mobs" in preceding or
        "Deny Crimsoncult tier mobs" in preceding or
        "Deny Cultist tier mobs" in preceding or
        "Gate Dragon tier mobs" in preceding or
        "Gate Elite tier mobs" in preceding or
        "Gate Crimsoncult tier mobs" in preceding or
        "Allow Elite tier mobs underground" in preceding or
        "Allow Deadly tier mobs underground" in preceding):
        print("Removing old stage gating deny fallback rule")
        continue
        
    # Check if this is an old hardcoded underground/spectre/baby rule to replace
    if ("Restrict Silex spawning to underground only" in preceding or 
        "Restrict underground creatures to underground only" in preceding or 
        "Restrict lycanitesmobs:wraamon" in preceding or 
        "Restrict overworld underground creatures" in preceding or
        "Restrict lycanitesmobs:spectre spawning to non-Overworld" in preceding or
        "Restrict surface-only mobs to above" in preceding or
        "Restrict surface-only mobs to blocks with sky" in preceding or
        "Restrict underground-only mobs to below" in preceding or
        "Restrict underground-only mobs to blocks without sky" in preceding or
        "Restrict Beneath-only creatures to Beneath only" in preceding or
        "Allow Elite tier mobs in The Beneath" in preceding or
        "Disable spawning of hostile baby mobs" in preceding or
        "Hostile Grimoire of Gaia Mob Damage Reduction" in preceding or
        "Suppress Gaia spooky" in preceding or
        "Deny Gaia spooky" in preceding or
        "Allow Gaia spooky" in preceding or
        "Prevent gaia dwarf" in preceding or
        "Prevent Gaia dwarf" in preceding or
        "Deadlier Underground" in preceding or
        "Hard cap total hostile mob spawning" in preceding or
        "Hard cap mob spawner cages" in preceding or
        "Allow hostile non-undead surface creatures to spawn during daytime" in preceding or
        "Deny hostile mob spawning in Village structures" in preceding or
        "Deny surface daytime hostile spawns" in preceding or
        "Deny Ghoul spawning on surface" in preceding or
        "Prevent Ghoul spawning on surface during dawn transition" in preceding or
        "Allow structure-specific mobs" in preceding or
        "structure-specific mobs" in preceding or
        "Allow Depths pool mobs" in preceding or
        "Depths pool mobs" in preceding or
        "in other dimensions" in preceding):
        print("Removing old/user-cleaned rule block")
        continue

    # Discard old daytime and dawn transition deny rules for Ghoul
    if rule_obj.get("mob") == "lycanitesmobs:ghoul" and rule_obj.get("result") == "deny":
        print("Removing old daytime/dawn deny rule for lycanitesmobs:ghoul")
        continue

    # Discard old structure allow rules to cleanly regenerate at top
    if "structure" in rule_obj and rule_obj.get("result") == "allow":
        print(f"Removing old structure allow rule to cleanly regenerate at top: {rule_obj.get('structure')}")
        continue

    # Discard old village daytime deny rules to cleanly regenerate
    if rule_obj.get("structure") == "Village" and rule_obj.get("hostile") is True and rule_obj.get("result") == "deny":
        print("Removing old village daytime deny rule to regenerate")
        continue

    # Discard old daytime deny rule block if present
    if rule_obj.get("result") == "deny" and rule_obj.get("mintime") == 0 and rule_obj.get("seesky") is True and isinstance(rule_obj.get("mob"), list):
        print("Removing old daytime deny rule block")
        continue

    # Discard old daytime allow rule block if present
    if rule_obj.get("result") == "allow" and rule_obj.get("mintime") == 0 and rule_obj.get("seesky") is True and isinstance(rule_obj.get("mob"), list):
        print("Removing old daytime allow rule block")
        continue


    # Discard rule blocks targeting disabled mobs
    if "mob" in rule_obj:
        mob_field = rule_obj["mob"]
        if isinstance(mob_field, str):
            if mob_field in disabled:
                print(f"Removing rule block for single disabled mob: {mob_field}")
                continue
        elif isinstance(mob_field, list):
            filtered_mobs = [m for m in mob_field if m not in disabled]
            if not filtered_mobs:
                print("Removing rule block because all targeted mobs are disabled")
                continue
            rule_obj["mob"] = filtered_mobs

    # Map missing comment titles for static custom rule blocks
    if not preceding or preceding.strip() == ",":
        comment_title = ""
        mobs_val = rule_obj.get("mob")
        if "mintime" in rule_obj and mobs_val == "thebetweenlands:dark_druid":
            if rule_obj.get("mintime") == 0:
                comment_title = "// Prevent Dark Druid spawning during daytime"
            else:
                comment_title = "// Prevent Dark Druid spawning during dawn transition"
        elif mobs_val == "lycanitesmobs:ghoul":
            comment_title = "// Prevent Ghoul spawning on surface during dawn transition"
        elif mobs_val == "lycanitesmobs:silex":
            comment_title = "// Prevent Silex from spawning on the surface"
        elif mobs_val == "lycanitesmobs:wraamon":
            comment_title = "// Prevent Wraamon from spawning"
        elif isinstance(mobs_val, list) and "lycanitesmobs:chupacabra" in mobs_val:
            comment_title = "// Prevent shadow/underground mobs from spawning on the surface"
        elif mobs_val == "lycanitesmobs:grue" and rule_obj.get("result") == "allow":
            comment_title = "// Allow Grue darkness/event spawning"
        elif isinstance(mobs_val, list) and "lycanitesmobs:geonach" in mobs_val:
            comment_title = "// Restrict Lycanites elemental/event mobs from natural spawning"
        elif mobs_val == "minecraft:enderman":
            if rule_obj.get("dimension") == -2:
                comment_title = "// Spawn angry Endermen randomly in Outer End/Special dimensions"
            else:
                comment_title = "// Spawn angry Endermen randomly in The End"
        elif rule_obj.get("spawner") is True:
            if rule_obj.get("dimension") == 0:
                comment_title = "// Hard cap mob spawner cages (dungeons / Roguelike Spawners) to 75 active in Overworld"
            else:
                comment_title = "// Hard cap mob spawner cages to 30 active in The Beneath"
        elif mobs_val == "minecraft:villager_golem":
            if rule_obj.get("result") == "deny":
                comment_title = "// Prevent excess Village Iron Golem spawning"
            else:
                comment_title = "// Buff Village Iron Golems (2.5x health, 2.0x damage, fire resistance, concentration)"
        elif mobs_val == "minecraft:villager":
            comment_title = "// Buff Village Villagers (1.5x health, 1.3x speed)"

        if comment_title:
            preceding = f",\n\n  {comment_title}\n  "

    # Identify specific allow bypasses (Grue, Dark Druid night allow) -> place at very top
    if (rule_obj.get("result") == "allow" and 
        rule_obj.get("mob") in ["lycanitesmobs:grue", "thebetweenlands:dark_druid"]):
        block["preceding"] = preceding
        exception_allow_rules.append(block)
        continue

    # Identify time-based rules (must remain near the top to prevent gating allow overrides)
    if "mintime" in rule_obj or "maxtime" in rule_obj or "biomereg" in rule_obj or "biomesoplenty:ominous_woods" in obj_text:
        block["preceding"] = preceding
        time_rules.append(block)
        continue

    if is_limit_rule(rule_obj):
        mob = rule_obj["mob"]
        seen_limit_mobs.add(mob)
        
        if mob in disabled:
            print(f"Removing limit rule for disabled mob: {mob}")
            continue
            
        if mob in cultist_mobs:
            print(f"Removing redundant standard limit rule for gated Crimson Cultist mob: {mob}")
            continue
            
        t = mob_tier_map.get(mob)
        if not t:
            print(f"Keeping limit rule for un-tiered/external mob: {mob}")
            block["preceding"] = preceding
            restriction_rules.append(block)
            continue
            
        # Discard tiered limit rules in the parser loop so they can be regenerated as split rules
        print(f"Discarding old limit rule for tiered mob to regenerate splits: {mob}")
        continue
    else:
        # Check if this is a restriction/deny rule
        if rule_obj.get("result") == "deny" or "gamestage" in rule_obj:
            block_entry = {
                "preceding": preceding,
                "obj_text": obj_text
            }
            restriction_rules.append(block_entry)
            continue

        # Protect user-edited Golem/Villager and Charged Creepers rule blocks from being modified
        if ("Golem/Villager Changes" in preceding or 
            "Charged Creepers" in preceding or 
            rule_obj.get("mob") in ["minecraft:villager_golem", "minecraft:villager"] or
            (rule_obj.get("mob") == "minecraft:creeper" and rule_obj.get("weather") == "thunder")):
            block_entry = {
                "preceding": preceding,
                "obj_text": obj_text
            }
            entity_modifier_rules.append(block_entry)
            continue

        # Strip legacy/problematic 'passive' key if present
        if "passive" in rule_obj:
            del rule_obj["passive"]

        # Automatically inject onjoin: true to all modifier rules that apply attributes or potions
        if not rule_obj.get("onjoin"):
            rule_obj["onjoin"] = True
            
        new_obj_text = json.dumps(rule_obj, indent=2)
        new_obj_text = "\n".join("    " + line for line in new_obj_text.split("\n")).strip()
        
        block_entry = {
            "preceding": preceding,
            "obj_text": new_obj_text
        }
        entity_modifier_rules.append(block_entry)

# Generate fresh Deadlier Underground tier rules
t3_height = tier_limits.get("du_tier3_maxheight", 0)
t2_height = tier_limits.get("du_tier2_maxheight", 30)
t1_height = tier_limits.get("du_tier1_maxheight", 55)

du_t3_rule = {
    "dimension": 0,
    "maxheight": t3_height,
    "result": "default",
    "healthmultiply": tier_limits.get("du_tier3_healthmultiply", 2.5),
    "damagemultiply": tier_limits.get("du_tier3_damagemultiply", 2.5),
    "armoradd": tier_limits.get("du_tier3_armoradd", 12.0),
    "potion": tier_limits.get("du_tier3_potion", "minecraft:night_vision,999999,0"),
    "onjoin": True
}
du_t3_text = "\n".join("    " + line for line in json.dumps(du_t3_rule, indent=2).split("\n")).strip()
underground_buff_rules.append({
    "preceding": f",\n\n  // Deadlier Underground tier 3 (Y <= {t3_height})\n  ",
    "obj_text": du_t3_text
})

du_t2_rule = {
    "dimension": 0,
    "maxheight": t2_height,
    "result": "default",
    "healthmultiply": tier_limits.get("du_tier2_healthmultiply", 2.0),
    "damagemultiply": tier_limits.get("du_tier2_damagemultiply", 1.75),
    "potion": tier_limits.get("du_tier2_potion", "minecraft:night_vision,999999,0"),
    "onjoin": True
}
du_t2_text = "\n".join("    " + line for line in json.dumps(du_t2_rule, indent=2).split("\n")).strip()
underground_buff_rules.append({
    "preceding": f",\n\n  // Deadlier Underground tier 2 (Y <= {t2_height})\n  ",
    "obj_text": du_t2_text
})

du_t1_rule = {
    "dimension": 0,
    "maxheight": t1_height,
    "result": "default",
    "healthmultiply": tier_limits.get("du_tier1_healthmultiply", 1.5),
    "damagemultiply": tier_limits.get("du_tier1_damagemultiply", 1.5),
    "onjoin": True
}
du_t1_text = "\n".join("    " + line for line in json.dumps(du_t1_rule, indent=2).split("\n")).strip()
underground_buff_rules.append({
    "preceding": f",\n\n  // Deadlier Underground tier 1 (Y <= {t1_height})\n  ",
    "obj_text": du_t1_text
})

# Per-mob maxcount spawn caps are handled directly in potentialspawn.json
print("Per-mob spawn caps are managed via maxcount in potentialspawn.json")

# Sync badmobs.cfg with disabled mobs list
sync_badmobs_config(disabled)

# Final ordered blocks: Strict execution order (Spawner allow -> Time rules -> Structure allow -> Specific allows -> Depths bypass -> Stage gating -> Restrictions/Denies -> Modifiers -> Catch-all Buffs)
processed_blocks = []
processed_blocks.extend(spawner_allow_rules)
processed_blocks.extend(time_rules)
processed_blocks.extend(structure_allow_rules)
processed_blocks.extend(exception_allow_rules)
processed_blocks.extend(depths_bypass_rules)
processed_blocks.extend(gating_list)
processed_blocks.extend(restriction_rules)
processed_blocks.extend(day_allow_rules)
processed_blocks.extend(entity_modifier_rules)
processed_blocks.extend(beneath_buff_rules)
processed_blocks.extend(underground_buff_rules)

# Deduplicate blocks by normalized obj_text
seen_obj_texts = set()
deduped_blocks = []
for b in processed_blocks:
    key = re.sub(r'\s+', '', b["obj_text"])
    if key not in seen_obj_texts:
        seen_obj_texts.add(key)
        deduped_blocks.append(b)

processed_blocks = deduped_blocks

# Reconstruct array content ensuring correct commas
reconstructed = ""
for idx, block in enumerate(processed_blocks):
    preceding = block["preceding"]
    if idx == 0:
        # First block should not have a leading comma
        preceding = re.sub(r'^\s*,\s*', '', preceding)
    else:
        # Subsequent blocks must have exactly one leading comma before whitespace/comments
        preceding_clean = re.sub(r'^\s*,\s*', '', preceding)
        preceding = ",\n" + preceding_clean

    reconstructed += preceding
    reconstructed += block["obj_text"]

reconstructed += trailing

final_text = orig_text[:first_bracket+1] + reconstructed

with open(spawn_path, "w", encoding="utf-8") as f:
    f.write(final_text)

print("Successfully regenerated and synchronized spawn limits and stage gating rules in spawn.json!")

# Synchronize human-readable InControl rules reference document
try:
    ref_script_path = os.path.join(script_dir, "generate_incontrol_rules_reference.py")
    if os.path.exists(ref_script_path):
        import subprocess
        import sys
        sys.stdout.flush()
        subprocess.run([sys.executable, ref_script_path], check=True)
except Exception as e:
    print(f"Warning: Could not update rules reference document: {e}")

