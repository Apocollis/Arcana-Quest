import loottweaker.LootTweaker;
import loottweaker.LootTable;
import loottweaker.LootPool;
import loottweaker.Conditions;
import loottweaker.Functions;


// call loot table

val table = loottweaker.LootTweaker.getTable("minecraft:chests/abandoned_mineshaft");


// call pool, clear it, store for later

table.removePool("main");
table.removePool("pool1");
table.removePool("pool2");
table.removePool("botania_inject_pool");
table.removePool("xreliquary_inject_pool");

table.addPool("rails", 1, 2, 0, 0);
table.addPool("goodies", 2, 3, 0, 0);
table.addPool("filler", 1, 2, 0, 0);
table.addPool("equipment", 1, 2, 0, 0);
table.addPool("ore", 1, 1, 0, 0);

val rails = table.getPool("rails");
val goodies = table.getPool("goodies");
val filler = table.getPool("filler");
val equipment = table.getPool("equipment");
val ore = table.getPool("ore");


// each chest contains...

// 1 ore

ore.addItemEntry(<embers:ore_copper>, 50, 0, [Functions.setCount(3, 5)], []);
ore.addItemEntry(<embers:ore_nickel>, 25, 0, [Functions.setCount(3, 5)], []);
ore.addItemEntry(<minecraft:iron_ore>, 40, 0, [Functions.setCount(3, 5)], []);
ore.addItemEntry(<embers:ore_tin>, 30, 0, [Functions.setCount(3, 5)], []);
ore.addItemEntry(<minecraft:gold_ore>, 30, 0, [Functions.setCount(3, 5)], []);
ore.addItemEntry(<embers:ore_silver>, 30, 0, [Functions.setCount(3, 5)], []);
ore.addItemEntry(<embers:ore_lead>, 30, 0, [Functions.setCount(3, 5)], []);
ore.addItemEntry(<embers:ore_aluminum>, 40, 0, [Functions.setCount(3, 5)], []);
ore.addItemEntry(<minecraft:coal>, 20, 0, [Functions.setCount(3, 5)], []);

// 1-2 filler items

filler.addItemEntry(<minecraft:gunpowder>, 20, 0, [Functions.setCount(1, 3)], []);
filler.addItemEntry(<minecraft:coal>, 25, 0, [Functions.setCount(2, 4)], []);
filler.addItemEntry(<minecraft:bone>, 30, 0, [Functions.setCount(1, 3)], []);
filler.addItemEntry(<minecraft:rotten_flesh>, 30, 0, [Functions.setCount(1, 2)], []);
filler.addItemEntry(<minecraft:string>, 30, 0, [Functions.setCount(1, 2)], []);
filler.addItemEntry(<minecraft:web>, 50, 0, [Functions.setCount(2, 3)], []);

// 1-3 goodies

goodies.addItemEntry(<minecraft:redstone>, 24, 0, [Functions.setCount(3, 5)], []);
goodies.addItemEntry(<minecraft:iron_ingot>, 30, 0, [Functions.setCount(2, 3)], []);
goodies.addItemEntry(<minecraft:gold_ingot>, 20, 0, [Functions.setCount(1, 2)], []);
goodies.addItemEntry(<minecraft:emerald>, 18, 0, [Functions.setCount(1, 2)], []);
goodies.addItemEntry(<minecraft:slime_ball>, 10, 0, [Functions.setCount(1, 2)], []);
goodies.addItemEntry(<minecraft:ender_pearl>, 10, 0, [Functions.setCount(1, 1)], []);
goodies.addItemEntry(<minecraft:dye:4>, 20, 0, [Functions.setCount(2, 3)], []);
goodies.addItemEntry(<botania:manaresource:0>, 12, 0, [Functions.setCount(1, 2)], []);
goodies.addItemEntry(<botania:manaresource:23>, 5, 0, [Functions.setCount(2, 3)], []);
goodies.addItemEntry(<thaumcraft:salis_mundus>, 5, 0, [Functions.setCount(2, 4)], []);
goodies.addItemEntry(<thaumcraft:ingot:0>, 12, 0, [Functions.setCount(2, 3)], []);
goodies.addItemEntry(<embers:ingot_copper>, 30, 0, [Functions.setCount(3, 5)], []);
goodies.addItemEntry(<embers:ingot_lead>, 30, 0, [Functions.setCount(2, 3)], []);
goodies.addItemEntry(<embers:ingot_bronze>, 20, 0, [Functions.setCount(2, 3)], []);
goodies.addItemEntry(<embers:ingot_silver>, 25, 0, [Functions.setCount(2, 3)], []);
goodies.addItemEntry(<embers:shard_ember>, 25, 0, [Functions.setCount(2, 3)], []);
goodies.addItemEntry(<embers:crystal_ember>, 5, 0, [Functions.setCount(1, 2)], []);
goodies.addItemEntry(<astralsorcery:itemcraftingcomponent:0>, 10, 0, [Functions.setCount(2, 4)], []);
goodies.addItemEntry(<xreliquary:mob_ingredient:0>, 3, 0);
goodies.addItemEntry(<xreliquary:mob_ingredient:2>, 2, 0);
goodies.addItemEntry(<xreliquary:mob_ingredient:3>, 2, 0);
goodies.addItemEntry(<xreliquary:mob_ingredient:4>, 2, 0);
goodies.addItemEntry(<xreliquary:mob_ingredient:5>, 2, 0);
goodies.addItemEntry(<xreliquary:mob_ingredient:6>, 3, 0);
goodies.addItemEntry(<thaumcraft:curio:0>, 2, 0);
goodies.addItemEntry(<thaumcraft:curio:1>, 2, 0);
goodies.addItemEntry(<thaumcraft:curio:2>, 3, 0);
goodies.addItemEntry(<thaumcraft:curio:3>, 2, 0);
goodies.addItemEntry(<thaumcraft:curio:4>, 3, 0);
goodies.addItemEntry(<thaumcraft:crystal_aer>, 4, 0, [Functions.setCount(2, 4)], []);
goodies.addItemEntry(<thaumcraft:crystal_ignis>, 4, 0, [Functions.setCount(2, 4)], []);
goodies.addItemEntry(<thaumcraft:crystal_aqua>, 4, 0, [Functions.setCount(2, 4)], []);
goodies.addItemEntry(<thaumcraft:crystal_terra>, 4, 0, [Functions.setCount(2, 4)], []);
goodies.addItemEntry(<thaumcraft:crystal_ordo>, 4, 0, [Functions.setCount(2, 4)], []);
goodies.addItemEntry(<thaumcraft:crystal_perditio>, 4, 0, [Functions.setCount(2, 4)], []);
goodies.addItemEntry(<thaumcraft:amber>, 5, 0, [Functions.setCount(2, 3)], []);
goodies.addItemEntry(<minecraft:diamond>, 16, 0);
goodies.addItemEntry(<botania:keepivy>, 5, 0);
goodies.addItemEntry(<botania:blacklotus>, 8, 0);    
goodies.addItemEntry(<botania:overgrowthseed>, 5, 0);

// 1-2 equipments

equipment.addItemEntry(<minecraft:iron_pickaxe>, 7, 0, [Functions.enchantWithLevels(15, 25, false)], []);
equipment.addItemEntry(<minecraft:iron_sword>, 3, 0, [Functions.enchantWithLevels(15, 25, false)], []);
equipment.addItemEntry(<minecraft:iron_shovel>, 3, 0, [Functions.enchantWithLevels(15, 25, false)], []);
equipment.addItemEntry(<minecraft:leather_helmet>, 3, 0, [Functions.enchantWithLevels(15, 25, false)], []);
equipment.addItemEntry(<minecraft:leather_leggings>, 3, 0, [Functions.enchantWithLevels(15, 25, false)], []);
equipment.addItemEntry(<minecraft:leather_chestplate>, 3, 0, [Functions.enchantWithLevels(15, 25, false)], []);
equipment.addItemEntry(<minecraft:leather_boots>, 3, 0, [Functions.enchantWithLevels(15, 25, false)], []);
equipment.addItemEntry(<spartanshields:shield_basic_iron>, 3, 0, [Functions.enchantWithLevels(15, 25, false)], []);
equipment.addItemEntry(<minecraft:book>, 5, 0, [Functions.enchantWithLevels(18, 25, true)], []);
equipment.addItemEntry(<minecraft:book>, 3, 0, [Functions.enchantWithLevels(25, 35, true)], []);

// 1-2 rail themed items

rails.addItemEntry(<minecraft:rail>, 20, 0, [Functions.setCount(4, 8)], []);
rails.addItemEntry(<minecraft:golden_rail>, 5, 0, [Functions.setCount(1, 4)], []);
rails.addItemEntry(<minecraft:detector_rail>, 5, 0, [Functions.setCount(1, 4)], []);
rails.addItemEntry(<minecraft:activator_rail>, 5, 0, [Functions.setCount(1, 4)], []);
rails.addItemEntry(<minecraft:torch>, 15, 0, [Functions.setCount(4, 16)], []);
rails.addItemEntry(<minecraft:minecart>, 5, 0, [Functions.setCount(1, 1)], []);