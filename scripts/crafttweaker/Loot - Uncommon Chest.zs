import loottweaker.LootTweaker;
import loottweaker.LootTable;
import loottweaker.LootPool;
import loottweaker.Conditions;
import loottweaker.Functions;

// call loot table
val table = loottweaker.LootTweaker.getTable("lootchests:serious_loot");

// call pool, store for later
val uncommon = table.getPool("uncommon");
uncommon.setRolls(3, 3);

// add items to pool
uncommon.addItemEntry(<minecraft:gold_ingot> * 3, 30, 0);
uncommon.addItemEntry(<minecraft:emerald> * 2, 15, 0);
uncommon.addItemEntry(<minecraft:diamond>, 25, 0);
uncommon.addItemEntry(<minecraft:blaze_rod>, 15, 0);
uncommon.addItemEntry(<minecraft:golden_apple>, 10, 0);
uncommon.addItemEntry(<minecraft:glowstone_dust> * 5, 10, 0);
uncommon.addItemEntry(<minecraft:dye:4> * 6, 20, 0);
uncommon.addItemEntry(<minecraft:ender_pearl>, 15, 0);
uncommon.addItemEntry(<minecraft:experience_bottle> * 6, 30, 0);
uncommon.addItemEntry(<minecraft:name_tag>, 5, 0);
uncommon.addItemEntry(<minecraft:diamond_horse_armor>, 5, 0);
uncommon.addItemEntry(<minecraft:iron_pickaxe>, 3, 0, [Functions.enchantWithLevels(15, 25, false)], []);
uncommon.addItemEntry(<minecraft:iron_axe>, 3, 0, [Functions.enchantWithLevels(15, 25, false)], []);
uncommon.addItemEntry(<minecraft:iron_sword>, 3, 0, [Functions.enchantWithLevels(15, 25, false)], []);
uncommon.addItemEntry(<minecraft:iron_shovel>, 3, 0, [Functions.enchantWithLevels(15, 25, false)], []);
uncommon.addItemEntry(<minecraft:iron_helmet>, 3, 0, [Functions.enchantWithLevels(15, 25, false)], []);
uncommon.addItemEntry(<minecraft:iron_leggings>, 3, 0, [Functions.enchantWithLevels(15, 25, false)], []);
uncommon.addItemEntry(<minecraft:iron_chestplate>, 3, 0, [Functions.enchantWithLevels(15, 25, false)], []);
uncommon.addItemEntry(<minecraft:iron_boots>, 3, 0, [Functions.enchantWithLevels(15, 25, false)], []);
uncommon.addItemEntry(<spartanshields:shield_basic_iron>, 3, 0, [Functions.enchantWithLevels(15, 25, false)], []);
uncommon.addItemEntry(<minecraft:book>, 15, 0, [Functions.enchantWithLevels(20, 30, false)], []);
uncommon.addItemEntry(<qualitytools:emerald_ring>, 5, 0);
uncommon.addItemEntry(<qualitytools:emerald_amulet>, 5, 0);
uncommon.addItemEntry(<botania:manaresource:0> * 3, 10, 0);
uncommon.addItemEntry(<botania:manaresource:1>, 5, 0);
uncommon.addItemEntry(<botania:manaresource:2>, 5, 0);
uncommon.addItemEntry(<botania:blacklotus>, 10, 0);
uncommon.addItemEntry(<botania:overgrowthseed>, 3, 0);
uncommon.addItemEntry(<waystones:warp_scroll>, 10, 0);
uncommon.addItemEntry(<contenttweaker:life_crystal>, 10, 0);
uncommon.addItemEntry(<xreliquary:glowing_water> * 3, 5, 0);
uncommon.addItemEntry(<xreliquary:angelheart_vial>, 3, 0);
uncommon.addItemEntry(<xreliquary:glowing_bread>, 10, 0);
uncommon.addItemEntry(<xreliquary:mob_ingredient:3>, 3, 0);
uncommon.addItemEntry(<xreliquary:mob_ingredient:4>, 3, 0);
uncommon.addItemEntry(<xreliquary:mob_ingredient:7>, 3, 0);
uncommon.addItemEntry(<xreliquary:mob_ingredient:10>, 3, 0);
uncommon.addItemEntry(<botania:keepivy>, 10, 0);