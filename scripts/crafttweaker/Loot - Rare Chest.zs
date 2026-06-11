import loottweaker.LootTweaker;
import loottweaker.LootTable;
import loottweaker.LootPool;
import loottweaker.Conditions;
import loottweaker.Functions;

// call loot table
val table = loottweaker.LootTweaker.getTable("lootchests:serious_loot");

// call pool, store for later
val rare = table.getPool("rare");
rare.setRolls(3, 3);

// add items too pool
rare.addItemEntry(<minecraft:gold_ingot> * 7, 30, 0);
rare.addItemEntry(<minecraft:emerald> * 5, 15, 0);
rare.addItemEntry(<minecraft:diamond> * 3, 20, 0);
rare.addItemEntry(<minecraft:blaze_rod> * 2, 20, 0);
rare.addItemEntry(<minecraft:golden_apple:1>, 10, 0);
rare.addItemEntry(<minecraft:ender_pearl> * 3, 15, 0);
rare.addItemEntry(<minecraft:experience_bottle> * 12, 30, 0);
rare.addItemEntry(<minecraft:diamond_helmet>, 3, 0, [Functions.enchantWithLevels(15, 25, false)], []);
rare.addItemEntry(<minecraft:diamond_leggings>, 3, 0, [Functions.enchantWithLevels(15, 25, false)], []);
rare.addItemEntry(<minecraft:diamond_chestplate>, 3, 0, [Functions.enchantWithLevels(15, 25, false)], []);
rare.addItemEntry(<minecraft:diamond_boots>, 3, 0, [Functions.enchantWithLevels(15, 25, false)], []);
rare.addItemEntry(<minecraft:diamond_sword>, 5, 0, [Functions.enchantWithLevels(15, 35, false)], []);
rare.addItemEntry(<minecraft:book>, 15, 0, [Functions.enchantWithLevels(25, 35, false)], []);
rare.addItemEntry(<minecraft:enchanted_book:0>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 12 as short}]}), 1, 0, [], []);
rare.addItemEntry(<minecraft:enchanted_book:0>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 70 as short}]}), 1, 0, [], []);
rare.addItemEntry(<botania:manaresource:7>, 10, 0);
rare.addItemEntry(<botania:manaresource:4>, 3, 0);
rare.addItemEntry(<botania:blacklotus:1>, 25, 0);
rare.addItemEntry(<botania:overgrowthseed>, 20, 0);
rare.addItemEntry(<contenttweaker:life_crystal>, 15, 0);
rare.addItemEntry(<xreliquary:holy_hand_grenade> * 3, 10, 0);
rare.addItemEntry(<xreliquary:angelheart_vial>, 10, 0);
rare.addItemEntry(<xreliquary:mob_ingredient:8>, 3, 0);
rare.addItemEntry(<xreliquary:mob_ingredient:9>, 3, 0);
rare.addItemEntry(<xreliquary:mob_ingredient:11>, 3, 0);
rare.addItemEntry(<xreliquary:mob_ingredient:13>, 3, 0);
rare.addItemEntry(<xreliquary:gun_part:0>, 2, 0);
rare.addItemEntry(<xreliquary:gun_part:1>, 2, 0);
rare.addItemEntry(<xreliquary:gun_part:2>, 2, 0);
rare.addItemEntry(<botania:keepivy> * 2, 10, 0);
rare.addItemEntry(<astralsorcery:itemenchantmentamulet>, 2, 0);
rare.addItemEntry(<artifacts:shiny_red_balloon>, 1, 0);
rare.addItemEntry(<artifacts:obsidian_skull>, 1, 0);
rare.addItemEntry(<artifacts:shock_pendant>, 1, 0);
rare.addItemEntry(<artifacts:flame_pendant>, 1, 0);
rare.addItemEntry(<artifacts:thorn_pendant>, 1, 0);
rare.addItemEntry(<artifacts:panic_necklace>, 1, 0);
rare.addItemEntry(<artifacts:lucky_horseshoe>, 1, 0);
rare.addItemEntry(<artifacts:cobalt_shield>, 1, 0);
rare.addItemEntry(<artifacts:bottled_cloud>, 1, 0);
rare.addItemEntry(<artifacts:magma_stone>, 1, 0);
rare.addItemEntry(<artifacts:feral_claws>, 1, 0);
rare.addItemEntry(<artifacts:power_glove>, 1, 0);
rare.addItemEntry(<artifacts:drinking_hat>, 1, 0);
rare.addItemEntry(<artifacts:star_cloak>, 1, 0);
rare.addItemEntry(<artifacts:pocket_piston>, 1, 0);
rare.addItemEntry(<artifacts:night_vision_goggles>, 1, 0);