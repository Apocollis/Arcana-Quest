#priority 50
import crafttweaker.item.IItemStack;
import mods.jei.JEI;

// Reliquary Recipe Rebalances for High-Tier Relics

// 1. Twilight Cloak
recipes.remove(<xreliquary:twilight_cloak>);
recipes.addShaped("aq_twilight_cloak", <xreliquary:twilight_cloak>, [
    [<minecraft:wool:15>, <xreliquary:mob_ingredient:11>, <minecraft:wool:15>],
    [<minecraft:wool:15>, <astralsorcery:itemcraftingcomponent:0>, <minecraft:wool:15>],
    [<minecraft:wool:15>, <minecraft:nether_star>, <minecraft:wool:15>]
]);

// 2. Harvest Rod
recipes.remove(<xreliquary:harvest_rod>);
recipes.addShaped("aq_harvest_rod", <xreliquary:harvest_rod>, [
    [null, <xreliquary:fertile_lilypad>, <minecraft:emerald>],
    [null, <thaumcraft:log_greatwood>, <xreliquary:fertile_lilypad>],
    [<thaumcraft:log_greatwood>, null, null]
]);

// 3. Emperor's Chalice
recipes.remove(<xreliquary:emperor_chalice>);
recipes.addShaped("aq_emperor_chalice", <xreliquary:emperor_chalice>, [
    [<minecraft:gold_ingot>, <contenttweaker:life_crystal>, <minecraft:gold_ingot>],
    [<minecraft:gold_ingot>, <xreliquary:glowing_water>, <minecraft:gold_ingot>],
    [null, <minecraft:gold_ingot>, null]
]);
