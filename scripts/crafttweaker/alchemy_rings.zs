#priority 70
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import mods.thaumcraft.ArcaneWorkbench;
import mods.thaumcraft.Infusion;

// Remove default potion ring crafting table recipes
recipes.remove(<extraalchemy:potion_ring:*>);
recipes.remove(<extraalchemy:empty_ring>);

// 1. Empty Potion Ring Arcane Workbench Recipe
ArcaneWorkbench.registerShapedRecipe(
    "aq_empty_potion_ring",
    "",
    20,
    [<aspect:aer> * 5, <aspect:ignis> * 5, <aspect:aqua> * 5, <aspect:terra> * 5, <aspect:ordo> * 5, <aspect:perditio> * 5],
    <extraalchemy:empty_ring>,
    [
        [<thaumcraft:nugget:8>, <thaumcraft:ingot:2>, <thaumcraft:nugget:8>],
        [<thaumcraft:ingot:2>, <minecraft:glass_bottle>, <thaumcraft:ingot:2>],
        [<thaumcraft:nugget:8>, <thaumcraft:ingot:2>, <thaumcraft:nugget:8>]
    ]
);
