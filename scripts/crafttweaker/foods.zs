#priority 50
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import mods.jei.JEI;
import mods.farmersdelight.CookingPot;
import mods.farmersdelight.CuttingBoard;
import mods.extradelightlegacy.Mortar;
import mods.extradelightlegacy.MixingBowl;
import mods.extradelightlegacy.Juicer;
import mods.extradelightlegacy.Oven;
import moretweaker.bewitchment.WitchesOven;

// ==========================================
// 1. High-Tier Feasts (Primal Cuts Gating)
// ==========================================

val honeyBottle = <animania:honey_bottle> | <rustic:fluid_bottle>.withTag({Fluid: {FluidName: "honey", Amount: 1000}});
val berries = <rustic:wildberries>;

// Roast Chicken (Produces Placeable Feast Block)
CookingPot.removeRecipesByOutput(<farmersdelight:roast_chicken_block>);
CookingPot.removeRecipesByOutput(<farmersdelight:roast_chicken>);
CookingPot.addRecipeWithContainer(
    "aq_roast_chicken_feast",
    [
        <minecraft:chicken>,
        <minecraft:potato>,
        <minecraft:carrot>,
        <farmersdelight:onion>,
        <farmersdelight:onion>
    ] as IIngredient[],
    <farmersdelight:roast_chicken_block>,
    <minecraft:bowl>
);

// Honey Glazed Ham (Produces Placeable Feast Block)
CookingPot.removeRecipesByOutput(<farmersdelight:honey_glazed_ham_block>);
CookingPot.removeRecipesByOutput(<farmersdelight:honey_glazed_ham>);
CookingPot.addRecipeWithContainer(
    "aq_honey_glazed_ham_feast",
    [
        <farmersdelight:ham> | <extradelightlegacy:pork_roast>,
        honeyBottle,
        berries,
        berries,
        <farmersdelight:cooked_rice>
    ] as IIngredient[],
    <farmersdelight:honey_glazed_ham_block>,
    <minecraft:bowl>
);

// Shepherd's Pie (Produces Placeable Feast Block)
CookingPot.removeRecipesByOutput(<farmersdelight:shepherds_pie_block>);
CookingPot.removeRecipesByOutput(<farmersdelight:shepherds_pie>);
CookingPot.addRecipeWithContainer(
    "aq_shepherds_pie_feast_lamb",
    [
        <extradelightlegacy:lamb_roast>,
        <minecraft:potato>,
        <minecraft:potato>,
        <minecraft:milk_bucket>
    ] as IIngredient[],
    <farmersdelight:shepherds_pie_block>,
    <minecraft:bowl>
);
CookingPot.addRecipeWithContainer(
    "aq_shepherds_pie_feast_goat",
    [
        <extradelightlegacy:goat_roast>,
        <minecraft:potato>,
        <minecraft:potato>,
        <minecraft:milk_bucket>
    ] as IIngredient[],
    <farmersdelight:shepherds_pie_block>,
    <minecraft:bowl>
);

// ==========================================
// 2. Dish Recipe Updates & Minced Beef Removal
// ==========================================

// Remove & Hide Minced Beef
recipes.remove(<farmersdelight:minced_beef>);
JEI.hide(<farmersdelight:minced_beef>);
CuttingBoard.removeRecipesByOutput(<farmersdelight:minced_beef>);

// Pasta with Meatballs: Ground Beef + Pasta + Tomato Sauce
CookingPot.removeRecipesByOutput(<farmersdelight:pasta_with_meatballs>);
CookingPot.addRecipeWithContainer(
    "aq_pasta_with_meatballs",
    [
        <extradelightlegacy:ground_beef>,
        <farmersdelight:raw_pasta>,
        <farmersdelight:tomato_sauce>
    ] as IIngredient[],
    <farmersdelight:pasta_with_meatballs>,
    <minecraft:bowl>
);

// Beef Stew: Beef Stew Meat + Carrot + Potato
CookingPot.removeRecipesByOutput(<farmersdelight:beef_stew>);
CookingPot.addRecipeWithContainer(
    "aq_beef_stew",
    [
        <extradelightlegacy:beef_stewmeat>,
        <minecraft:carrot>,
        <minecraft:potato>
    ] as IIngredient[],
    <farmersdelight:beef_stew>,
    <minecraft:bowl>
);

// Dumplings: Dough + Cabbage + Onion + Ground Beef
CookingPot.removeRecipesByOutput(<farmersdelight:dumplings>);
CookingPot.addRecipeWithContainer(
    "aq_dumplings",
    [
        <farmersdelight:wheat_dough> | <ore:dough>,
        <farmersdelight:cabbage_leaf> | <farmersdelight:cabbage>,
        <extradelightlegacy:sliced_onion> | <ore:cropOnion>,
        <extradelightlegacy:ground_beef>
    ] as IIngredient[],
    <farmersdelight:dumplings>,
    <minecraft:bowl>
);

// ==========================================
// 3. Pruning & JEI Hiding (Burgers & Prime Meats)
// ==========================================
val itemsToHide = [
    <farmersdelight:hamburger>,
    <twilightdelight:ghast_burger>,
    <twilightdelight:hydra_burger>,
    <lycanitesmobs:bulwark_burger>,
    
    // Animania Prime Meats
    <animania:raw_prime_beef>,
    <animania:cooked_prime_beef>,
    <animania:raw_prime_steak>,
    <animania:cooked_prime_steak>,
    <animania:raw_prime_pork>,
    <animania:cooked_prime_pork>,
    <animania:raw_prime_bacon>,
    <animania:cooked_prime_bacon>,
    <animania:raw_prime_chicken>,
    <animania:cooked_prime_chicken>,
    <animania:raw_prime_mutton>,
    <animania:cooked_prime_mutton>,
    <animania:raw_prime_chevon>,
    <animania:cooked_prime_chevon>
] as IItemStack[];

for item in itemsToHide {
    recipes.remove(item);
    JEI.hide(item);
}

// ==========================================
// 4. Cutting Board Butchery System
// ==========================================

val knife = <ore:toolKnife>;

// --- Cattle Butchery ---
CuttingBoard.addRecipeAdvanced(
    "aq_cut_raw_beef",
    [<minecraft:beef>] as IIngredient[],
    [knife] as IIngredient[],
    [
        <extradelightlegacy:ground_beef> * 2,
        <extradelightlegacy:ground_beef>,
        <extradelightlegacy:cubed_beef>,
        <extradelightlegacy:cubed_beef>,
        <extradelightlegacy:beef_scraps>
    ] as IItemStack[],
    [1.0, 0.5, 1.0, 0.5, 0.5] as float[]
);
CuttingBoard.addRecipeAdvanced(
    "aq_cut_cooked_beef",
    [<minecraft:cooked_beef>] as IIngredient[],
    [knife] as IIngredient[],
    [
        <extradelightlegacy:cooked_ground_beef> * 2,
        <extradelightlegacy:cooked_ground_beef>,
        <extradelightlegacy:cooked_cubed_beef>,
        <extradelightlegacy:cooked_cubed_beef>,
        <extradelightlegacy:cooked_beef_scraps>
    ] as IItemStack[],
    [1.0, 0.5, 1.0, 0.5, 0.5] as float[]
);

CuttingBoard.addRecipeAdvanced(
    "aq_cut_raw_beef_roast",
    [<extradelightlegacy:beef_roast>] as IIngredient[],
    [knife] as IIngredient[],
    [<extradelightlegacy:beef_stewmeat> * 2, <extradelightlegacy:beef_stewmeat>] as IItemStack[],
    [1.0, 0.5] as float[]
);
CuttingBoard.addRecipeAdvanced(
    "aq_cut_cooked_beef_roast",
    [<extradelightlegacy:cooked_beef_roast>] as IIngredient[],
    [knife] as IIngredient[],
    [<extradelightlegacy:cooked_beef_stewmeat> * 2, <extradelightlegacy:cooked_beef_stewmeat>] as IItemStack[],
    [1.0, 0.5] as float[]
);

CuttingBoard.addRecipe(
    "aq_cut_raw_beef_ribs",
    [<extradelightlegacy:beef_ribs>] as IIngredient[],
    [<minecraft:bone> * 2, <extradelightlegacy:beef_stewmeat>] as IItemStack[]
);
CuttingBoard.addRecipe(
    "aq_cut_cooked_beef_ribs",
    [<extradelightlegacy:cooked_beef_ribs>] as IIngredient[],
    [<minecraft:bone> * 2, <extradelightlegacy:cooked_beef_stewmeat>] as IItemStack[]
);

// --- Sheep & Lamb Butchery ---
CuttingBoard.addRecipeAdvanced(
    "aq_cut_raw_mutton",
    [<minecraft:mutton>] as IIngredient[],
    [knife] as IIngredient[],
    [
        <extradelightlegacy:ground_lamb>,
        <extradelightlegacy:ground_lamb>,
        <extradelightlegacy:cubed_lamb>,
        <farmersdelight:mutton_chops>,
        <farmersdelight:mutton_chops>,
        <extradelightlegacy:lamb_scraps>
    ] as IItemStack[],
    [1.0, 0.5, 1.0, 1.0, 0.5, 0.5] as float[]
);
CuttingBoard.addRecipeAdvanced(
    "aq_cut_cooked_mutton",
    [<minecraft:cooked_mutton>] as IIngredient[],
    [knife] as IIngredient[],
    [
        <extradelightlegacy:cooked_ground_lamb>,
        <extradelightlegacy:cooked_ground_lamb>,
        <extradelightlegacy:cooked_cubed_lamb>,
        <farmersdelight:cooked_mutton_chops>,
        <farmersdelight:cooked_mutton_chops>,
        <extradelightlegacy:cooked_lamb_scraps>
    ] as IItemStack[],
    [1.0, 0.5, 1.0, 1.0, 0.5, 0.5] as float[]
);

CuttingBoard.addRecipeAdvanced(
    "aq_cut_raw_lamb_roast",
    [<extradelightlegacy:lamb_roast>] as IIngredient[],
    [knife] as IIngredient[],
    [<extradelightlegacy:lamb_stewmeat> * 2, <extradelightlegacy:lamb_stewmeat>] as IItemStack[],
    [1.0, 0.5] as float[]
);
CuttingBoard.addRecipeAdvanced(
    "aq_cut_cooked_lamb_roast",
    [<extradelightlegacy:cooked_lamb_roast>] as IIngredient[],
    [knife] as IIngredient[],
    [<extradelightlegacy:cooked_lamb_stewmeat> * 2, <extradelightlegacy:cooked_lamb_stewmeat>] as IItemStack[],
    [1.0, 0.5] as float[]
);

CuttingBoard.addRecipe(
    "aq_cut_raw_lamb_ribs",
    [<extradelightlegacy:lamb_ribs>] as IIngredient[],
    [<minecraft:bone> * 2, <extradelightlegacy:lamb_stewmeat>] as IItemStack[]
);
CuttingBoard.addRecipe(
    "aq_cut_cooked_lamb_ribs",
    [<extradelightlegacy:cooked_lamb_ribs>] as IIngredient[],
    [<minecraft:bone> * 2, <extradelightlegacy:cooked_lamb_stewmeat>] as IItemStack[]
);

// --- Goat Butchery ---
CuttingBoard.addRecipeAdvanced(
    "aq_cut_raw_chevon",
    [<animania:raw_chevon>] as IIngredient[],
    [knife] as IIngredient[],
    [
        <extradelightlegacy:ground_goat> * 2,
        <extradelightlegacy:ground_goat>,
        <extradelightlegacy:cubed_goat>,
        <extradelightlegacy:cubed_goat>,
        <extradelightlegacy:goat_scraps>
    ] as IItemStack[],
    [1.0, 0.5, 1.0, 0.5, 0.5] as float[]
);
CuttingBoard.addRecipeAdvanced(
    "aq_cut_cooked_chevon",
    [<animania:cooked_chevon>] as IIngredient[],
    [knife] as IIngredient[],
    [
        <extradelightlegacy:cooked_ground_goat> * 2,
        <extradelightlegacy:cooked_ground_goat>,
        <extradelightlegacy:cooked_cubed_goat>,
        <extradelightlegacy:cooked_cubed_goat>,
        <extradelightlegacy:cooked_goat_scraps>
    ] as IItemStack[],
    [1.0, 0.5, 1.0, 0.5, 0.5] as float[]
);

CuttingBoard.addRecipeAdvanced(
    "aq_cut_raw_goat_roast",
    [<extradelightlegacy:goat_roast>] as IIngredient[],
    [knife] as IIngredient[],
    [<extradelightlegacy:goat_stewmeat> * 2, <extradelightlegacy:goat_stewmeat>] as IItemStack[],
    [1.0, 0.5] as float[]
);
CuttingBoard.addRecipeAdvanced(
    "aq_cut_cooked_goat_roast",
    [<extradelightlegacy:cooked_goat_roast>] as IIngredient[],
    [knife] as IIngredient[],
    [<extradelightlegacy:cooked_goat_stewmeat> * 2, <extradelightlegacy:cooked_goat_stewmeat>] as IItemStack[],
    [1.0, 0.5] as float[]
);

CuttingBoard.addRecipe(
    "aq_cut_raw_goat_ribs",
    [<extradelightlegacy:goat_ribs>] as IIngredient[],
    [<minecraft:bone> * 2, <extradelightlegacy:goat_stewmeat>] as IItemStack[]
);
CuttingBoard.addRecipe(
    "aq_cut_cooked_goat_ribs",
    [<extradelightlegacy:cooked_goat_ribs>] as IIngredient[],
    [<minecraft:bone> * 2, <extradelightlegacy:cooked_goat_stewmeat>] as IItemStack[]
);

// --- Swine Butchery ---
CuttingBoard.addRecipeAdvanced(
    "aq_cut_raw_porkchop",
    [<minecraft:porkchop>] as IIngredient[],
    [knife] as IIngredient[],
    [
        <farmersdelight:bacon> * 2,
        <farmersdelight:bacon>,
        <extradelightlegacy:cubed_pork>,
        <extradelightlegacy:ground_pork>,
        <extradelightlegacy:pork_scraps>
    ] as IItemStack[],
    [1.0, 0.5, 1.0, 1.0, 0.5] as float[]
);
CuttingBoard.addRecipeAdvanced(
    "aq_cut_cooked_porkchop",
    [<minecraft:cooked_porkchop>] as IIngredient[],
    [knife] as IIngredient[],
    [
        <farmersdelight:cooked_bacon> * 2,
        <farmersdelight:cooked_bacon>,
        <extradelightlegacy:cooked_cubed_pork>,
        <extradelightlegacy:cooked_ground_pork>,
        <extradelightlegacy:cooked_pork_scraps>
    ] as IItemStack[],
    [1.0, 0.5, 1.0, 1.0, 0.5] as float[]
);

CuttingBoard.addRecipeAdvanced(
    "aq_cut_raw_pork_roast",
    [<extradelightlegacy:pork_roast>] as IIngredient[],
    [knife] as IIngredient[],
    [<extradelightlegacy:pork_stewmeat> * 2, <extradelightlegacy:pork_stewmeat>] as IItemStack[],
    [1.0, 0.5] as float[]
);
CuttingBoard.addRecipeAdvanced(
    "aq_cut_cooked_pork_roast",
    [<extradelightlegacy:cooked_pork_roast>] as IIngredient[],
    [knife] as IIngredient[],
    [<extradelightlegacy:cooked_pork_stewmeat> * 2, <extradelightlegacy:cooked_pork_stewmeat>] as IItemStack[],
    [1.0, 0.5] as float[]
);

CuttingBoard.addRecipe(
    "aq_cut_raw_pork_ribs",
    [<extradelightlegacy:pork_ribs>] as IIngredient[],
    [<minecraft:bone> * 2, <extradelightlegacy:pork_stewmeat>] as IItemStack[]
);
CuttingBoard.addRecipe(
    "aq_cut_cooked_pork_ribs",
    [<extradelightlegacy:cooked_pork_ribs>] as IIngredient[],
    [<minecraft:bone> * 2, <extradelightlegacy:cooked_pork_stewmeat>] as IItemStack[]
);

CuttingBoard.addRecipe(
    "aq_cut_ham",
    [<farmersdelight:ham>] as IIngredient[],
    [<minecraft:porkchop> * 2, <minecraft:bone>] as IItemStack[]
);
CuttingBoard.addRecipe(
    "aq_cut_smoked_ham",
    [<farmersdelight:smoked_ham>] as IIngredient[],
    [<minecraft:cooked_porkchop> * 2, <minecraft:bone>] as IItemStack[]
);

// --- Venison Butchery ---
CuttingBoard.addRecipe(
    "aq_cut_raw_venison_ribs",
    [<twilightdelight:raw_venison_rib>] as IIngredient[],
    [<minecraft:bone> * 2, <twilightforest:raw_venison>] as IItemStack[]
);
CuttingBoard.addRecipe(
    "aq_cut_cooked_venison_ribs",
    [<twilightdelight:cooked_venison_rib>] as IIngredient[],
    [<minecraft:bone> * 2, <twilightforest:cooked_venison>] as IItemStack[]
);

// --- Poultry Butchery Hierarchy ---
CuttingBoard.addRecipe(
    "aq_cut_raw_chicken",
    [<minecraft:chicken>] as IIngredient[],
    [
        <extradelightlegacy:chicken_breast> * 2,
        <extradelightlegacy:chicken_leg> * 2,
        <extradelightlegacy:chicken_thigh> * 2
    ] as IItemStack[]
);
CuttingBoard.addRecipe(
    "aq_cut_cooked_chicken",
    [<minecraft:cooked_chicken>] as IIngredient[],
    [
        <extradelightlegacy:cooked_chicken_breast> * 2,
        <extradelightlegacy:cooked_chicken_leg> * 2,
        <extradelightlegacy:cooked_chicken_thigh> * 2
    ] as IItemStack[]
);

CuttingBoard.addRecipeAdvanced(
    "aq_cut_raw_chicken_breast",
    [<extradelightlegacy:chicken_breast>] as IIngredient[],
    [knife] as IIngredient[],
    [<farmersdelight:chicken_cuts> * 2, <farmersdelight:chicken_cuts>] as IItemStack[],
    [1.0, 0.5] as float[]
);
CuttingBoard.addRecipeAdvanced(
    "aq_cut_cooked_chicken_breast",
    [<extradelightlegacy:cooked_chicken_breast>] as IIngredient[],
    [knife] as IIngredient[],
    [<farmersdelight:cooked_chicken_cuts> * 2, <farmersdelight:cooked_chicken_cuts>] as IItemStack[],
    [1.0, 0.5] as float[]
);

CuttingBoard.addRecipeAdvanced(
    "aq_cut_raw_chicken_thigh",
    [<extradelightlegacy:chicken_thigh>] as IIngredient[],
    [knife] as IIngredient[],
    [<extradelightlegacy:chicken_stewmeat>, <extradelightlegacy:chicken_stewmeat>, <extradelightlegacy:chicken_scraps>] as IItemStack[],
    [1.0, 0.5, 0.5] as float[]
);
CuttingBoard.addRecipeAdvanced(
    "aq_cut_cooked_chicken_thigh",
    [<extradelightlegacy:cooked_chicken_thigh>] as IIngredient[],
    [knife] as IIngredient[],
    [<extradelightlegacy:cooked_chicken_stewmeat>, <extradelightlegacy:cooked_chicken_stewmeat>, <extradelightlegacy:cooked_chicken_scraps>] as IItemStack[],
    [1.0, 0.5, 0.5] as float[]
);

CuttingBoard.addRecipeAdvanced(
    "aq_cut_raw_chicken_cuts",
    [<farmersdelight:chicken_cuts>] as IIngredient[],
    [knife] as IIngredient[],
    [<extradelightlegacy:cubed_chicken>, <extradelightlegacy:cubed_chicken>, <extradelightlegacy:chicken_scraps>] as IItemStack[],
    [1.0, 0.5, 0.5] as float[]
);
CuttingBoard.addRecipeAdvanced(
    "aq_cut_cooked_chicken_cuts",
    [<farmersdelight:cooked_chicken_cuts>] as IIngredient[],
    [knife] as IIngredient[],
    [<extradelightlegacy:cooked_cubed_chicken>, <extradelightlegacy:cooked_cubed_chicken>, <extradelightlegacy:cooked_chicken_scraps>] as IItemStack[],
    [1.0, 0.5, 0.5] as float[]
);

// --- Rabbit Butchery Hierarchy ---
CuttingBoard.addRecipe(
    "aq_cut_raw_rabbit",
    [<minecraft:rabbit>] as IIngredient[],
    [
        <extradelightlegacy:rabbit_leg> * 2,
        <extradelightlegacy:rabbit_thigh> * 2,
        <extradelightlegacy:rabbit_saddle>
    ] as IItemStack[]
);
CuttingBoard.addRecipe(
    "aq_cut_cooked_rabbit",
    [<minecraft:cooked_rabbit>] as IIngredient[],
    [
        <extradelightlegacy:cooked_rabbit_leg> * 2,
        <extradelightlegacy:cooked_rabbit_thigh> * 2,
        <extradelightlegacy:cooked_rabbit_saddle>
    ] as IItemStack[]
);

CuttingBoard.addRecipeAdvanced(
    "aq_cut_raw_rabbit_saddle",
    [<extradelightlegacy:rabbit_saddle>] as IIngredient[],
    [knife] as IIngredient[],
    [<extradelightlegacy:rabbit_stewmeat> * 2, <extradelightlegacy:rabbit_stewmeat>] as IItemStack[],
    [1.0, 0.5] as float[]
);
CuttingBoard.addRecipeAdvanced(
    "aq_cut_cooked_rabbit_saddle",
    [<extradelightlegacy:cooked_rabbit_saddle>] as IIngredient[],
    [knife] as IIngredient[],
    [<extradelightlegacy:cooked_rabbit_stewmeat> * 2, <extradelightlegacy:cooked_rabbit_stewmeat>] as IItemStack[],
    [1.0, 0.5] as float[]
);

CuttingBoard.addRecipeAdvanced(
    "aq_cut_raw_rabbit_thigh",
    [<extradelightlegacy:rabbit_thigh>] as IIngredient[],
    [knife] as IIngredient[],
    [
        <extradelightlegacy:cubed_rabbit>,
        <extradelightlegacy:cubed_rabbit>,
        <extradelightlegacy:ground_rabbit>,
        <extradelightlegacy:ground_rabbit>,
        <extradelightlegacy:rabbit_scraps>
    ] as IItemStack[],
    [1.0, 0.5, 1.0, 0.5, 0.5] as float[]
);
CuttingBoard.addRecipeAdvanced(
    "aq_cut_cooked_rabbit_thigh",
    [<extradelightlegacy:cooked_rabbit_thigh>] as IIngredient[],
    [knife] as IIngredient[],
    [
        <extradelightlegacy:cooked_cubed_rabbit>,
        <extradelightlegacy:cooked_cubed_rabbit>,
        <extradelightlegacy:cooked_ground_rabbit>,
        <extradelightlegacy:cooked_ground_rabbit>,
        <extradelightlegacy:cooked_rabbit_scraps>
    ] as IItemStack[],
    [1.0, 0.5, 1.0, 0.5, 0.5] as float[]
);

// ==========================================
// 5. Garlic & Garlic Bread Overhaul
// ==========================================

// Hide Extra Delight Garlic (Bewitchment Garlic is Canonical)
JEI.hide(<extradelightlegacy:garlic>);
recipes.remove(<extradelightlegacy:garlic>);

// Bewitchment Garlic Bread (Oven Loaf Pan Baking)
recipes.remove(<bewitchment:garlic_bread>);
furnace.remove(<bewitchment:garlic_bread>);
Oven.add(
    "aq_bewitchment_garlic_bread",
    [
        <farmersdelight:wheat_dough> | <ore:dough>,
        <bewitchment:garlic>,
        <bewitchment:garlic>,
        <ore:foodSalt> | <saltmod:salt_pinch>,
        <extradelightlegacy:butter> | <ore:foodButter>
    ] as IIngredient[],
    <extradelightlegacy:loaf_pan>,
    <bewitchment:garlic_bread>,
    200,
    false
);

// ==========================================
// 6. Bread & Bread Roll Progression
// ==========================================

// Restrict Bread Loaves strictly to Extra Delight Oven Loaf Pan recipe
recipes.remove(<minecraft:bread>);
furnace.remove(<minecraft:bread>);
WitchesOven.removeRecipe(<minecraft:bread>);

// Bread Roll Baking (Furnace & Oven - No Pan Required)
furnace.addRecipe(<extradelightlegacy:roll>, <farmersdelight:wheat_dough>, 0.35);
Oven.add(
    "aq_oven_bread_roll",
    [<farmersdelight:wheat_dough>] as IIngredient[],
    null,
    <extradelightlegacy:roll>,
    200,
    false
);

// ==========================================
// 7. Extra Delight Mortar Seed Grinding
// ==========================================

// Remove default flour+oil Mortar recipes
Mortar.removeByItemOutput(<extradelightlegacy:flour>);

// Re-register dry grinding: Seeds to Flour only (4 strikes, 0 fluid)
Mortar.add("aq_mortar_wheat_seeds", <minecraft:wheat_seeds>, <extradelightlegacy:flour>, 4);
Mortar.add("aq_mortar_pumpkin_seeds", <minecraft:pumpkin_seeds>, <extradelightlegacy:flour>, 4);
Mortar.add("aq_mortar_melon_seeds", <minecraft:melon_seeds>, <extradelightlegacy:flour>, 4);
Mortar.add("aq_mortar_beetroot_seeds", <minecraft:beetroot_seeds>, <extradelightlegacy:flour>, 4);

// ==========================================
// 8. Extra Delight Mixing Bowl Butter Recipe
// ==========================================

// Whip Fluid Milk into Butter using a Spoon (toolSpoon) with 8 stirs
MixingBowl.removeByOutput(<extradelightlegacy:butter>);
MixingBowl.add(
    "aq_butter_from_milk",
    [] as IIngredient[],
    [<liquid:milk> * 250] as ILiquidStack[],
    null,
    "toolSpoon",
    <extradelightlegacy:butter>,
    8
);

// ==========================================
// 9. Pruning & JEI Hiding for Disabled Tools
// ==========================================

// Whisk
JEI.hide(<extradelightlegacy:whisk>);
recipes.remove(<extradelightlegacy:whisk>);

// Muffin Tin
JEI.hide(<extradelightlegacy:muffin_tin>);
recipes.remove(<extradelightlegacy:muffin_tin>);

// Baking Sheet
JEI.hide(<extradelightlegacy:sheet>);
recipes.remove(<extradelightlegacy:sheet>);

// ==========================================
// 10. Corn Shucking Recipes
// ==========================================

// Shapeless Crafting: 1 Unshucked Corn -> 1 Corn on the Cob
recipes.addShapeless("aq_shuck_corn_table", <extradelightlegacy:corn_on_cob>, [<extradelightlegacy:unshucked_corn>]);

// ==========================================
// 11. Baking Sheet to Baking Tray Oven Migration
// ==========================================

// Grilled Grapefruit
Oven.removeByOutput(<extradelightlegacy:grilled_grapefruit>);
Oven.add("aq_oven_grilled_grapefruit", [<ore:processedGrapefruit>, <ore:processedGrapefruit>, <ore:processedGrapefruit>] as IIngredient[], <extradelightlegacy:tray>, <extradelightlegacy:grilled_grapefruit> * 3, 200, false);

// Stuffed Mushrooms
Oven.removeByOutput(<extradelightlegacy:stuffed_mushrooms>);
Oven.add("aq_oven_stuffed_mushrooms", [<ore:foodMushroom>, <ore:cheese>, <ore:foodButter>, <ore:breadcrumbs>] as IIngredient[], <extradelightlegacy:tray>, <extradelightlegacy:stuffed_mushrooms> * 4, 200, false);

// Chicken Kiev
Oven.removeByOutput(<extradelightlegacy:chicken_kiev>);
Oven.add("aq_oven_chicken_kiev", [<ore:foodChickenRaw>, <ore:foodButter>, <ore:processedGarlic>, <ore:breadcrumbs>] as IIngredient[], <extradelightlegacy:tray>, <extradelightlegacy:chicken_kiev> * 2, 200, false);

// Egg in the Basket
Oven.removeByOutput(<extradelightlegacy:egg_in_the_basket>);
Oven.add("aq_oven_egg_in_the_basket", [<ore:breadSliced>, <ore:egg>, <ore:foodButter>] as IIngredient[], <extradelightlegacy:tray>, <extradelightlegacy:egg_in_the_basket>, 200, false);

// French Toast
Oven.removeByOutput(<extradelightlegacy:french_toast>);
Oven.add("aq_oven_french_toast", [<ore:breadSliced>, <ore:egg>, <ore:foodMilk>, <ore:foodButter>] as IIngredient[], <extradelightlegacy:tray>, <extradelightlegacy:french_toast>, 200, false);

// ==========================================
// 12. Embers Iron Plate Metalware Recipes
// ==========================================

// Baking Tray: 1 Embers Iron Plate + 1 Iron Nugget
recipes.remove(<extradelightlegacy:tray>);
recipes.addShapeless("aq_tray", <extradelightlegacy:tray>, [<ore:plateIron>, <minecraft:iron_nugget>]);

// Loaf Pan: 1 Embers Iron Plate + 2 Iron Nuggets
recipes.remove(<extradelightlegacy:loaf_pan>);
recipes.addShaped("aq_loaf_pan", <extradelightlegacy:loaf_pan>, [
    [<minecraft:iron_nugget>, null, <minecraft:iron_nugget>],
    [<minecraft:iron_nugget>, <ore:plateIron>, <minecraft:iron_nugget>]
]);

// Pie Dish: 1 Embers Iron Plate + 3 Iron Nuggets
recipes.remove(<extradelightlegacy:pie_dish>);
recipes.addShaped("aq_pie_dish", <extradelightlegacy:pie_dish>, [
    [<minecraft:iron_nugget>, null, <minecraft:iron_nugget>],
    [<minecraft:iron_nugget>, <ore:plateIron>, <minecraft:iron_nugget>],
    [null, <minecraft:iron_nugget>, null]
]);

// Square Pan: 1 Embers Iron Plate + 4 Iron Nuggets
recipes.remove(<extradelightlegacy:square_pan>);
recipes.addShaped("aq_square_pan", <extradelightlegacy:square_pan>, [
    [<minecraft:iron_nugget>, <minecraft:iron_nugget>, <minecraft:iron_nugget>],
    [<minecraft:iron_nugget>, <ore:plateIron>, <minecraft:iron_nugget>],
    [<minecraft:iron_nugget>, <minecraft:iron_nugget>, <minecraft:iron_nugget>]
]);

// Bar Mold: 1 Embers Iron Plate + 7 Iron Nuggets
recipes.remove(<extradelightlegacy:bar_mold>);
recipes.addShaped("aq_bar_mold", <extradelightlegacy:bar_mold>, [
    [<minecraft:iron_nugget>, <ore:plateIron>, <minecraft:iron_nugget>],
    [<ore:plateIron>, <minecraft:iron_nugget>, <ore:plateIron>],
    [<minecraft:iron_nugget>, <ore:plateIron>, <minecraft:iron_nugget>]
]);

// Serving Pot: 1 Embers Iron Plate + 5 Iron Nuggets
recipes.remove(<extradelightlegacy:serving_pot>);
recipes.addShaped("aq_serving_pot", <extradelightlegacy:serving_pot>, [
    [<minecraft:iron_nugget>, null, <minecraft:iron_nugget>],
    [<ore:plateIron>, null, <ore:plateIron>],
    [<minecraft:iron_nugget>, <ore:plateIron>, <minecraft:iron_nugget>]
]);

// Food Grater: 1 Iron Ingot + 3 Embers Iron Plates + 1 Stick
recipes.remove(<extradelightlegacy:grater>);
recipes.addShaped("aq_grater", <extradelightlegacy:grater>, [
    [null, <ore:stickWood>, null],
    [<ore:plateIron>, <ore:ingotIron>, <ore:plateIron>],
    [<ore:plateIron>, null, <ore:plateIron>]
]);

// Evaporator: 3 Embers Iron Plates + 2 Iron Nuggets
recipes.remove(<extradelightlegacy:evaporator>);
recipes.addShaped("aq_evaporator", <extradelightlegacy:evaporator>, [
    [<ore:plateIron>, null, <ore:plateIron>],
    [<ore:plateIron>, <minecraft:iron_nugget>, <ore:plateIron>],
    [<minecraft:iron_nugget>, <ore:plateIron>, <minecraft:iron_nugget>]
]);

// ==========================================
// 12. Seaweed Paste (BOP Seaweed in Cooking Pot)
// ==========================================

CookingPot.removeRecipesByOutput(<extradelightlegacy:seaweed_paste>);
CookingPot.addRecipeWithContainer(
    "aq_seaweed_paste",
    [
        <biomesoplenty:seaweed>,
        <biomesoplenty:seaweed>,
        <biomesoplenty:seaweed>
    ] as IIngredient[],
    <extradelightlegacy:seaweed_paste>,
    <minecraft:bowl>
);

// ==========================================
// 13. Cheese Unification (foodCheese OreDict)
// ==========================================

<ore:cheese>.addAll(<ore:foodCheese>);

// Hide and disable standalone Extra Delight cheese (Animania cheese is canonical)
recipes.remove(<extradelightlegacy:cheese>);
JEI.hide(<extradelightlegacy:cheese>);

// Bacon & Egg Pie (re-registered with foodCheese)
recipes.remove(<extradelightlegacy:bacon_egg_pie>);
recipes.addShaped("aq_bacon_egg_pie", <extradelightlegacy:bacon_egg_pie>, [
    [null, <extradelightlegacy:pie_dish>, null],
    [<minecraft:egg>, <ore:foodBaconCooked> | <farmersdelight:cooked_bacon> | <extradelightlegacy:cooked_pork_scraps>, <minecraft:egg>],
    [null, <ore:foodCheese>, null]
]);
