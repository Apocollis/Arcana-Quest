#priority 50
import crafttweaker.item.IItemStack;
import mods.jei.JEI;
import mods.thaumcraft.ArcaneWorkbench;

// 1. Remove & Hide Modifier Block & Unwanted Upgrades/Hooks
val itemsToHide = [
    <grapplemod:block_grapple_modifier>,
    <grapplemod:baseupgradeitem>,
    <grapplemod:doubleupgradeitem>,
    <grapplemod:forcefieldupgradeitem>,
    <grapplemod:motorupgradeitem>,
    <grapplemod:ropeupgradeitem>,
    <grapplemod:swingupgradeitem>,
    <grapplemod:throwupgradeitem>,
    <grapplemod:limitsupgradeitem>,
    <grapplemod:staffupgradeitem>,
    <grapplemod:magnetupgradeitem>,
    <grapplemod:magnethook>,
    <grapplemod:rocketupgradeitem>,
    <grapplemod:rockethook>,
    <grapplemod:rocketdoublemotorhook>
] as IItemStack[];

for item in itemsToHide {
    recipes.remove(item);
    JEI.hide(item);
}

// 2. Base Grappling Hook Recipe (Pickaxe Shape with Farmer's Delight Rope)
recipes.remove(<grapplemod:grapplinghook>);
recipes.addShaped("aq_base_grapplinghook", <grapplemod:grapplinghook>, [
    [<minecraft:iron_ingot>, <minecraft:iron_ingot>, <minecraft:iron_ingot>],
    [null, <farmersdelight:rope>, null],
    [null, <farmersdelight:rope>, null]
]);

// 3. Ender Launcher Item (Arcane Workbench Only)
recipes.remove(<grapplemod:launcheritem>);
ArcaneWorkbench.registerShapedRecipe(
    "aq_ender_launcher",
    "AQ_ENDER_LAUNCHER",
    15,
    [<aspect:aer> * 2, <aspect:ordo> * 2],
    <grapplemod:launcheritem>,
    [
        [<thaumcraft:ingot:0>, <minecraft:ender_pearl>, <thaumcraft:ingot:0>],
        [null, <thaumcraft:log_greatwood>, null],
        [null, <minecraft:ender_pearl>, null]
    ]
);
