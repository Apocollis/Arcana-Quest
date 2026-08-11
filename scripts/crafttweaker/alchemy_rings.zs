#priority 70
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import mods.thaumcraft.ArcaneWorkbench;
import mods.thaumcraft.Infusion;

import mods.jei.JEI;

// Remove default potion ring crafting table recipes
recipes.remove(<extraalchemy:potion_ring:*>);
recipes.remove(<extraalchemy:empty_ring>);

// Remove Extra Alchemy Quick Potion Vial recipes and hide from JEI
recipes.remove(<extraalchemy:vial_break>);
recipes.remove(<extraalchemy:breakable_potion:*>);
JEI.hide(<extraalchemy:vial_break>);
JEI.hide(<extraalchemy:breakable_potion:*>);

// 1. Empty Potion Ring Arcane Workbench Recipe
ArcaneWorkbench.registerShapedRecipe(
    "aq_empty_potion_ring",
    "AQ_POTION_RINGS",
    20,
    [<aspect:aer> * 5, <aspect:ignis> * 5, <aspect:aqua> * 5, <aspect:terra> * 5, <aspect:ordo> * 5, <aspect:perditio> * 5],
    <extraalchemy:empty_ring>,
    [
        [<thaumcraft:nugget:8>, <thaumcraft:ingot:2>, <thaumcraft:nugget:8>],
        [<thaumcraft:ingot:2>, <minecraft:glass_bottle>, <thaumcraft:ingot:2>],
        [<thaumcraft:nugget:8>, <thaumcraft:ingot:2>, <thaumcraft:nugget:8>]
    ]
);

// 2. Active Potion Rings 8-Pedestal Infusion Altar Recipes
val ringPotions as string[] = [
    "minecraft:night_vision",
    "minecraft:invisibility",
    "minecraft:leaping",
    "minecraft:strong_leaping",
    "minecraft:fire_resistance",
    "minecraft:swiftness",
    "minecraft:strong_swiftness",
    "minecraft:slowness",
    "minecraft:water_breathing",
    "minecraft:regeneration",
    "minecraft:strong_regeneration",
    "minecraft:strength",
    "minecraft:strong_strength",
    "minecraft:weakness",
    "extraalchemy:magnetism_normal",
    "extraalchemy:magnetism_strong",
    "extraalchemy:crumbling_normal",
    "extraalchemy:crumbling_strong",
    "extraalchemy:dislocation_normal",
    "extraalchemy:dislocation_strong",
    "extraalchemy:gravity_normal",
    "extraalchemy:gravity_strong",
    "extraalchemy:hurry_normal",
    "extraalchemy:hurry_strong",
    "extraalchemy:learning_normal",
    "extraalchemy:learning_strong",
    "extraalchemy:leech_normal",
    "extraalchemy:leech_strong",
    "extraalchemy:photosynthesis_normal",
    "extraalchemy:photosynthesis_strong",
    "extraalchemy:reincarnation_normal",
    "extraalchemy:reincarnation_strong",
    "extraalchemy:sails_normal",
    "extraalchemy:sails_strong",
    "extraalchemy:sinking_normal",
    "extraalchemy:sinking_strong"
];

for i, pot in ringPotions {
    val potItem = <minecraft:potion>.withTag({Potion: pot});
    val ringResult = <extraalchemy:potion_ring>.withTag({Potion: pot});
    val recipeName = "aq_potion_ring_" + i;
    
    Infusion.registerRecipe(
        recipeName,
        "AQ_POTION_RINGS",
        ringResult,
        8,
        [<aspect:alkimia> * 80, <aspect:fabrico> * 40, <aspect:desiderium> * 40, <aspect:praecantatio> * 40],
        <extraalchemy:empty_ring>,
        [
            potItem,
            <astralsorcery:itemcraftingcomponent:4>,
            potItem,
            <minecraft:dragon_breath>,
            potItem,
            <botania:manaresource:2>,
            potItem,
            <minecraft:nether_star>
        ]
    );
}
