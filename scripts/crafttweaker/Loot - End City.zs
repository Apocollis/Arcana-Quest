import loottweaker.LootTweaker;
import loottweaker.LootTable;
import loottweaker.LootPool;
import loottweaker.Conditions;
import loottweaker.Functions;


// call loot table

val table = loottweaker.LootTweaker.getTable("minecraft:chests/end_city_treasure");


// call pool, clear it, store for later

table.removePool("main");
table.removePool("xreliquary_inject_pool");

table.addPool("treasure", 1, 2, 0, 0);
table.addPool("goodies", 2, 4, 0, 0);
table.addPool("filler", 3, 3, 0, 0);
table.addPool("equipment", 1, 2, 0, 0);

val treasure = table.getPool("treasure");
val goodies = table.getPool("goodies");
val filler = table.getPool("filler");
val equipment = table.getPool("equipment");


// each chest contains...


// 1-2 filler items

filler.addItemEntry(<minecraft:web>, 50, 0, [Functions.setCount(2, 3)], []);
filler.addItemEntry(<minecraft:ender_pearl>, 30, 0, [Functions.setCount(1, 2)], []);
filler.addItemEntry(<minecraft:shulker_shell>, 25, 0, [Functions.setCount(1, 2)], []);
filler.addItemEntry(<minecraft:chorus_fruit>, 40, 0, [Functions.setCount(1, 2)], []);
filler.addItemEntry(<xreliquary:mob_ingredient:5>, 10, 0);
filler.addItemEntry(<xreliquary:mob_ingredient:8>, 7, 0);
filler.addItemEntry(<xreliquary:mob_ingredient:11>, 15, 0);

// 1-3 goodies

goodies.addItemEntry(<minecraft:ender_eye>, 15, 0, [Functions.setCount(3, 5)], []);
goodies.addItemEntry(<minecraft:dragon_breath>, 20, 0, [Functions.setCount(2, 4)], []);
goodies.addItemEntry(<minecraft:emerald>, 35, 0, [Functions.setCount(3, 5)], []);
goodies.addItemEntry(<minecraft:iron_ingot>, 25, 0, [Functions.setCount(2, 3)], []);
goodies.addItemEntry(<minecraft:gold_ingot>, 40, 0, [Functions.setCount(3, 5)], []);
goodies.addItemEntry(<botania:manaresource:9>, 25, 0, [Functions.setCount(1, 2)], []);
goodies.addItemEntry(<thaumcraft:ingot:0>, 15, 0, [Functions.setCount(3, 4)], []);
goodies.addItemEntry(<thaumcraft:ingot:1>, 10, 0, [Functions.setCount(1, 2)], []);
goodies.addItemEntry(<thaumcraft:void_seed>, 20, 0, [Functions.setCount(2, 3)], []);
goodies.addItemEntry(<astralsorcery:itemcraftingcomponent:1>, 15, 0, [Functions.setCount(2, 3)], []);
goodies.addItemEntry(<astralsorcery:itemcraftingcomponent:2>, 20, 0, [Functions.setCount(3, 5)], []);
goodies.addItemEntry(<thaumcraft:curio:0>, 3, 0);
goodies.addItemEntry(<thaumcraft:curio:2>, 3, 0);
goodies.addItemEntry(<thaumcraft:curio:3>, 7, 0);
goodies.addItemEntry(<thaumcraft:curio:4>, 3, 0);
goodies.addItemEntry(<minecraft:diamond>, 60, 0, [Functions.setCount(2, 3)], []);
goodies.addItemEntry(<quark:rune>, 15, 0, [Functions.setMetadata(0, 15)], []);

// 1-2 equipments
equipment.addItemEntry(<minecraft:diamond_pickaxe>, 4, 0);
equipment.addItemEntry(<minecraft:diamond_sword>, 8, 0);
equipment.addItemEntry(<minecraft:diamond_axe>, 4, 0);
equipment.addItemEntry(<minecraft:diamond_shovel>, 4, 0);
equipment.addItemEntry(<minecraft:diamond_helmet>, 6, 0);
equipment.addItemEntry(<minecraft:diamond_leggings>, 6, 0);
equipment.addItemEntry(<minecraft:diamond_chestplate>, 6, 0);
equipment.addItemEntry(<minecraft:diamond_boots>, 6, 0);
equipment.addItemEntry(<minecraft:diamond_pickaxe>, 6, 0, [Functions.enchantWithLevels(20, 35, false)], []);
equipment.addItemEntry(<minecraft:diamond_sword>, 8, 0, [Functions.enchantWithLevels(20, 35, false)], []);
equipment.addItemEntry(<minecraft:diamond_axe>, 6, 0, [Functions.enchantWithLevels(20, 35, false)], []);
equipment.addItemEntry(<minecraft:diamond_shovel>, 6, 0, [Functions.enchantWithLevels(20, 35, false)], []);
equipment.addItemEntry(<minecraft:diamond_helmet>, 6, 0, [Functions.enchantWithLevels(20, 35, false)], []);
equipment.addItemEntry(<minecraft:diamond_leggings>, 6, 0, [Functions.enchantWithLevels(20, 35, false)], []);
equipment.addItemEntry(<minecraft:diamond_chestplate>, 6, 0, [Functions.enchantWithLevels(20, 35, false)], []);
equipment.addItemEntry(<minecraft:diamond_boots>, 6, 0, [Functions.enchantWithLevels(20, 35, false)], []);
equipment.addItemEntry(<spartanshields:shield_basic_diamond>, 6, 0, [Functions.enchantWithLevels(20, 35, false)], []);

// 1-2 treasure items

treasure.addLootTableEntry("livingenchantment:inject/unique_armor_loot", 7, 0);
treasure.addLootTableEntry("livingenchantment:inject/unique_weap_tool_loot", 7, 0);
treasure.addItemEntry(<botania:blacklotus:1>, 15, 0);
treasure.addItemEntry(<waystones:return_scroll>, 20, 0);
treasure.addItemEntry(<xreliquary:glowing_water>, 20, 0, [Functions.setCount(3, 4)], []);
treasure.addItemEntry(<xreliquary:holy_hand_grenade>, 4, 0, [Functions.setCount(2, 3)], []);
treasure.addItemEntry(<xreliquary:glowing_bread>, 20, 0);
treasure.addItemEntry(<minecraft:golden_apple>, 24, 0);
treasure.addItemEntry(<minecraft:book>, 35, 0, [Functions.enchantWithLevels(20, 30, true)], []);
treasure.addItemEntry(<minecraft:book>, 25, 0, [Functions.enchantWithLevels(30, 45, true)], []);
treasure.addItemEntry(<minecraft:enchanted_book:0>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 12 as short}]}), 5, 0, [], []); # SOULBINDING
treasure.addItemEntry(<minecraft:enchanted_book:0>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 70 as short}]}), 3, 0, [], []); # MENDING
treasure.addItemEntry(<minecraft:enchanted_book:0>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 40 as short}]}), 2, 0, [], []); # VEINING
treasure.addItemEntry(<minecraft:enchanted_book:0>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 54 as short}]}), 5, 0, [], []); # NIGHT VISION
treasure.addItemEntry(<minecraft:enchanted_book:0>.withTag({StoredEnchantments: [{lvl: 2 as short, id: 9 as short}]}), 3, 0, [], []); # FROST WALKER
treasure.addItemEntry(<minecraft:enchanted_book:0>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 29 as short}]}), 5, 0, [], []); # LIVING
treasure.addItemEntry(<quark:ancient_tome>, 20, 0, [Functions.parse({"function": "quark:enchant_tome"})], []);
treasure.addItemEntry(<contenttweaker:life_crystal>, 24, 0);
treasure.addItemEntry(<botania:overgrowthseed>, 20, 0);
treasure.addItemEntry(<minecraft:elytra>, 10, 0);

treasure.addItemEntry(<xreliquary:angelheart_vial>, 8, 0);
treasure.addItemEntry(<quark:enderdragon_scale>, 7, 0);
treasure.addItemEntry(<quark:rune:16>, 5, 0);

treasure.addItemEntry(<botania:starsword>, 2, 0, [Functions.enchantWithLevels(30, 40, false)], []);
treasure.addItemEntry(<botania:thundersword>, 2, 0, [Functions.enchantWithLevels(30, 40, false)], []);
treasure.addItemEntry(<botania:auraring>, 1, 0);
treasure.addItemEntry(<botania:knockbackbelt>, 1, 0);
treasure.addItemEntry(<botania:travelbelt>, 1, 0);
treasure.addItemEntry(<botania:lavapendant>, 1, 0);
treasure.addItemEntry(<botania:magnetring>, 1, 0);
treasure.addItemEntry(<botania:miningring>, 1, 0);
treasure.addItemEntry(<botania:laputashard:4>, 2, 0);
treasure.addItemEntry(<botania:enderhand>, 2, 0);
treasure.addItemEntry(<botania:swapring>, 1, 0);
treasure.addItemEntry(<botania:slimebottle>, 1, 0);
treasure.addItemEntry(<botania:dodgering>, 1, 0);
treasure.addItemEntry(<xreliquary:mercy_cross>, 1, 0, [Functions.enchantWithLevels(30, 40, false)], []);
treasure.addItemEntry(<xreliquary:magicbane>, 1, 0, [Functions.enchantWithLevels(40, 45, false)], []);
treasure.addItemEntry(<xreliquary:angelic_feather>, 1, 0);
treasure.addItemEntry(<xreliquary:destruction_catalyst>, 1, 0);
treasure.addItemEntry(<xreliquary:emperor_chalice>, 1, 0);
treasure.addItemEntry(<xreliquary:ender_staff>, 5, 0);
treasure.addItemEntry(<xreliquary:fortune_coin>, 1, 0);
treasure.addItemEntry(<xreliquary:harvest_rod>, 1, 0);
treasure.addItemEntry(<xreliquary:hero_medallion>, 3, 0);
treasure.addItemEntry(<xreliquary:ice_magus_rod>, 2, 0);
treasure.addItemEntry(<xreliquary:infernal_claws>, 1, 0);
treasure.addItemEntry(<xreliquary:infernal_tear>, 1, 0);
treasure.addItemEntry(<xreliquary:kraken_shell>, 1, 0);
treasure.addItemEntry(<xreliquary:lantern_of_paranoia>, 1, 0);
treasure.addItemEntry(<xreliquary:midas_touchstone>, 1, 0);
treasure.addItemEntry(<xreliquary:rending_gale>, 1, 0);
treasure.addItemEntry(<xreliquary:rod_of_lyssa>, 1, 0);
treasure.addItemEntry(<xreliquary:salamander_eye>, 1, 0);
treasure.addItemEntry(<xreliquary:serpent_staff>, 1, 0);
treasure.addItemEntry(<xreliquary:sojourner_staff>, 1, 0);
treasure.addItemEntry(<xreliquary:twilight_cloak>, 5, 0);
treasure.addItemEntry(<grapplemod:launcheritem>, 3, 0);
treasure.addItemEntry(<grapplemod:repeller>, 3, 0);
treasure.addItemEntry(<grapplemod:longfallboots>, 3, 0);
treasure.addItemEntry(<waystones:warp_stone>, 4, 0);
treasure.addItemEntry(<thaumcraft:cloud_ring>, 2, 0);
treasure.addItemEntry(<embers:dawnstone_mail>, 1, 0);
treasure.addItemEntry(<embers:ashen_amulet>, 1, 0);
treasure.addItemEntry(<embers:explosion_charm>, 1, 0);
treasure.addItemEntry(<embers:nonbeliever_amulet>, 5, 0);
treasure.addItemEntry(<thaumicperiphery:pauldron_repulsion>, 1, 0);
treasure.addItemEntry(<thaumicperiphery:malignant_heart>, 1, 0);
treasure.addItemEntry(<thaumicperiphery:magic_quiver>, 1, 0);
treasure.addItemEntry(<thaumicperiphery:vis_phylactery>, 3, 0);
treasure.addItemEntry(<thaumcraft:traveller_boots>, 1, 0, [Functions.enchantWithLevels(15, 35, false)], []);
treasure.addItemEntry(<thaumcraft:elemental_axe>, 1, 0, [Functions.enchantWithLevels(15, 35, false)], []);
treasure.addItemEntry(<thaumcraft:elemental_shovel>, 1, 0, [Functions.enchantWithLevels(15, 35, false)], []);
treasure.addItemEntry(<thaumcraft:elemental_pick>, 1, 0, [Functions.enchantWithLevels(15, 35, false)], []);
treasure.addItemEntry(<thaumcraft:elemental_hoe>, 1, 0, [Functions.enchantWithLevels(15, 35, false)], []);
treasure.addItemEntry(<thaumcraft:elemental_sword>, 1, 0, [Functions.enchantWithLevels(15, 35, false)], []);
treasure.addItemEntry(<astralsorcery:itemenchantmentamulet>, 3, 0);
treasure.addItemEntry(<astralsorcery:itemarchitectwand>, 1, 0);
treasure.addItemEntry(<astralsorcery:itemexchangewand>, 1, 0);
treasure.addItemEntry(<astralsorcery:itemgrapplewand>, 1, 0);

treasure.addItemEntry(<artifacts:shiny_red_balloon>, 1, 0);
treasure.addItemEntry(<artifacts:obsidian_skull>, 1, 0);
treasure.addItemEntry(<artifacts:shock_pendant>, 2, 0);
treasure.addItemEntry(<artifacts:flame_pendant>, 1, 0);
treasure.addItemEntry(<artifacts:thorn_pendant>, 1, 0);
treasure.addItemEntry(<artifacts:panic_necklace>, 1, 0);
treasure.addItemEntry(<artifacts:lucky_horseshoe>, 1, 0);
treasure.addItemEntry(<artifacts:cobalt_shield>, 2, 0);
treasure.addItemEntry(<artifacts:bottled_cloud>, 1, 0);
treasure.addItemEntry(<artifacts:magma_stone>, 1, 0);
treasure.addItemEntry(<artifacts:feral_claws>, 1, 0);
treasure.addItemEntry(<artifacts:power_glove>, 1, 0);
treasure.addItemEntry(<artifacts:drinking_hat>, 1, 0);
treasure.addItemEntry(<artifacts:star_cloak>, 3, 0);
treasure.addItemEntry(<artifacts:night_vision_goggles>, 2, 0);