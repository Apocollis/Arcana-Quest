#priority 75
import crafttweaker.item.IItemStack;
import mods.jei.JEI;

// =============================================================================
// Disable Netherite & Residual Remnants
// =============================================================================

// Remove Crafting Recipes
val netheriteCraftables = [
    <nb:netherite_ingot>,
    <nb:netherite_block>,
    <farmersdelight:netherite_knife>,
    <nethers_delight_legacy:netherite_machete>
] as IItemStack[];

for item in netheriteCraftables {
    recipes.remove(item);
}

// Remove Smelting
furnace.remove(<nb:nether_scrap>);

// Remove from Ore Dictionary
<ore:ingotNetherite>.remove(<nb:netherite_ingot>);
<ore:blockNetherite>.remove(<nb:netherite_block>);
<ore:oreNetherite>.remove(<nb:netherite_ore>);

// Hide all Netherite items and gear from JEI
val netheriteItemsToHide = [
    <nb:netherite_helmet>,
    <nb:netherite_chestplate>,
    <nb:netherite_leggings>,
    <nb:netherite_boots>,
    <nb:netherite_sword>,
    <nb:netherite_pickaxe>,
    <nb:netherite_axe>,
    <nb:netherite_shovel>,
    <nb:netherite_hoe>,
    <nb:netherite_horse_armor>,
    <nb:netherite_ingot>,
    <nb:nether_scrap>,
    <nb:netherite_ore>,
    <nb:netherite_block>,
    <farmersdelight:netherite_knife>,
    <nethers_delight_legacy:netherite_machete>
] as IItemStack[];

for item in netheriteItemsToHide {
    JEI.hide(item);
}
