// ==========================================
// Arcana Quest: MobStages Configuration
// ==========================================

// ------------------------------------------
// 1. Dragon Tier Gating & Replacements
// ------------------------------------------
mods.MobStages.addStage("dragon", "lycanitesmobs:ignibus");
mods.MobStages.addStage("dragon", "lycanitesmobs:morock");
mods.MobStages.addStage("dragon", "lycanitesmobs:zoataur");

mods.MobStages.addReplacement("lycanitesmobs:ignibus", "embers:ancient_golem");
mods.MobStages.addReplacement("lycanitesmobs:morock", "embers:ancient_golem");
mods.MobStages.addReplacement("lycanitesmobs:zoataur", "embers:ancient_golem");

// ------------------------------------------
// 2. Crimson Cult Tier Gating & Replacements
// ------------------------------------------
mods.MobStages.addStage("crimsoncult", "thaumcraft:cultistknight");
mods.MobStages.addStage("crimsoncult", "thaumcraft:cultistcleric");
mods.MobStages.addStage("crimsoncult", "crimsonrevelations:cultist_archer");

mods.MobStages.addReplacement("thaumcraft:cultistknight", "thaumcraft:brainyzombie");
mods.MobStages.addReplacement("thaumcraft:cultistcleric", "thaumcraft:brainyzombie");
mods.MobStages.addReplacement("crimsonrevelations:cultist_archer", "thaumcraft:brainyzombie");

// ------------------------------------------
// 3. Elite Tier (Surface-Only) Gating & Replacements
// Note: Underground-capable elites (banshee, cobblestone_golem, dhampir,
// gelatinous_slime, minotaurus, vampire) and deadly tier mobs are excluded
// to preserve their InControl underground bypasses (Y <= 30 and Y <= 0).
// ------------------------------------------

// Desert Mobs -> Mummy
mods.MobStages.addStage("elite", "grimoireofgaia:anubis");
mods.MobStages.addStage("elite", "grimoireofgaia:sphinx");
mods.MobStages.addStage("elite", "lycanitesmobs:crusk");

mods.MobStages.addReplacement("grimoireofgaia:anubis", "grimoireofgaia:mummy");
mods.MobStages.addReplacement("grimoireofgaia:sphinx", "grimoireofgaia:mummy");
mods.MobStages.addReplacement("lycanitesmobs:crusk", "grimoireofgaia:mummy");

// Plains Mobs -> Ettin
mods.MobStages.addStage("elite", "lycanitesmobs:cockatrice");

mods.MobStages.addReplacement("lycanitesmobs:cockatrice", "lycanitesmobs:ettin");

// Mountain Mobs -> Troll
mods.MobStages.addStage("elite", "grimoireofgaia:valkyrie");

mods.MobStages.addReplacement("grimoireofgaia:valkyrie", "lycanitesmobs:troll");

// Forest Mobs -> Vindication Illager
mods.MobStages.addStage("elite", "thebetweenlands:dark_druid");
mods.MobStages.addStage("elite", "grimoireofgaia:spriggan");
mods.MobStages.addStage("elite", "lycanitesmobs:treant");

mods.MobStages.addReplacement("thebetweenlands:dark_druid", "minecraft:vindication_illager");
mods.MobStages.addReplacement("grimoireofgaia:spriggan", "minecraft:vindication_illager");
mods.MobStages.addReplacement("lycanitesmobs:treant", "minecraft:vindication_illager");

// Magical Mobs -> Evocation Illager
mods.MobStages.addStage("elite", "grimoireofgaia:nine_tails");
mods.MobStages.addStage("elite", "grimoireofgaia:witch");

mods.MobStages.addReplacement("grimoireofgaia:nine_tails", "minecraft:evocation_illager");
mods.MobStages.addReplacement("grimoireofgaia:witch", "minecraft:evocation_illager");

// Jungle Mobs -> Triffid
mods.MobStages.addStage("elite", "grimoireofgaia:naga");
mods.MobStages.addStage("elite", "grimoireofgaia:shaman");
mods.MobStages.addStage("elite", "lycanitesmobs:vespidqueen");

mods.MobStages.addReplacement("grimoireofgaia:naga", "lycanitesmobs:triffid");
mods.MobStages.addReplacement("grimoireofgaia:shaman", "lycanitesmobs:triffid");
mods.MobStages.addReplacement("lycanitesmobs:vespidqueen", "lycanitesmobs:triffid");

// Ocean Mobs -> Brainy Zombie (Mermaid) & Raiko (Quetzodracl)
mods.MobStages.addStage("elite", "grimoireofgaia:mermaid");
mods.MobStages.addStage("elite", "lycanitesmobs:quetzodracl");

mods.MobStages.addReplacement("grimoireofgaia:mermaid", "thaumcraft:brainyzombie");
mods.MobStages.addReplacement("lycanitesmobs:quetzodracl", "lycanitesmobs:raiko");

// Savanna Mobs -> Feradon
mods.MobStages.addStage("elite", "lycanitesmobs:roc");

mods.MobStages.addReplacement("lycanitesmobs:roc", "lycanitesmobs:feradon");

// Snowy Mobs -> Frostweaver
mods.MobStages.addStage("elite", "grimoireofgaia:yeti");
mods.MobStages.addStage("elite", "grimoireofgaia:yuki-onna");
mods.MobStages.addStage("elite", "lycanitesmobs:wendigo");

mods.MobStages.addReplacement("grimoireofgaia:yeti", "lycanitesmobs:frostweaver");
mods.MobStages.addReplacement("grimoireofgaia:yuki-onna", "lycanitesmobs:frostweaver");
mods.MobStages.addReplacement("lycanitesmobs:wendigo", "lycanitesmobs:frostweaver");

// ------------------------------------------
// 4. Lycanites Mobs Action Spawner Gating (No Replacements)
// ------------------------------------------
mods.MobStages.addStage("lycanite_spawners", "lycanitesmobs:geonach");
mods.MobStages.addStage("lycanite_spawners", "lycanitesmobs:vapula");
mods.MobStages.addStage("lycanite_spawners", "lycanitesmobs:spriggan");
mods.MobStages.addStage("lycanite_spawners", "lycanitesmobs:ent");
mods.MobStages.addStage("lycanite_spawners", "lycanitesmobs:reaper");
mods.MobStages.addStage("lycanite_spawners", "lycanitesmobs:cinder");
mods.MobStages.addStage("lycanite_spawners", "lycanitesmobs:zephyr");
mods.MobStages.addStage("lycanite_spawners", "lycanitesmobs:xaphan");
mods.MobStages.addStage("lycanite_spawners", "lycanitesmobs:tremor");
mods.MobStages.addStage("lycanite_spawners", "lycanitesmobs:argus");