import json
import os
import re
from datetime import datetime

script_dir = os.path.dirname(os.path.abspath(__file__))
project_root = os.path.dirname(script_dir)
aq_dir = os.path.join(project_root, "config", "arcanaquest")
if not os.path.exists(aq_dir):
    aq_dir = os.path.join(project_root, "config", "ArcanaQuest")
incontrol_dir = os.path.join(project_root, "config", "incontrol")

spawn_json_path = os.path.join(incontrol_dir, "spawn.json")
potential_json_path = os.path.join(incontrol_dir, "potentialspawn.json")
output_txt_path = os.path.join(aq_dir, "incontrol_rules_reference.txt")

def parse_blocks_with_comments(filepath):
    if not os.path.exists(filepath):
        return []
    with open(filepath, "r", encoding="utf-8") as f:
        text = f.read()

    first_bracket = text.find("[")
    last_bracket = text.rfind("]")
    if first_bracket == -1 or last_bracket == -1:
        return []

    array_content = text[first_bracket+1:last_bracket]
    blocks = []
    current_pos = 0
    bracket_level = 0
    in_string = False
    escape = False
    start_pos = 0

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
                obj_text = array_content[start_pos:i+1]
                preceding = array_content[current_pos:start_pos]
                blocks.append({
                    "preceding": preceding,
                    "obj_text": obj_text
                })
                current_pos = i + 1

    return blocks

def clean_comment(preceding):
    lines = preceding.strip().split("\n")
    cleaned = []
    for l in lines:
        l = l.strip()
        if l.startswith(","):
            l = l[1:].strip()
        if l.startswith("//"):
            cleaned.append(l[2:].strip())
        elif l.startswith("/*") and l.endswith("*/"):
            cleaned.append(l[2:-2].strip())
    return " | ".join(cleaned) if cleaned else ""

def format_spawn_rules():
    blocks = parse_blocks_with_comments(spawn_json_path)
    output = []
    output.append("=" * 80)
    output.append("INCONTROL SPAWN RULES REFERENCE")
    output.append(f"Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    output.append("=" * 80)
    output.append("")
    output.append("PIPELINE ARCHITECTURE NOTE:")
    output.append("- firstMatchOnly=true is active. InControl checks rules top-to-bottom and stops on FIRST match.")
    output.append("- Rules with [onjoin: true] execute ONLY during EntityJoinWorldEvent.")
    output.append("- Rules WITHOUT [onjoin: true] execute ONLY during CheckSpawn (natural spawning).")
    output.append("-" * 80)
    output.append(f"TOTAL SPAWN.JSON RULES: {len(blocks)}")
    output.append("-" * 80)
    output.append("")

    for idx, b in enumerate(blocks):
        try:
            rule = json.loads(b["obj_text"])
        except Exception:
            continue

        comment = clean_comment(b["preceding"])
        onjoin = rule.get("onjoin", False)
        pipeline = "EntityJoinWorldEvent (OnJoin)" if onjoin else "CheckSpawn (Natural Spawning)"
        result = rule.get("result", "default").upper()

        output.append(f"[Rule #{idx}] -> {result} ({pipeline})")
        if comment:
            output.append(f"  Description:  {comment}")

        # Mob target
        if "mob" in rule:
            m = rule["mob"]
            if isinstance(m, list):
                if len(m) <= 4:
                    output.append(f"  Target Mobs:  [{', '.join(m)}]")
                else:
                    output.append(f"  Target Mobs:  [{len(m)} mobs: {', '.join(m[:3])}, ... + {len(m)-3} more]")
            else:
                output.append(f"  Target Mob:   {m}")
        elif rule.get("spawner") is True:
            output.append("  Target Mob:   All mobs from Dungeon/Mob Spawners (spawner=true)")
        elif rule.get("hostile") is True:
            output.append("  Target Mob:   All hostile mobs (hostile=true)")

        # Conditions
        conds = []
        if "dimension" in rule:
            conds.append(f"Dimension: {rule['dimension']}")
        if "structure" in rule:
            conds.append(f"Structure: '{rule['structure']}'")
        if "minheight" in rule and "maxheight" in rule:
            conds.append(f"Height: {rule['minheight']} <= Y <= {rule['maxheight']}")
        elif "maxheight" in rule:
            conds.append(f"Height: Y <= {rule['maxheight']}")
        elif "minheight" in rule:
            conds.append(f"Height: Y >= {rule['minheight']}")
        if "seesky" in rule:
            conds.append(f"SeeSky: {rule['seesky']}")
        if "mintime" in rule or "maxtime" in rule:
            conds.append(f"Time: {rule.get('mintime', 0)} - {rule.get('maxtime', 24000)}")
        if "weather" in rule:
            conds.append(f"Weather: {rule['weather']}")
        if "gamestage" in rule:
            conds.append(f"Required GameStage: '{rule['gamestage']}'")
        if "mincount" in rule:
            mc = rule["mincount"]
            if isinstance(mc, dict):
                amt = mc.get("amount")
                pp = "per player" if mc.get("perplayer") else "global"
                target = mc.get("mob", "same mob")
                conds.append(f"MinCount Check (if loaded >= {amt} {pp} [{target}])")
        if "maxcount" in rule:
            mc = rule["maxcount"]
            if isinstance(mc, dict):
                amt = mc.get("amount")
                pp = "per player" if mc.get("perplayer") else "global"
                target = mc.get("mob", "same mob")
                conds.append(f"MaxCount Cap (if loaded < {amt} {pp} [{target}])")

        if conds:
            output.append(f"  Conditions:   {'; '.join(conds)}")

        # Modifiers
        mods = []
        if "healthmultiply" in rule:
            mods.append(f"Health x{rule['healthmultiply']}")
        if "damagemultiply" in rule:
            mods.append(f"Damage x{rule['damagemultiply']}")
        if "armoradd" in rule:
            mods.append(f"Armor +{rule['armoradd']}")
        if "speedmultiply" in rule:
            mods.append(f"Speed x{rule['speedmultiply']}")
        if "potion" in rule:
            mods.append(f"Potion: {rule['potion']}")
        if mods:
            output.append(f"  Modifiers:    {', '.join(mods)}")

        output.append("")

    return "\n".join(output)

def format_potential_summary():
    if not os.path.exists(potential_json_path):
        return ""
    with open(potential_json_path, "r", encoding="utf-8") as f:
        rules = json.load(f)

    output = []
    output.append("=" * 80)
    output.append("POTENTIALSPAWN.JSON SUMMARY")
    output.append(f"Total Rules in Spawn Pool: {len(rules)}")
    output.append("=" * 80)

    # Categories breakdown
    depths_rules = [r for r in rules if r.get("dimension") == 0 and "maxheight" in r and "biomereg" not in r]
    struct_rules = [r for r in rules if "structure" in r]
    dim0_wide = [r for r in rules if r.get("dimension") == 0 and "biomereg" not in r and "structure" not in r and "maxheight" not in r]
    biome_rules = [r for r in rules if r.get("dimension") == 0 and "biomereg" in r]
    nether_rules = [r for r in rules if r.get("dimension") == -1]
    end_rules = [r for r in rules if r.get("dimension") == 1]
    beneath_rules = [r for r in rules if r.get("dimension") == 10 and "remove" not in r]
    removals = [r for r in rules if "remove" in r]

    output.append(f"- Depths Pool Rules (Overworld Y <= -30): {len(depths_rules)}")
    for dr in depths_rules:
        mobs_info = ", ".join(f"{m['mob']} (weight: {m.get('weight')}, group: {m.get('groupcountmin')}-{m.get('groupcountmax')})" for m in dr.get("mobs", []))
        h = dr.get("maxheight", -30)
        output.append(f"    Y <= {h}: {mobs_info}")

    output.append(f"- Overworld Biome-Specific Mobs: {len(biome_rules)}")
    output.append(f"- Overworld Dimension-Wide Mobs: {len(dim0_wide)}")
    output.append(f"- Structure-Specific Spawns: {len(struct_rules)}")
    output.append(f"- Nether Dimension (-1) Mobs: {len(nether_rules)}")
    output.append(f"- End Dimension (1) Mobs: {len(end_rules)}")
    output.append(f"- The Beneath Dimension (10) Mobs: {len(beneath_rules)}")
    output.append(f"- Entity Removal Rules: {len(removals)}")
    output.append("")
    return "\n".join(output)

def main():
    spawn_text = format_spawn_rules()
    pot_text = format_potential_summary()
    full_content = spawn_text + "\n\n" + pot_text

    with open(output_txt_path, "w", encoding="utf-8") as f:
        f.write(full_content)

    print(f"Successfully generated InControl rules reference document at:")
    print(f"  {output_txt_path}")

if __name__ == "__main__":
    main()
