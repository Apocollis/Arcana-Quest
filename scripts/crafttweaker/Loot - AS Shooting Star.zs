import loottweaker.LootTweaker;
import loottweaker.LootTable;
import loottweaker.LootPool;
import loottweaker.Conditions;
import loottweaker.Functions;


# call loot table

val table = loottweaker.LootTweaker.getTable("astralsorcery:shooting_star");


# call pool, clear it, store for later

table.removePool("astralsorcery:shooting_star");

table.addPool("goodies", 4, 4, 0, 0);
table.addPool("ores", 2, 2, 0, 0);
table.addPool("filler", 1, 1, 0, 0);

val goodies = table.getPool("goodies");
val ores = table.getPool("ores");
val filler = table.getPool("filler");


# each chest contains...

###################
# 3 filler items
###################

filler.addItemEntry(<astralsorcery:blockmarble:0>, 25, 0, [Functions.setCount(9, 12)], []);
filler.addItemEntry(<astralsorcery:blockblackmarble:0>, 20, 0, [Functions.setCount(9, 12)], []);

##########
# 2 ores
##########

ores.addItemEntry(<embers:ore_copper>, 30, 0, [Functions.setCount(3, 5)], []);
ores.addItemEntry(<embers:ore_nickel>, 25, 0, [Functions.setCount(3, 5)], []);
ores.addItemEntry(<minecraft:iron_ore>, 40, 0, [Functions.setCount(3, 5)], []);
ores.addItemEntry(<embers:ore_tin>, 30, 0, [Functions.setCount(3, 5)], []);
ores.addItemEntry(<minecraft:gold_ore>, 30, 0, [Functions.setCount(3, 5)], []);
ores.addItemEntry(<embers:ore_silver>, 40, 0, [Functions.setCount(3, 5)], []);
ores.addItemEntry(<embers:ore_lead>, 30, 0, [Functions.setCount(3, 5)], []);
ores.addItemEntry(<embers:ore_aluminum>, 40, 0, [Functions.setCount(3, 5)], []);


###############
# 2-4 goodies
###############

# any class
goodies.addItemEntry(<astralsorcery:itemcraftingcomponent>, 50, 0, [Functions.setCount(4, 6)], []);
goodies.addItemEntry(<minecraft:diamond>, 35, 0, [Functions.setCount(1, 2)], []);
goodies.addItemEntry(<minecraft:emerald>, 35, 0, [Functions.setCount(2, 3)], []);
goodies.addItemEntry(<minecraft:ender_pearl>, 25, 0, [Functions.setCount(1, 1)], []);
goodies.addItemEntry(<minecraft:glowstone_dust>, 30, 0, [Functions.setCount(6, 8)], []);
goodies.addItemEntry(<botania:manaresource:0>, 20, 0, [Functions.setCount(1, 2)], []);
goodies.addItemEntry(<botania:manaresource:23>, 10, 0, [Functions.setCount(2, 3)], []);
goodies.addItemEntry(<thaumcraft:quicksilver>, 25, 0, [Functions.setCount(3, 4)], []);
goodies.addItemEntry(<thaumcraft:curio:0>, 5, 0);
goodies.addItemEntry(<thaumcraft:curio:2>, 3, 0);
goodies.addItemEntry(<thaumcraft:curio:3>, 5, 0);