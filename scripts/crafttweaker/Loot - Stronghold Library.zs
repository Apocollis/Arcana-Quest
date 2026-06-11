import loottweaker.LootTweaker;
import loottweaker.LootTable;
import loottweaker.LootPool;
import loottweaker.Conditions;
import loottweaker.Functions;


// call loot table

val table = loottweaker.LootTweaker.getTable("minecraft:chests/stronghold_library");


// call pool, clear it, store for later

table.removePool("main");
table.removePool("xreliquary_inject_pool");

table.addPool("treasure", 1, 2, 0, 0);
table.addPool("goodies", 3, 5, 0, 0);
table.addPool("filler", 3, 3, 0, 0);
table.addPool("equipment", 1, 2, 0, 0);

val treasure = table.getPool("treasure");
val goodies = table.getPool("goodies");
val filler = table.getPool("filler");
val equipment = table.getPool("equipment");


// each chest contains...

// 3 filler items

filler.addItemEntry(<minecraft:paper>, 60, 0, [Functions.setCount(3, 5)], []);
filler.addItemEntry(<minecraft:book>, 40, 0, [Functions.setCount(3, 4)], []);
filler.addItemEntry(<minecraft:feather>, 15, 0, [Functions.setCount(2, 3)], []);
filler.addItemEntry(<minecraft:leather>, 10, 0, [Functions.setCount(2, 3)], []);
filler.addItemEntry(<minecraft:string>, 12, 0, [Functions.setCount(2, 3)], []);
filler.addItemEntry(<minecraft:web>, 50, 0, [Functions.setCount(2, 3)], []);

// 2-4 goodies
goodies.addItemEntry(<waystones:return_scroll>, 16, 0);
goodies.addItemEntry(<minecraft:book>, 45, 0, [Functions.enchantWithLevels(20, 30, true)], []);
goodies.addItemEntry(<quark:rune>, 15, 0, [Functions.setMetadata(0, 15)], []);

// 1-2 equipment

equipment.addItemEntry(<minecraft:compass>, 5, 0);
equipment.addItemEntry(<minecraft:clock>, 5, 0);
equipment.addItemEntry(<minecraft:map>, 8, 0);
equipment.addItemEntry(<antiqueatlas:antique_atlas:0>, 4, 0);
equipment.addItemEntry(<antiqueatlas:empty_antique_atlas>, 10, 0);
equipment.addItemEntry(<simpledifficulty:thermometer>, 3, 0);
equipment.addItemEntry(<endercompass:ender_compass>, 3, 0);
equipment.addItemEntry(<naturescompass:naturescompass>, 3, 0);
equipment.addItemEntry(<thaumcraft:scribing_tools>, 5, 0);
equipment.addItemEntry(<astralsorcery:itemconstellationpaper>, 8, 0);
equipment.addItemEntry(<thaumcraft:curio:4>, 2, 0);
equipment.addItemEntry(<thaumcraft:curio:6>, 1, 0);

equipment.addItemEntry(<thaumcraft:goggles>, 2, 0);

// 1-2 treasures

treasure.addLootTableEntry("livingenchantment:inject/unique_armor_loot", 5, 0);
treasure.addLootTableEntry("livingenchantment:inject/unique_weap_tool_loot", 5, 0);
treasure.addItemEntry(<minecraft:filled_map>, 30, 0, [Functions.parse({"function": "quark:set_treasure"})], []);
treasure.addItemEntry(<minecraft:book>, 25, 0, [Functions.enchantWithLevels(30, 40, true)], []);
treasure.addItemEntry(<minecraft:enchanted_book:0>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 12 as short}]}), 7, 0, [], []); # SOULBINDING
treasure.addItemEntry(<minecraft:enchanted_book:0>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 70 as short}]}), 5, 0, [], []); # MENDING
treasure.addItemEntry(<minecraft:enchanted_book:0>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 40 as short}]}), 3, 0, [], []); # VEINING
treasure.addItemEntry(<minecraft:enchanted_book:0>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 54 as short}]}), 3, 0, [], []); # NIGHT VISION
treasure.addItemEntry(<minecraft:enchanted_book:0>.withTag({StoredEnchantments: [{lvl: 2 as short, id: 9 as short}]}), 3, 0, [], []); # FROST WALKER
treasure.addItemEntry(<minecraft:enchanted_book:0>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 29 as short}]}), 5, 0, [], []); # LIVING
treasure.addItemEntry(<quark:ancient_tome>, 25, 0, [Functions.parse({"function": "quark:enchant_tome"})], []);
treasure.addItemEntry(<contenttweaker:life_crystal>, 15, 0);
treasure.addItemEntry(<quark:rune:16>, 5, 0);

treasure.addItemEntry(<thaumcraft:baubles:3>, 5, 0);
treasure.addItemEntry(<astralsorcery:itemenchantmentamulet>, 15, 0);