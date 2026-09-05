#priority 50
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

// =============================================================================
// Farmer's Delight & Addon Fallback Recipes (Without Future MC)
// =============================================================================

// Blackstone Stove (Replaces Future MC Campfire requirement with a vanilla Furnace)
recipes.remove(<nethers_delight_legacy:blackstone_stove>);
recipes.addShaped("aq_blackstone_stove", <nethers_delight_legacy:blackstone_stove>, [
    [<ore:blockBlackstone>, <ore:blockBlackstone>, <ore:blockBlackstone>],
    [<minecraft:netherbrick>, null, <minecraft:netherbrick>],
    [<minecraft:netherbrick>, <minecraft:furnace>, <minecraft:netherbrick>]
]);

// Hanging Canvas Sign (Replaces Future MC Chain requirement with Iron Bars)
recipes.remove(<farmersdelight:hanging_canvas_sign>);
recipes.addShaped("aq_hanging_canvas_sign", <farmersdelight:hanging_canvas_sign> * 6, [
    [<minecraft:iron_bars>, null, <minecraft:iron_bars>],
    [<ore:logWood>, <farmersdelight:canvas>, <ore:logWood>],
    [<ore:logWood>, <farmersdelight:canvas>, <ore:logWood>]
]);
