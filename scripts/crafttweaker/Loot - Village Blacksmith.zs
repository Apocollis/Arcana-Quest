import loottweaker.LootTweaker;
import loottweaker.LootTable;
import loottweaker.LootPool;
import loottweaker.Conditions;
import loottweaker.Functions;


// call loot table

val table = loottweaker.LootTweaker.getTable("minecraft:chests/village_blacksmith");


// call pool, clear it, store for later

table.removePool("main");
table.removePool("botania_inject_pool");
table.removePool("xreliquary_inject_pool");

table.addPool("coins", 1, 2, 0, 0);
table.addPool("goodies", 2, 4, 0, 0);
table.addPool("filler", 2, 2, 0, 0);
table.addPool("equipment", 2, 3, 0, 0);

val coins = table.getPool("coins");
val goodies = table.getPool("goodies");
val filler = table.getPool("filler");
val equipment = table.getPool("equipment");


// each chest contains...

// 3 filler items

filler.addItemEntry(<minecraft:gunpowder>, 15, 0, [Functions.setCount(1, 3)], []);
filler.addItemEntry(<minecraft:book>, 12, 0, [Functions.setCount(1, 1)], []);
filler.addItemEntry(<minecraft:coal>, 15, 0, [Functions.setCount(2, 4)], []);
filler.addItemEntry(<minecraft:string>, 30, 0, [Functions.setCount(1, 2)], []);
filler.addItemEntry(<minecraft:web>, 30, 0, [Functions.setCount(2, 3)], []);
filler.addItemEntry(<minecraft:iron_nugget>, 30, 0, [Functions.setCount(2, 3)], []);
filler.addItemEntry(<minecraft:arrow>, 25, 0, [Functions.setCount(5, 7)], []);

// 2-4 goodies

goodies.addItemEntry(<minecraft:bread>, 20, 0, [Functions.setCount(2, 3)], []);
goodies.addItemEntry(<minecraft:apple>, 20, 0, [Functions.setCount(2, 3)], []);
goodies.addItemEntry(<minecraft:leather>, 25, 0, [Functions.setCount(2, 3)], []);
goodies.addItemEntry(<minecraft:redstone>, 12, 0, [Functions.setCount(3, 5)], []);
goodies.addItemEntry(<minecraft:iron_ingot>, 50, 0, [Functions.setCount(2, 3)], []);
goodies.addItemEntry(<minecraft:gold_ingot>, 20, 0, [Functions.setCount(1, 2)], []);
goodies.addItemEntry(<minecraft:emerald>, 15, 0, [Functions.setCount(1, 2)], []);
goodies.addItemEntry(<minecraft:dye:4>, 5, 0, [Functions.setCount(2, 3)], []);
goodies.addItemEntry(<minecraft:name_tag>, 5, 0, [Functions.setCount(1, 1)], []);
goodies.addItemEntry(<botania:manaresource:0>, 10, 0, [Functions.setCount(1, 2)], []);
goodies.addItemEntry(<thaumcraft:ingot:0>, 10, 0, [Functions.setCount(2, 3)], []);
goodies.addItemEntry(<astralsorcery:itemcraftingcomponent:0>, 10, 0, [Functions.setCount(2, 4)], []);
goodies.addItemEntry(<quark:rune>, 25, 0, [Functions.setMetadata(0, 15)], []);
goodies.addLootTableEntry("xreliquary:inject/chests/village_blacksmith", 12, 0);
goodies.addItemEntry(<minecraft:golden_apple>, 3, 0);
goodies.addItemEntry(<minecraft:diamond>, 10, 0);
goodies.addItemEntry(<minecraft:lava_bucket>, 7, 0);
goodies.addItemEntry(<botania:blacklotus>, 24, 0);
goodies.addItemEntry(<waystones:return_scroll>, 20, 0);
goodies.addItemEntry(<minecraft:book>, 35, 0, [Functions.enchantWithLevels(18, 25, true)], []);
goodies.addItemEntry(<minecraft:book>, 25, 0, [Functions.enchantWithLevels(25, 35, true)], []);
goodies.addItemEntry(<botania:keepivy>, 20, 0);
goodies.addItemEntry(<xreliquary:gun_part:0>, 2, 0);
goodies.addItemEntry(<xreliquary:gun_part:1>, 2, 0);
goodies.addItemEntry(<xreliquary:gun_part:2>, 2, 0);
goodies.addItemEntry(<quark:rune:16>, 5, 0);


// 2-3 equipment

equipment.addLootTableEntry("livingenchantment:inject/unique_armor_loot", 1, 0);
equipment.addLootTableEntry("livingenchantment:inject/unique_weap_tool_loot", 1, 0);
equipment.addItemEntry(<minecraft:iron_horse_armor>, 7, 0);
equipment.addItemEntry(<minecraft:golden_horse_armor>, 3, 0);
equipment.addItemEntry(<minecraft:stone_pickaxe>, 7, 0);
equipment.addItemEntry(<minecraft:stone_axe>, 7, 0);
equipment.addItemEntry(<minecraft:stone_sword>, 7, 0);
equipment.addItemEntry(<minecraft:stone_shovel>, 7, 0);
equipment.addItemEntry(<minecraft:leather_helmet>, 7, 0);
equipment.addItemEntry(<minecraft:leather_leggings>, 7, 0);
equipment.addItemEntry(<minecraft:leather_chestplate>, 7, 0);
equipment.addItemEntry(<minecraft:leather_boots>, 7, 0);
equipment.addItemEntry(<minecraft:iron_pickaxe>, 6, 0);
equipment.addItemEntry(<minecraft:iron_axe>, 6, 0);
equipment.addItemEntry(<minecraft:iron_sword>, 6, 0);
equipment.addItemEntry(<minecraft:iron_shovel>, 6, 0);
equipment.addItemEntry(<minecraft:chainmail_helmet>, 5, 0);
equipment.addItemEntry(<minecraft:chainmail_leggings>, 5, 0);
equipment.addItemEntry(<minecraft:chainmail_chestplate>, 5, 0);
equipment.addItemEntry(<minecraft:chainmail_boots>, 5, 0);
equipment.addItemEntry(<minecraft:bow>, 10, 0);
equipment.addItemEntry(<spartanshields:shield_basic_iron>, 3, 0);
equipment.addItemEntry(<minecraft:iron_pickaxe>, 3, 0, [Functions.enchantWithLevels(10, 25, false)], []);
equipment.addItemEntry(<minecraft:iron_axe>, 3, 0, [Functions.enchantWithLevels(10, 25, false)], []);
equipment.addItemEntry(<minecraft:iron_sword>, 3, 0, [Functions.enchantWithLevels(10, 25, false)], []);
equipment.addItemEntry(<minecraft:iron_shovel>, 3, 0, [Functions.enchantWithLevels(10, 25, false)], []);
equipment.addItemEntry(<minecraft:chainmail_helmet>, 3, 0, [Functions.enchantWithLevels(10, 25, false)], []);
equipment.addItemEntry(<minecraft:chainmail_leggings>, 3, 0, [Functions.enchantWithLevels(10, 25, false)], []);
equipment.addItemEntry(<minecraft:chainmail_chestplate>, 3, 0, [Functions.enchantWithLevels(10, 25, false)], []);
equipment.addItemEntry(<minecraft:chainmail_boots>, 3, 0, [Functions.enchantWithLevels(10, 25, false)], []);
equipment.addItemEntry(<minecraft:iron_helmet>, 2, 0, [Functions.enchantWithLevels(10, 25, false)], []);
equipment.addItemEntry(<minecraft:iron_leggings>, 2, 0, [Functions.enchantWithLevels(10, 25, false)], []);
equipment.addItemEntry(<minecraft:iron_chestplate>, 2, 0, [Functions.enchantWithLevels(10, 25, false)], []);
equipment.addItemEntry(<minecraft:iron_boots>, 2, 0, [Functions.enchantWithLevels(10, 25, false)], []);
equipment.addItemEntry(<spartanshields:shield_basic_iron>, 3, 0, [Functions.enchantWithLevels(10, 25, false)], []);
equipment.addItemEntry(<minecraft:bow>, 5, 0, [Functions.enchantWithLevels(10, 25, false)], []);
equipment.addItemEntry(<qualitytools:emerald_ring>, 10, 0);
equipment.addItemEntry(<qualitytools:emerald_amulet>, 10, 0);

// 1-2 coins

coins.addItemEntry(<ordinarycoins:coinbronze>, 10, 0, [Functions.setCount(3, 8)], []);
coins.addItemEntry(<ordinarycoins:coinsilver>, 3, 0, [Functions.setCount(1, 4)], []);
coins.addItemEntry(<ordinarycoins:coingold>, 1, 0, [Functions.setCount(1, 1)], []);

