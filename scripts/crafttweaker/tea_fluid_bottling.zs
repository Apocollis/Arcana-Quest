import mods.inspirations.Cauldron;

// --- Green Tea ---
recipes.addShapeless("bottle_fluid_green_tea", 
    <contenttweaker:bottled_green_tea> * 3, 
    [<forge:bucketfilled>.withTag({FluidName: "green_tea"}).transformReplace(<minecraft:bucket>), <minecraft:glass_bottle>, <minecraft:glass_bottle>, <minecraft:glass_bottle>]
);

// --- Black Tea ---
recipes.addShapeless("bottle_fluid_black_tea", 
    <contenttweaker:bottled_black_tea> * 3, 
    [<forge:bucketfilled>.withTag({FluidName: "black_tea"}).transformReplace(<minecraft:bucket>), <minecraft:glass_bottle>, <minecraft:glass_bottle>, <minecraft:glass_bottle>]
);

// --- White Tea ---
recipes.addShapeless("bottle_fluid_white_tea", 
    <contenttweaker:bottled_white_tea> * 3, 
    [<forge:bucketfilled>.withTag({FluidName: "white_tea"}).transformReplace(<minecraft:bucket>), <minecraft:glass_bottle>, <minecraft:glass_bottle>, <minecraft:glass_bottle>]
);

// --- Yellow Tea ---
recipes.addShapeless("bottle_fluid_yellow_tea", 
    <contenttweaker:bottled_yellow_tea> * 3, 
    [<forge:bucketfilled>.withTag({FluidName: "yellow_tea"}).transformReplace(<minecraft:bucket>), <minecraft:glass_bottle>, <minecraft:glass_bottle>, <minecraft:glass_bottle>]
);

// --- Oolong Tea ---
recipes.addShapeless("bottle_fluid_oolong_tea", 
    <contenttweaker:bottled_oolong_tea> * 3, 
    [<forge:bucketfilled>.withTag({FluidName: "oolong_tea"}).transformReplace(<minecraft:bucket>), <minecraft:glass_bottle>, <minecraft:glass_bottle>, <minecraft:glass_bottle>]
);

// --- Pu-erh Tea ---
recipes.addShapeless("bottle_fluid_puerh_tea", 
    <contenttweaker:bottled_puerh_tea> * 3, 
    [<forge:bucketfilled>.withTag({FluidName: "puerh_tea"}).transformReplace(<minecraft:bucket>), <minecraft:glass_bottle>, <minecraft:glass_bottle>, <minecraft:glass_bottle>]
);

// --- Milk Tea ---
recipes.addShapeless("bottle_fluid_milk_tea", 
    <contenttweaker:bottled_milk_tea> * 3, 
    [<forge:bucketfilled>.withTag({FluidName: "milk_tea"}).transformReplace(<minecraft:bucket>), <minecraft:glass_bottle>, <minecraft:glass_bottle>, <minecraft:glass_bottle>]
);

// --- Matcha Tea ---
recipes.addShapeless("bottle_fluid_matcha_tea", 
    <contenttweaker:bottled_matcha_tea> * 3, 
    [<forge:bucketfilled>.withTag({FluidName: "matcha_tea"}).transformReplace(<minecraft:bucket>), <minecraft:glass_bottle>, <minecraft:glass_bottle>, <minecraft:glass_bottle>]
);

// --- Lemon Tea ---
recipes.addShapeless("bottle_fluid_lemon_tea", 
    <contenttweaker:bottled_lemon_tea> * 3, 
    [<forge:bucketfilled>.withTag({FluidName: "lemon_tea"}).transformReplace(<minecraft:bucket>), <minecraft:glass_bottle>, <minecraft:glass_bottle>, <minecraft:glass_bottle>]
);

// ==========================================
// --- Inspirations Cauldron Recipes ---
// ==========================================

// --- Cauldron Brewing (Fluid Transform) ---
// Water + Tea Leaf (boiling cauldron) -> Tea Fluid
Cauldron.addFluidTransform(<liquid:green_tea>, <teastory:dried_tea>, <liquid:water>, 3, true);
Cauldron.addFluidTransform(<liquid:black_tea>, <teastory:black_tea_leaf>, <liquid:water>, 3, true);
Cauldron.addFluidTransform(<liquid:white_tea>, <teastory:white_tea_leaf>, <liquid:water>, 3, true);
Cauldron.addFluidTransform(<liquid:yellow_tea>, <teastory:yellow_tea_leaf>, <liquid:water>, 3, true);
Cauldron.addFluidTransform(<liquid:oolong_tea>, <teastory:oolong_tea_leaf>, <liquid:water>, 3, true);
Cauldron.addFluidTransform(<liquid:puerh_tea>, <teastory:puer_tea_leaf>, <liquid:water>, 3, true);
Cauldron.addFluidTransform(<liquid:matcha_tea>, <teastory:matcha_leaf>, <liquid:water>, 3, true);

// Black Tea + Lemon (boiling cauldron) -> Lemon Tea
Cauldron.addFluidTransform(<liquid:lemon_tea>, <teastory:lemon>, <liquid:black_tea>, 3, true);

// Black Tea + Milk (boiling cauldron) -> Milk Tea
Cauldron.addFluidTransform(<liquid:milk_tea>, <minecraft:milk_bucket>, <liquid:black_tea>, 3, true);
Cauldron.addFluidTransform(<liquid:milk_tea>, <animania:milk_bottle>, <liquid:black_tea>, 3, true);
Cauldron.addFluidTransform(<liquid:milk_tea>, <farmersdelight:milk_bottle>, <liquid:black_tea>, 3, true);

// --- Cauldron Bottling (Fluid Recipe) ---
// Bottling from Cauldron: Glass Bottle + 1 Level of Tea Fluid -> Bottled Tea Travel Flask
Cauldron.addFluidRecipe(<contenttweaker:bottled_green_tea>, <minecraft:glass_bottle>, <liquid:green_tea>, 1);
Cauldron.addFluidRecipe(<contenttweaker:bottled_black_tea>, <minecraft:glass_bottle>, <liquid:black_tea>, 1);
Cauldron.addFluidRecipe(<contenttweaker:bottled_white_tea>, <minecraft:glass_bottle>, <liquid:white_tea>, 1);
Cauldron.addFluidRecipe(<contenttweaker:bottled_yellow_tea>, <minecraft:glass_bottle>, <liquid:yellow_tea>, 1);
Cauldron.addFluidRecipe(<contenttweaker:bottled_oolong_tea>, <minecraft:glass_bottle>, <liquid:oolong_tea>, 1);
Cauldron.addFluidRecipe(<contenttweaker:bottled_puerh_tea>, <minecraft:glass_bottle>, <liquid:puerh_tea>, 1);
Cauldron.addFluidRecipe(<contenttweaker:bottled_milk_tea>, <minecraft:glass_bottle>, <liquid:milk_tea>, 1);
Cauldron.addFluidRecipe(<contenttweaker:bottled_matcha_tea>, <minecraft:glass_bottle>, <liquid:matcha_tea>, 1);
Cauldron.addFluidRecipe(<contenttweaker:bottled_lemon_tea>, <minecraft:glass_bottle>, <liquid:lemon_tea>, 1);