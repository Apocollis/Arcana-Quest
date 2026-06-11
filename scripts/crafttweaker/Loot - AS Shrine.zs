import loottweaker.LootTweaker;
import loottweaker.LootTable;
import loottweaker.LootPool;
import loottweaker.Conditions;
import loottweaker.Functions;


# call loot table

val table = loottweaker.LootTweaker.getTable("astralsorcery:chest_shrine");


# call pool, clear it, store for later

table.removePool("astralsorcery:chest_shrine");

table.addPool("treasure", 1, 1, 0, 0);
table.addPool("papers", 1, 2, 0, 0);
table.addPool("goodies", 2, 3, 0, 0);
table.addPool("filler", 3, 3, 0, 0);

val treasure = table.getPool("treasure");
val papers = table.getPool("papers");
val goodies = table.getPool("goodies");
val filler = table.getPool("filler");


# each chest contains...

###################
# 3 filler items
###################

filler.addItemEntry(<astralsorcery:blockmarble>, 45, 0, [Functions.setCount(8, 12)], []);

###############
# 2-4 goodies
###############

goodies.addItemEntry(<astralsorcery:itemcraftingcomponent>, 50, 0, [Functions.setCount(4, 6)], []);
goodies.addItemEntry(<minecraft:iron_ingot>, 30, 0, [Functions.setCount(3, 4)], []);
goodies.addItemEntry(<minecraft:gold_ingot>, 30, 0, [Functions.setCount(1, 2)], []);
goodies.addItemEntry(<minecraft:emerald>, 15, 0, [Functions.setCount(1, 2)], []);
goodies.addItemEntry(<minecraft:ender_pearl>, 10, 0, [Functions.setCount(1, 1)], []);
goodies.addItemEntry(<minecraft:glowstone_dust>, 15, 0, [Functions.setCount(3, 5)], []);
goodies.addItemEntry(<minecraft:dye:4>, 20, 0, [Functions.setCount(4, 6)], []);
goodies.addItemEntry(<embers:ingot_copper>, 25, 0, [Functions.setCount(3, 5)], []);
goodies.addItemEntry(<embers:ingot_silver>, 20, 0, [Functions.setCount(3, 4)], []);
goodies.addItemEntry(<botania:manaresource:0>, 20, 0, [Functions.setCount(1, 2)], []);
goodies.addItemEntry(<botania:manaresource:23>, 10, 0, [Functions.setCount(2, 3)], []);
goodies.addItemEntry(<thaumcraft:salis_mundus>, 15, 0, [Functions.setCount(2, 4)], []);
goodies.addItemEntry(<thaumcraft:quicksilver>, 25, 0, [Functions.setCount(3, 4)], []);
goodies.addItemEntry(<thaumcraft:curio:0>, 1, 0);
goodies.addItemEntry(<thaumcraft:curio:2>, 2, 0);
goodies.addItemEntry(<thaumcraft:curio:3>, 1, 0);
goodies.addItemEntry(<thaumcraft:curio:4>, 2, 0);

###############
# 1-2 paper
###############

papers.addItemEntry(<astralsorcery:itemconstellationpaper:0>, 1, 0);

###############
# 1-2 treasure
###############

treasure.addItemEntry(<astralsorcery:itemjournal>, 40, 0);
treasure.addItemEntry(<xreliquary:glowing_water>, 15, 0, [Functions.setCount(3, 4)], []);
treasure.addItemEntry(<xreliquary:glowing_bread>, 20, 0);
treasure.addItemEntry(<everlastingabilities:ability_totem>, 8, 0, [Functions.parse({"function": "everlastingabilities:set_random_ability"})], []);
treasure.addItemEntry(<botania:worldseed>, 12, 0);
treasure.addItemEntry(<minecraft:golden_apple>, 24, 0);
treasure.addItemEntry(<minecraft:diamond>, 40, 0);
treasure.addItemEntry(<contenttweaker:life_crystal>, 10, 0);
treasure.addItemEntry(<xreliquary:angelheart_vial>, 6, 0);
treasure.addItemEntry(<botania:starsword>, 3, 0, [], []);
treasure.addItemEntry(<astralsorcery:itemenchantmentamulet>, 15, 0);
treasure.addItemEntry(<astralsorcery:itemarchitectwand>, 3, 0);
treasure.addItemEntry(<astralsorcery:itemexchangewand>, 3, 0);
treasure.addItemEntry(<astralsorcery:itemgrapplewand>, 3, 0);
treasure.addItemEntry(<botania:blacklotus>, 12, 0);
treasure.addItemEntry(<botania:blacklotus:1>, 5, 0);
treasure.addItemEntry(<botania:overgrowthseed>, 3, 0);
treasure.addItemEntry(<thaumcraft:sanity_soap>, 8, 0);
treasure.addItemEntry(<thaumcraft:bath_salts>, 5, 0);