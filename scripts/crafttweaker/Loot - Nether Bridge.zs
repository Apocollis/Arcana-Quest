import loottweaker.LootTweaker;
import loottweaker.LootTable;
import loottweaker.LootPool;
import loottweaker.Conditions;
import loottweaker.Functions;


// call loot table

val table = loottweaker.LootTweaker.getTable("minecraft:chests/nether_bridge");


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

filler.addItemEntry(<minecraft:gunpowder>, 20, 0, [Functions.setCount(1, 3)], []);
filler.addItemEntry(<minecraft:coal>, 25, 0, [Functions.setCount(2, 4)], []);
filler.addItemEntry(<minecraft:rotten_flesh>, 30, 0, [Functions.setCount(1, 2)], []);
filler.addItemEntry(<minecraft:string>, 30, 0, [Functions.setCount(1, 2)], []);
filler.addItemEntry(<minecraft:skull:1>, 10, 0, [Functions.setCount(1, 1)], []);
filler.addItemEntry(<inspirations:materials:7>, 50, 0, [Functions.setCount(1, 1)], []);
filler.addItemEntry(<netherex:black_salamander_hide>, 30, 0, [Functions.setCount(1, 2)], []);
filler.addItemEntry(<xreliquary:mob_ingredient:1>, 15, 0);
filler.addItemEntry(<xreliquary:mob_ingredient:6>, 10, 0);
filler.addItemEntry(<xreliquary:mob_ingredient:7>, 7, 0);
filler.addItemEntry(<xreliquary:mob_ingredient:11>, 3, 0);

// 1-3 goodies

goodies.addItemEntry(<minecraft:quartz>, 20, 0, [Functions.setCount(3, 5)], []);
goodies.addItemEntry(<netherex:amethyst_crystal>, 20, 0, [Functions.setCount(3, 5)], []);
goodies.addItemEntry(<minecraft:nether_wart>, 15, 0, [Functions.setCount(3, 5)], []);
goodies.addItemEntry(<minecraft:ghast_tear>, 12, 0, [Functions.setCount(2, 3)], []);
goodies.addItemEntry(<minecraft:magma_cream>, 15, 0, [Functions.setCount(3, 5)], []);
goodies.addItemEntry(<minecraft:glowstone_dust>, 35, 0, [Functions.setCount(3, 5)], []);
goodies.addItemEntry(<minecraft:iron_ingot>, 25, 0, [Functions.setCount(2, 3)], []);
goodies.addItemEntry(<minecraft:gold_ingot>, 70, 0, [Functions.setCount(3, 5)], []);
goodies.addItemEntry(<thaumcraft:salis_mundus>, 5, 0, [Functions.setCount(2, 4)], []);
goodies.addItemEntry(<thaumcraft:ingot:0>, 15, 0, [Functions.setCount(3, 4)], []);
goodies.addItemEntry(<thaumcraft:ingot:1>, 5, 0, [Functions.setCount(1, 2)], []);
goodies.addItemEntry(<thaumcraft:void_seed>, 12, 0, [Functions.setCount(2, 3)], []);
goodies.addItemEntry(<thaumcraft:curio:0>, 4, 0);
goodies.addItemEntry(<thaumcraft:curio:1>, 3, 0);
goodies.addItemEntry(<thaumcraft:curio:2>, 4, 0);
goodies.addItemEntry(<thaumcraft:curio:3>, 3, 0);
goodies.addItemEntry(<thaumcraft:curio:4>, 4, 0);
goodies.addItemEntry(<thaumcraft:crystal_aer>, 3, 0, [Functions.setCount(2, 4)], []);
goodies.addItemEntry(<thaumcraft:crystal_ignis>, 8, 0, [Functions.setCount(2, 4)], []);
goodies.addItemEntry(<thaumcraft:crystal_ordo>, 2, 0, [Functions.setCount(2, 4)], []);
goodies.addItemEntry(<thaumcraft:crystal_perditio>, 5, 0, [Functions.setCount(2, 4)], []);
goodies.addItemEntry(<minecraft:diamond>, 45, 0, [Functions.setCount(1, 2)], []);
goodies.addItemEntry(<quark:rune>, 15, 0, [Functions.setMetadata(0, 15)], []);

// 1-2 equipments

equipment.addItemEntry(<netherex:withered_amedian_pickaxe>, 1, 0);
equipment.addItemEntry(<netherex:withered_amedian_sword>, 2, 0);
equipment.addItemEntry(<netherex:withered_amedian_axe>, 1, 0);
equipment.addItemEntry(<netherex:withered_amedian_shovel>, 1, 0);
equipment.addItemEntry(<netherex:wither_bone_helmet>, 2, 0);
equipment.addItemEntry(<netherex:wither_bone_leggings>, 2, 0);
equipment.addItemEntry(<netherex:wither_bone_chestplate>, 2, 0);
equipment.addItemEntry(<netherex:wither_bone_boots>, 2, 0);
equipment.addItemEntry(<netherex:withered_amedian_pickaxe>, 3, 0, [Functions.enchantWithLevels(20, 35, false)], []);
equipment.addItemEntry(<netherex:withered_amedian_sword>, 4, 0, [Functions.enchantWithLevels(20, 35, false)], []);
equipment.addItemEntry(<netherex:withered_amedian_axe>, 3, 0, [Functions.enchantWithLevels(20, 35, false)], []);
equipment.addItemEntry(<netherex:withered_amedian_shovel>, 3, 0, [Functions.enchantWithLevels(20, 35, false)], []);
equipment.addItemEntry(<netherex:wither_bone_helmet>, 3, 0, [Functions.enchantWithLevels(20, 35, false)], []);
equipment.addItemEntry(<netherex:wither_bone_leggings>, 3, 0, [Functions.enchantWithLevels(20, 35, false)], []);
equipment.addItemEntry(<netherex:wither_bone_chestplate>, 3, 0, [Functions.enchantWithLevels(20, 35, false)], []);
equipment.addItemEntry(<netherex:wither_bone_boots>, 3, 0, [Functions.enchantWithLevels(20, 35, false)], []);
equipment.addItemEntry(<minecraft:bow>, 4, 0, [Functions.enchantWithLevels(15, 25, false)], []);
equipment.addItemEntry(<spartanshields:shield_basic_gold>, 3, 0, [Functions.enchantWithLevels(20, 35, false)], []);

// 1-2 treasure items

treasure.addLootTableEntry("livingenchantment:inject/unique_armor_loot", 7, 0);
treasure.addLootTableEntry("livingenchantment:inject/unique_weap_tool_loot", 7, 0);
treasure.addItemEntry(<qualitytools:emerald_ring>, 7, 0);
treasure.addItemEntry(<qualitytools:emerald_amulet>, 7, 0);
treasure.addItemEntry(<botania:blacklotus>, 24, 0);
treasure.addItemEntry(<botania:blacklotus:1>, 7, 0);
treasure.addItemEntry(<waystones:return_scroll>, 20, 0);
treasure.addItemEntry(<xreliquary:glowing_water>, 20, 0, [Functions.setCount(3, 4)], []);
treasure.addItemEntry(<xreliquary:holy_hand_grenade>, 4, 0, [Functions.setCount(2, 3)], []);
treasure.addItemEntry(<xreliquary:glowing_bread>, 20, 0);
treasure.addItemEntry(<minecraft:golden_apple>, 24, 0);
treasure.addItemEntry(<minecraft:diamond>, 40, 0);
treasure.addItemEntry(<minecraft:book>, 35, 0, [Functions.enchantWithLevels(18, 25, true)], []);
treasure.addItemEntry(<minecraft:book>, 25, 0, [Functions.enchantWithLevels(25, 35, true)], []);
treasure.addItemEntry(<minecraft:enchanted_book:0>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 12 as short}]}), 3, 0, [], []); # SOULBINDING
treasure.addItemEntry(<minecraft:enchanted_book:0>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 70 as short}]}), 5, 0, [], []); # MENDING
treasure.addItemEntry(<minecraft:enchanted_book:0>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 40 as short}]}), 2, 0, [], []); # VEINING
treasure.addItemEntry(<minecraft:enchanted_book:0>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 54 as short}]}), 2, 0, [], []); # NIGHT VISION
treasure.addItemEntry(<minecraft:enchanted_book:0>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 29 as short}]}), 3, 0, [], []); # LIVING
treasure.addItemEntry(<quark:ancient_tome>, 15, 0, [Functions.parse({"function": "quark:enchant_tome"})], []);
treasure.addItemEntry(<contenttweaker:life_crystal>, 24, 0);
treasure.addItemEntry(<botania:overgrowthseed>, 20, 0);

treasure.addItemEntry(<xreliquary:angelheart_vial>, 6, 0);
treasure.addItemEntry(<botania:keepivy>, 20, 0);
treasure.addItemEntry(<xreliquary:gun_part:0>, 4, 0);
treasure.addItemEntry(<xreliquary:gun_part:1>, 4, 0);
treasure.addItemEntry(<xreliquary:gun_part:2>, 4, 0);
treasure.addItemEntry(<quark:rune:16>, 5, 0);

treasure.addItemEntry(<botania:starsword>, 1, 0, [Functions.enchantWithLevels(30, 40, false)], []);
treasure.addItemEntry(<botania:thundersword>, 1, 0, [Functions.enchantWithLevels(30, 40, false)], []);
treasure.addItemEntry(<botania:auraring>, 1, 0);
treasure.addItemEntry(<botania:knockbackbelt>, 1, 0);
treasure.addItemEntry(<botania:travelbelt>, 1, 0);
treasure.addItemEntry(<botania:lavapendant>, 3, 0);
treasure.addItemEntry(<botania:magnetring>, 1, 0);
treasure.addItemEntry(<botania:miningring>, 1, 0);
treasure.addItemEntry(<botania:laputashard:4>, 1, 0);
treasure.addItemEntry(<botania:enderhand>, 1, 0);
treasure.addItemEntry(<botania:swapring>, 1, 0);
treasure.addItemEntry(<botania:slimebottle>, 1, 0);
treasure.addItemEntry(<botania:dodgering>, 1, 0);
treasure.addItemEntry(<xreliquary:mercy_cross>, 1, 0, [Functions.enchantWithLevels(30, 40, false)], []);
treasure.addItemEntry(<xreliquary:magicbane>, 1, 0, [Functions.enchantWithLevels(40, 45, false)], []);
treasure.addItemEntry(<xreliquary:angelic_feather>, 1, 0);
treasure.addItemEntry(<xreliquary:destruction_catalyst>, 3, 0);
treasure.addItemEntry(<xreliquary:emperor_chalice>, 1, 0);
treasure.addItemEntry(<xreliquary:ender_staff>, 1, 0);
treasure.addItemEntry(<xreliquary:fortune_coin>, 1, 0);
treasure.addItemEntry(<xreliquary:harvest_rod>, 1, 0);
treasure.addItemEntry(<xreliquary:hero_medallion>, 1, 0);
treasure.addItemEntry(<xreliquary:ice_magus_rod>, 1, 0);
treasure.addItemEntry(<xreliquary:infernal_claws>, 3, 0);
treasure.addItemEntry(<xreliquary:infernal_tear>, 3, 0);
treasure.addItemEntry(<xreliquary:kraken_shell>, 1, 0);
treasure.addItemEntry(<xreliquary:lantern_of_paranoia>, 1, 0);
treasure.addItemEntry(<xreliquary:midas_touchstone>, 3, 0);
treasure.addItemEntry(<xreliquary:rending_gale>, 1, 0);
treasure.addItemEntry(<xreliquary:rod_of_lyssa>, 3, 0);
treasure.addItemEntry(<xreliquary:salamander_eye>, 3, 0);
treasure.addItemEntry(<xreliquary:serpent_staff>, 1, 0);
treasure.addItemEntry(<xreliquary:sojourner_staff>, 1, 0);
treasure.addItemEntry(<xreliquary:twilight_cloak>, 1, 0);
treasure.addItemEntry(<grapplemod:launcheritem>, 1, 0);
treasure.addItemEntry(<grapplemod:repeller>, 1, 0);
treasure.addItemEntry(<grapplemod:longfallboots>, 1, 0);
treasure.addItemEntry(<waystones:warp_stone>, 1, 0);
treasure.addItemEntry(<thaumcraft:cloud_ring>, 1, 0);
treasure.addItemEntry(<thaumcraft:baubles:3>, 3, 0);
treasure.addItemEntry(<embers:ember_ring>, 1, 0);
treasure.addItemEntry(<embers:ember_belt>, 1, 0);
treasure.addItemEntry(<embers:ember_amulet>, 1, 0);
treasure.addItemEntry(<embers:dawnstone_mail>, 1, 0);
treasure.addItemEntry(<embers:explosion_charm>, 3, 0);
treasure.addItemEntry(<embers:ashen_amulet>, 5, 0);
treasure.addItemEntry(<embers:nonbeliever_amulet>, 1, 0);
treasure.addItemEntry(<thaumicperiphery:pauldron_repulsion>, 1, 0);
treasure.addItemEntry(<thaumicperiphery:malignant_heart>, 3, 0);
treasure.addItemEntry(<thaumicperiphery:magic_quiver>, 1, 0);
treasure.addItemEntry(<thaumicperiphery:vis_phylactery>, 1, 0);
treasure.addItemEntry(<thaumcraft:traveller_boots>, 1, 0, [Functions.enchantWithLevels(15, 35, false)], []);
treasure.addItemEntry(<thaumcraft:elemental_axe>, 1, 0, [Functions.enchantWithLevels(15, 35, false)], []);
treasure.addItemEntry(<thaumcraft:elemental_shovel>, 1, 0, [Functions.enchantWithLevels(15, 35, false)], []);
treasure.addItemEntry(<thaumcraft:elemental_pick>, 1, 0, [Functions.enchantWithLevels(15, 35, false)], []);
treasure.addItemEntry(<thaumcraft:elemental_hoe>, 1, 0, [Functions.enchantWithLevels(15, 35, false)], []);
treasure.addItemEntry(<thaumcraft:elemental_sword>, 1, 0, [Functions.enchantWithLevels(15, 35, false)], []);
treasure.addItemEntry(<astralsorcery:itemenchantmentamulet>, 2, 0);

treasure.addItemEntry(<artifacts:shiny_red_balloon>, 1, 0);
treasure.addItemEntry(<artifacts:obsidian_skull>, 1, 0);
treasure.addItemEntry(<artifacts:shock_pendant>, 1, 0);
treasure.addItemEntry(<artifacts:flame_pendant>, 1, 0);
treasure.addItemEntry(<artifacts:thorn_pendant>, 1, 0);
treasure.addItemEntry(<artifacts:panic_necklace>, 1, 0);
treasure.addItemEntry(<artifacts:lucky_horseshoe>, 1, 0);
treasure.addItemEntry(<artifacts:cobalt_shield>, 1, 0);
treasure.addItemEntry(<artifacts:bottled_cloud>, 1, 0);
treasure.addItemEntry(<artifacts:magma_stone>, 3, 0);
treasure.addItemEntry(<artifacts:feral_claws>, 1, 0);
treasure.addItemEntry(<artifacts:power_glove>, 2, 0);
treasure.addItemEntry(<artifacts:drinking_hat>, 1, 0);
treasure.addItemEntry(<artifacts:star_cloak>, 1, 0);
treasure.addItemEntry(<artifacts:pocket_piston>, 1, 0);
treasure.addItemEntry(<artifacts:night_vision_goggles>, 1, 0);