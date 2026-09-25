#priority 100
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import mods.rustichromia.Quern;
import mods.rustichromia.HayCompactor;
import mods.rustichromia.Assembler;
import mods.atum.Quern as AtumQuern;
import mods.jei.JEI;

// ==========================================
// 1. Rustichromia Quern Flour & Straw Milling
// ==========================================

// Remove default Rustichromia wheat recipes
Quern.remove("rustichromia:wheat_to_flour");
Quern.remove("rustichromia:wheat_to_chaff");

// Remove default Rustichromia sawdust recipes
Quern.remove("rustichromia:slab_to_dust");
Quern.remove("rustichromia:plank_to_dust");
Quern.remove("rustichromia:log_to_dust");

// Wheat -> 1 Wheat Seeds + 1 Farmer's Delight Straw (300.0 ticks)
Quern.add(
    "aq_quern_wheat_to_straw",
    [<minecraft:wheat>] as IIngredient[],
    [<minecraft:wheat_seeds>, <farmersdelight:straw>],
    0.0,
    999999.0,
    300.0
);

// Seeds -> 1 Extra Delight Flour (300.0 ticks)
Quern.add(
    "aq_quern_wheat_seeds_flour",
    [<minecraft:wheat_seeds>] as IIngredient[],
    [<extradelightlegacy:flour>],
    0.0,
    999999.0,
    300.0
);
Quern.add(
    "aq_quern_pumpkin_seeds_flour",
    [<minecraft:pumpkin_seeds>] as IIngredient[],
    [<extradelightlegacy:flour>],
    0.0,
    999999.0,
    300.0
);
Quern.add(
    "aq_quern_melon_seeds_flour",
    [<minecraft:melon_seeds>] as IIngredient[],
    [<extradelightlegacy:flour>],
    0.0,
    999999.0,
    300.0
);
Quern.add(
    "aq_quern_beetroot_seeds_flour",
    [<minecraft:beetroot_seeds>] as IIngredient[],
    [<extradelightlegacy:flour>],
    0.0,
    999999.0,
    300.0
);

// Hide redundant Rustichromia flour, chaff, sawdust, and plywood items
JEI.hide(<rustichromia:dust_flour>);
JEI.hide(<rustichromia:wheat_chaff>);
JEI.hide(<rustichromia:dust_wood>);
JEI.hide(<rustichromia:plate_wood>);

// ==========================================
// 2. Rustichromia Hay Compactor & Thatch Deprecation
// ==========================================

// Remove all Hay Compactor recipes
HayCompactor.removeAll();

// Remove crafting recipes and hide Hay Compactor & Thatch Block
recipes.remove(<rustichromia:hay_compactor>);
JEI.hide(<rustichromia:hay_compactor>);

recipes.remove(<rustichromia:thatch_block>);
JEI.hide(<rustichromia:thatch_block>);

// ==========================================
// 3. Rustichromia Assemblers & Plywood Deprecation
// ==========================================

// Remove all Assembler recipes across all tiers
Assembler.removeAll();

// Remove crafting recipes for Plywood and all Assemblers
recipes.remove(<rustichromia:plate_wood>);
recipes.remove(<rustichromia:assembler1>);
recipes.remove(<rustichromia:assembler2>);
recipes.remove(<rustichromia:assembler3>);

// Hide all Assemblers from JEI
JEI.hide(<rustichromia:assembler1>);
JEI.hide(<rustichromia:assembler2>);
JEI.hide(<rustichromia:assembler3>);

// Hide all Assembler JEI recipe categories
JEI.hideCategory("rustichromia.assembler.1");
JEI.hideCategory("rustichromia.assembler.2");
JEI.hideCategory("rustichromia.assembler.3");

// ==========================================
// 4. Atum Recipes in Rustichromia Quern
// ==========================================

// Emmer Wheat -> Emmer Flour (300.0 ticks)
Quern.add(
    "aq_quern_emmer_flour",
    [<ore:cropEmmer>] as IIngredient[],
    [<atum:emmer_flour>],
    0.0,
    999999.0,
    300.0
);

// Atum Marl -> 3 Clay Balls (3000.0 ticks)
Quern.add(
    "aq_quern_marl_clay",
    [<atum:marl>] as IIngredient[],
    [<minecraft:clay_ball> * 3],
    0.0,
    999999.0,
    3000.0
);

// Atum Dates -> 2 Rose Red Dye (300.0 ticks)
Quern.add(
    "aq_quern_date_dye",
    [<atum:date>] as IIngredient[],
    [<minecraft:dye:1> * 2],
    0.0,
    999999.0,
    300.0
);

// Anput's Fingers Spores -> 2 Black Dye (300.0 ticks)
Quern.add(
    "aq_quern_spores_black_dye",
    [<atum:anputs_fingers_spores>] as IIngredient[],
    [<atum:dye_black> * 2],
    0.0,
    999999.0,
    300.0
);

// Desert Shrub -> 2 Brown Dye (300.0 ticks)
Quern.add(
    "aq_quern_shrub_brown_dye",
    [<atum:shrub>] as IIngredient[],
    [<atum:dye_brown> * 2],
    0.0,
    999999.0,
    300.0
);

// Oasis Grass -> 2 Cactus Green Dye (300.0 ticks)
Quern.add(
    "aq_quern_oasis_grass_dye",
    [<atum:oasis_grass>] as IIngredient[],
    [<minecraft:dye:2> * 2],
    0.0,
    999999.0,
    300.0
);

// Dead Grass -> 2 Gray Dye (300.0 ticks)
Quern.add(
    "aq_quern_dead_grass_dye",
    [<atum:dead_grass>] as IIngredient[],
    [<minecraft:dye:8> * 2],
    0.0,
    999999.0,
    300.0
);


// ==========================================
// 5. Deprecate & Hide Atum Quern
// ==========================================

recipes.remove(<atum:quern>);
JEI.hide(<atum:quern>);

AtumQuern.removeRecipe("atum:emmer_wheat");
AtumQuern.removeRecipe("atum:rod_blaze");
AtumQuern.removeRecipe("atum:marl");
AtumQuern.removeRecipe("atum:gravel");
AtumQuern.removeRecipe("atum:sugarcane");
AtumQuern.removeRecipe("atum:black");
AtumQuern.removeRecipe("atum:brown_shrub");
AtumQuern.removeRecipe("atum:red");
AtumQuern.removeRecipe("atum:bone");
