#priority 70
import crafttweaker.item.IItemStack;
import mods.thaumcraft.ArcaneWorkbench;

// Remove default Elevator block recipe
recipes.remove(<elevatorid:elevator_white>);

// Arcane Workbench Recipe for Elevator Block
ArcaneWorkbench.registerShapedRecipe(
    "aq_elevator_white",
    "AQ_ELEVATOR",
    25,
    [<aspect:aer> * 5, <aspect:ordo> * 5],
    <elevatorid:elevator_white> * 2,
    [
        [<minecraft:wool:*>, <minecraft:ender_pearl>, <minecraft:wool:*>],
        [<thaumcraft:stone_arcane>, <thaumcraft:ingot:2>, <thaumcraft:stone_arcane>],
        [<minecraft:wool:*>, <minecraft:ender_pearl>, <minecraft:wool:*>]
    ]
);
