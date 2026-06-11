import loottweaker.LootTweaker;
import loottweaker.LootTable;
import loottweaker.LootPool;
import loottweaker.Conditions;
import loottweaker.Functions;


// call loot table

val table = loottweaker.LootTweaker.getTable("minecraft:chests/jungle_temple");


// call pool, clear it, store for later

table.removePool("main");
table.removePool("botania_inject_pool");
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

// 3 filler items

filler.addItemEntry(<minecraft:gunpowder>, 20, 0, [Functions.setCount(1, 3)], []);
filler.addItemEntry(<minecraft:book>, 12, 0, [Functions.setCount(1, 1)], []);
filler.addItemEntry(<minecraft:coal>, 15, 0, [Functions.setCount(2, 4)], []);
filler.addItemEntry(<minecraft:bone>, 30, 0, [Functions.setCount(1, 3)], []);
filler.addItemEntry(<minecraft:rotten_flesh>, 30, 0, [Functions.setCount(1, 2)], []);
filler.addItemEntry(<minecraft:string>, 30, 0, [Functions.setCount(1, 2)], []);
filler.addItemEntry(<minecraft:web>, 50, 0, [Functions.setCount(2, 3)], []);

// 2-4 goodies

goodies.addItemEntry(<minecraft:redstone>, 20, 0, [Functions.setCount(3, 5)], []);
goodies.addItemEntry(<minecraft:iron_ingot>, 30, 0, [Functions.setCount(2, 3)], []);
goodies.addItemEntry(<minecraft:gold_ingot>, 30, 0, [Functions.setCount(1, 2)], []);
goodies.addItemEntry(<minecraft:emerald>, 16, 0, [Functions.setCount(1, 3)], []);
goodies.addItemEntry(<minecraft:diamond>, 20, 0, [Functions.setCount(1, 3)], []);
goodies.addItemEntry(<minecraft:slime_ball>, 10, 0, [Functions.setCount(1, 2)], []);
goodies.addItemEntry(<minecraft:ender_pearl>, 10, 0, [Functions.setCount(1, 1)], []);
goodies.addItemEntry(<minecraft:experience_bottle>, 30, 0, [Functions.setCount(2, 4)], []);
goodies.addItemEntry(<minecraft:dye:4>, 20, 0, [Functions.setCount(2, 3)], []);
goodies.addItemEntry(<minecraft:name_tag>, 5, 0, [Functions.setCount(1, 1)], []);
goodies.addItemEntry(<botania:manaresource:0>, 10, 0, [Functions.setCount(1, 2)], []);
goodies.addItemEntry(<botania:manaresource:23>, 5, 0, [Functions.setCount(2, 3)], []);
goodies.addItemEntry(<thaumcraft:salis_mundus>, 5, 0, [Functions.setCount(2, 4)], []);
goodies.addItemEntry(<thaumcraft:ingot:0>, 10, 0, [Functions.setCount(2, 3)], []);
goodies.addItemEntry(<astralsorcery:itemcraftingcomponent:0>, 10, 0, [Functions.setCount(2, 4)], []);
goodies.addItemEntry(<xreliquary:mob_ingredient:0>, 3, 0);
goodies.addItemEntry(<xreliquary:mob_ingredient:2>, 2, 0);
goodies.addItemEntry(<xreliquary:mob_ingredient:3>, 2, 0);
goodies.addItemEntry(<xreliquary:mob_ingredient:4>, 2, 0);
goodies.addItemEntry(<xreliquary:mob_ingredient:5>, 2, 0);
goodies.addItemEntry(<xreliquary:mob_ingredient:6>, 3, 0);
goodies.addItemEntry(<thaumcraft:curio:0>, 1, 0);
goodies.addItemEntry(<thaumcraft:curio:2>, 2, 0);
goodies.addItemEntry(<thaumcraft:curio:3>, 1, 0);
goodies.addItemEntry(<thaumcraft:curio:4>, 2, 0);
goodies.addItemEntry(<botania:keepivy>, 12, 0);
goodies.addItemEntry(<quark:rune>, 12, 0, [Functions.setMetadata(0, 15)], []);


// 1-2 equipment

equipment.addItemEntry(<minecraft:golden_horse_armor>, 3, 0);
equipment.addItemEntry(<minecraft:leather_helmet>, 7, 0);
equipment.addItemEntry(<minecraft:leather_leggings>, 7, 0);
equipment.addItemEntry(<minecraft:leather_chestplate>, 7, 0);
equipment.addItemEntry(<minecraft:leather_boots>, 7, 0);
equipment.addItemEntry(<minecraft:golden_pickaxe>, 6, 0);
equipment.addItemEntry(<minecraft:golden_axe>, 6, 0);
equipment.addItemEntry(<minecraft:golden_sword>, 6, 0);
equipment.addItemEntry(<minecraft:golden_shovel>, 6, 0);
equipment.addItemEntry(<minecraft:golden_helmet>, 5, 0);
equipment.addItemEntry(<minecraft:golden_leggings>, 5, 0);
equipment.addItemEntry(<minecraft:golden_chestplate>, 5, 0);
equipment.addItemEntry(<minecraft:golden_boots>, 5, 0);
equipment.addItemEntry(<minecraft:bow>, 10, 0);
equipment.addItemEntry(<minecraft:golden_pickaxe>, 4, 0, [Functions.enchantWithLevels(15, 30, false)], []);
equipment.addItemEntry(<minecraft:golden_axe>, 4, 0, [Functions.enchantWithLevels(15, 30, false)], []);
equipment.addItemEntry(<minecraft:golden_sword>, 4, 0, [Functions.enchantWithLevels(15, 30, false)], []);
equipment.addItemEntry(<minecraft:golden_shovel>, 4, 0, [Functions.enchantWithLevels(15, 30, false)], []);
equipment.addItemEntry(<minecraft:golden_helmet>, 4, 0, [Functions.enchantWithLevels(15, 30, false)], []);
equipment.addItemEntry(<minecraft:golden_leggings>, 4, 0, [Functions.enchantWithLevels(15, 30, false)], []);
equipment.addItemEntry(<minecraft:golden_chestplate>, 4, 0, [Functions.enchantWithLevels(15, 30, false)], []);
equipment.addItemEntry(<minecraft:golden_boots>, 4, 0, [Functions.enchantWithLevels(15, 30, false)], []);
equipment.addItemEntry(<minecraft:bow>, 7, 0, [Functions.enchantWithLevels(15, 30, false)], []);


// 1-2 treasures

treasure.addItemEntry(<minecraft:filled_map>, 5, 0, [Functions.parse({"function": "quark:set_treasure"})], []);
treasure.addItemEntry(<qualitytools:emerald_ring>, 10, 0);
treasure.addItemEntry(<qualitytools:emerald_amulet>, 10, 0);
treasure.addItemEntry(<botania:blacklotus>, 27, 0);
treasure.addItemEntry(<botania:blacklotus:1>, 15, 0);
treasure.addItemEntry(<waystones:return_scroll>, 20, 0);
treasure.addItemEntry(<xreliquary:glowing_water>, 20, 0, [Functions.setCount(3, 4)], []);
treasure.addItemEntry(<xreliquary:holy_hand_grenade>, 4, 0, [Functions.setCount(2, 3)], []);
treasure.addItemEntry(<xreliquary:glowing_bread>, 20, 0);
treasure.addItemEntry(<botania:worldseed>, 15, 0);
treasure.addItemEntry(<minecraft:golden_apple>, 24, 0);
treasure.addItemEntry(<minecraft:diamond>, 40, 0);
treasure.addItemEntry(<minecraft:book>, 35, 0, [Functions.enchantWithLevels(18, 25, true)], []);
treasure.addItemEntry(<minecraft:book>, 25, 0, [Functions.enchantWithLevels(25, 35, true)], []);
treasure.addItemEntry(<minecraft:enchanted_book:0>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 12 as short}]}), 3, 0, [], []); # SOULBINDING
treasure.addItemEntry(<minecraft:enchanted_book:0>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 70 as short}]}), 3, 0, [], []); # MENDING
treasure.addItemEntry(<minecraft:enchanted_book:0>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 40 as short}]}), 2, 0, [], []); # VEINING
treasure.addItemEntry(<minecraft:enchanted_book:0>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 54 as short}]}), 2, 0, [], []); # NIGHT VISION
treasure.addItemEntry(<minecraft:enchanted_book:0>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 9 as short}]}), 3, 0, [], []); # FROST WALKER
treasure.addItemEntry(<minecraft:enchanted_book:0>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 29 as short}]}), 1, 0, [], []); # LIVING
treasure.addItemEntry(<quark:ancient_tome>, 10, 0, [Functions.parse({"function": "quark:enchant_tome"})], []);
treasure.addItemEntry(<contenttweaker:life_crystal>, 24, 0);
treasure.addItemEntry(<botania:overgrowthseed>, 30, 0);
treasure.addItemEntry(<xreliquary:angelheart_vial>, 6, 0);
treasure.addItemEntry(<quark:rune:16>, 5, 0);
treasure.addItemEntry(<botania:starsword>, 1, 0, [Functions.enchantWithLevels(30, 40, false)], []);
treasure.addItemEntry(<botania:thundersword>, 1, 0, [Functions.enchantWithLevels(30, 40, false)], []);
treasure.addItemEntry(<botania:auraring>, 1, 0);
treasure.addItemEntry(<botania:knockbackbelt>, 1, 0);
treasure.addItemEntry(<botania:icependant>, 1, 0);
treasure.addItemEntry(<botania:travelbelt>, 1, 0);
treasure.addItemEntry(<botania:lavapendant>, 1, 0);
treasure.addItemEntry(<botania:magnetring>, 1, 0);
treasure.addItemEntry(<botania:waterring>, 1, 0);
treasure.addItemEntry(<botania:miningring>, 1, 0);
treasure.addItemEntry(<botania:laputashard:4>, 1, 0);
treasure.addItemEntry(<botania:enderhand>, 1, 0);
treasure.addItemEntry(<botania:thornchakram:1>, 1, 0, [Functions.setCount(2, 3)], []);
treasure.addItemEntry(<botania:swapring>, 1, 0);
treasure.addItemEntry(<botania:pinkinator>, 1, 0);
treasure.addItemEntry(<botania:cacophonium>, 1, 0);
treasure.addItemEntry(<botania:slimebottle>, 2, 0);
treasure.addItemEntry(<botania:dodgering>, 1, 0);
treasure.addItemEntry(<xreliquary:mercy_cross>, 1, 0, [Functions.enchantWithLevels(30, 40, false)], []);
treasure.addItemEntry(<xreliquary:magicbane>, 1, 0, [Functions.enchantWithLevels(40, 45, false)], []);
treasure.addItemEntry(<xreliquary:angelic_feather>, 1, 0);
treasure.addItemEntry(<xreliquary:destruction_catalyst>, 1, 0);
treasure.addItemEntry(<xreliquary:emperor_chalice>, 1, 0);
treasure.addItemEntry(<xreliquary:ender_staff>, 1, 0);
treasure.addItemEntry(<xreliquary:fortune_coin>, 1, 0);
treasure.addItemEntry(<xreliquary:glacial_staff>, 1, 0);
treasure.addItemEntry(<xreliquary:harvest_rod>, 2, 0);
treasure.addItemEntry(<xreliquary:hero_medallion>, 1, 0);
treasure.addItemEntry(<xreliquary:ice_magus_rod>, 1, 0);
treasure.addItemEntry(<xreliquary:infernal_claws>, 1, 0);
treasure.addItemEntry(<xreliquary:infernal_tear>, 1, 0);
treasure.addItemEntry(<xreliquary:kraken_shell>, 2, 0);
treasure.addItemEntry(<xreliquary:lantern_of_paranoia>, 1, 0);
treasure.addItemEntry(<xreliquary:midas_touchstone>, 1, 0);
treasure.addItemEntry(<xreliquary:rending_gale>, 2, 0);
treasure.addItemEntry(<xreliquary:rod_of_lyssa>, 1, 0);
treasure.addItemEntry(<xreliquary:salamander_eye>, 1, 0);
treasure.addItemEntry(<xreliquary:serpent_staff>, 3, 0);
treasure.addItemEntry(<xreliquary:shears_of_winter>, 1, 0);
treasure.addItemEntry(<xreliquary:sojourner_staff>, 1, 0);
treasure.addItemEntry(<xreliquary:twilight_cloak>, 1, 0);
treasure.addItemEntry(<xreliquary:fertile_lilypad>, 2, 0);
treasure.addItemEntry(<grapplemod:launcheritem>, 1, 0);
treasure.addItemEntry(<grapplemod:repeller>, 1, 0);
treasure.addItemEntry(<grapplemod:longfallboots>, 1, 0);
treasure.addItemEntry(<waystones:warp_stone>, 1, 0);
treasure.addItemEntry(<thaumcraft:cloud_ring>, 1, 0);
treasure.addItemEntry(<thaumcraft:baubles:3>, 3, 0);
treasure.addItemEntry(<thaumcraft:traveller_boots>, 1, 0);
treasure.addItemEntry(<thaumcraft:elemental_axe>, 1, 0);
treasure.addItemEntry(<thaumcraft:elemental_shovel>, 1, 0);
treasure.addItemEntry(<thaumcraft:elemental_pick>, 1, 0);
treasure.addItemEntry(<thaumcraft:elemental_hoe>, 1, 0);
treasure.addItemEntry(<thaumcraft:elemental_sword>, 1, 0);
treasure.addItemEntry(<embers:ember_ring>, 1, 0);
treasure.addItemEntry(<embers:ember_belt>, 1, 0);
treasure.addItemEntry(<embers:ember_amulet>, 1, 0);
treasure.addItemEntry(<embers:dawnstone_mail>, 1, 0);
treasure.addItemEntry(<embers:ashen_amulet>, 1, 0);
treasure.addItemEntry(<embers:nonbeliever_amulet>, 1, 0);
treasure.addItemEntry(<thaumicperiphery:pauldron_repulsion>, 1, 0);
treasure.addItemEntry(<thaumicperiphery:malignant_heart>, 1, 0);
treasure.addItemEntry(<thaumicperiphery:magic_quiver>, 1, 0);
treasure.addItemEntry(<thaumicperiphery:vis_phylactery>, 1, 0);
treasure.addItemEntry(<astralsorcery:itemenchantmentamulet>, 3, 0);
treasure.addItemEntry(<astralsorcery:itemarchitectwand>, 1, 0);
treasure.addItemEntry(<astralsorcery:itemexchangewand>, 1, 0);
treasure.addItemEntry(<astralsorcery:itemgrapplewand>, 1, 0);
treasure.addItemEntry(<artifacts:shiny_red_balloon>, 1, 0);
treasure.addItemEntry(<artifacts:obsidian_skull>, 2, 0);
treasure.addItemEntry(<artifacts:snorkel>, 2, 0);
treasure.addItemEntry(<artifacts:shock_pendant>, 1, 0);
treasure.addItemEntry(<artifacts:flame_pendant>, 1, 0);
treasure.addItemEntry(<artifacts:thorn_pendant>, 2, 0);
treasure.addItemEntry(<artifacts:panic_necklace>, 1, 0);
treasure.addItemEntry(<artifacts:lucky_horseshoe>, 1, 0);
treasure.addItemEntry(<artifacts:cobalt_shield>, 1, 0);
treasure.addItemEntry(<artifacts:whoopie_cushion>, 1, 0);
treasure.addItemEntry(<artifacts:bottled_cloud>, 1, 0);
treasure.addItemEntry(<artifacts:magma_stone>, 1, 0);
treasure.addItemEntry(<artifacts:feral_claws>, 2, 0);
treasure.addItemEntry(<artifacts:power_glove>, 1, 0);
treasure.addItemEntry(<artifacts:drinking_hat>, 1, 0);
treasure.addItemEntry(<artifacts:star_cloak>, 1, 0);
treasure.addItemEntry(<artifacts:lucky_horseshoe>, 1, 0);
treasure.addItemEntry(<artifacts:night_vision_goggles>, 1, 0);