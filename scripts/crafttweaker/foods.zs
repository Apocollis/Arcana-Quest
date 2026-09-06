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
import mods.extradelightlegacy.Chiller;
import mods.rustic.CrushingTub;
import mods.atum.Kiln;
import moretweaker.bewitchment.WitchesOven;

// ==========================================
// 1. High-Tier Feasts (Primal Cuts Gating)
// ==========================================

val honeyBottle = <rustic:fluid_bottle>.withTag({Fluid: {FluidName: "honey", Amount: 1000}});
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
recipes.remove(<farmersdelight:honey_glazed_ham_block>);
CookingPot.removeRecipesByOutput(<farmersdelight:honey_glazed_ham_block>);
CookingPot.removeRecipesByOutput(<farmersdelight:honey_glazed_ham>);
CookingPot.addRecipeWithContainer(
    "aq_honey_glazed_ham_feast",
    [
        <farmersdelight:ham>,
        <farmersdelight:ham>,
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

// Re-register dry grinding: Standard Wheat Seeds to Flour only (4 strikes, 0 fluid)
Mortar.add("aq_mortar_wheat_seeds", <minecraft:wheat_seeds>, <extradelightlegacy:flour>, 4);

// Botania Floral Powder Integration in Extra Delight Mortar
val botaniaColors = [
    "white", "orange", "magenta", "light_blue",
    "yellow", "lime", "pink", "gray",
    "light_gray", "cyan", "purple", "blue",
    "brown", "green", "red", "black"
] as string[];

// Petals (1 Floral Powder) & Single Mystical Flowers (2 Floral Powder)
for i in 0 .. 16 {
    val color = botaniaColors[i];
    Mortar.add("aq_mortar_petal_" + color, <botania:petal>.definition.makeStack(i), <botania:dye>.definition.makeStack(i), 4);
    Mortar.add("aq_mortar_flower_" + color, <botania:flower>.definition.makeStack(i), <botania:dye>.definition.makeStack(i) * 2, 4);
}

// Tall Mystical Flowers (4 Floral Powder)
for i in 0 .. 8 {
    Mortar.add("aq_mortar_tallflower_" + botaniaColors[i], <botania:doubleflower1>.definition.makeStack(i), <botania:dye>.definition.makeStack(i) * 4, 4);
    Mortar.add("aq_mortar_tallflower_" + botaniaColors[i + 8], <botania:doubleflower2>.definition.makeStack(i), <botania:dye>.definition.makeStack(i + 8) * 4, 4);
}

// Vanilla Flowers to Botania Floral Powder (matching Botania Pestle & Mortar)
Mortar.add("aq_mortar_flower_orange_tulip", <minecraft:red_flower:5>, <botania:dye:1>, 4);
Mortar.add("aq_mortar_flower_lilac", <minecraft:double_plant:1>, <botania:dye:2> * 2, 4);
Mortar.add("aq_mortar_flower_blue_orchid", <minecraft:red_flower:1>, <botania:dye:3>, 4);
Mortar.add("aq_mortar_flower_dandelion", <minecraft:yellow_flower:0>, <botania:dye:4>, 4);
Mortar.add("aq_mortar_flower_sunflower", <minecraft:double_plant:0>, <botania:dye:4> * 2, 4);
Mortar.add("aq_mortar_flower_pink_tulip", <minecraft:red_flower:7>, <botania:dye:6>, 4);
Mortar.add("aq_mortar_flower_peony", <minecraft:double_plant:5>, <botania:dye:6> * 2, 4);
Mortar.add("aq_mortar_flower_azure_bluet", <minecraft:red_flower:3>, <botania:dye:8>, 4);
Mortar.add("aq_mortar_flower_white_tulip", <minecraft:red_flower:6>, <botania:dye:8>, 4);
Mortar.add("aq_mortar_flower_oxeye_daisy", <minecraft:red_flower:8>, <botania:dye:8>, 4);
Mortar.add("aq_mortar_flower_poppy", <minecraft:red_flower:0>, <botania:dye:14>, 4);
Mortar.add("aq_mortar_flower_red_tulip", <minecraft:red_flower:4>, <botania:dye:14>, 4);
Mortar.add("aq_mortar_flower_rose_bush", <minecraft:double_plant:4>, <botania:dye:14> * 2, 4);

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

// ==========================================
// 14. Baking Vessel Overhaul (Cookies, Cakes & Pies)
// ==========================================

// --- Cookies (Baking Tray in Extra Delight Oven) ---
recipes.remove(<minecraft:cookie>);
recipes.remove(<farmersdelight:sweet_berry_cookie>);
recipes.remove(<farmersdelight:honey_cookie>);
recipes.remove(<ends_delight:chorus_cookie>);

Oven.add("aq_cookie_vanilla", [<ore:foodFlour>, <ore:foodFlour>, <minecraft:dye:3>, <minecraft:sugar>] as IIngredient[], <extradelightlegacy:tray>, <minecraft:cookie> * 8, 400, false);
Oven.add("aq_cookie_wildberry", [<ore:foodFlour>, <ore:foodFlour>, <rustic:wildberries>, <minecraft:sugar>] as IIngredient[], <extradelightlegacy:tray>, <farmersdelight:sweet_berry_cookie> * 8, 400, false);
Oven.add("aq_cookie_honey", [<extradelightlegacy:honey_cookie_dough>] as IIngredient[], <extradelightlegacy:tray>, <farmersdelight:honey_cookie> * 8, 400, false);
Oven.add("aq_cookie_chorus", [<ore:foodFlour>, <ore:foodFlour>, <ends_delight:chorus_fruit_grain>, <minecraft:sugar>] as IIngredient[], <extradelightlegacy:tray>, <ends_delight:chorus_cookie> * 8, 400, false);

// --- Cakes (Square Pan in Extra Delight Oven) ---
recipes.remove(<minecraft:cake>);
recipes.remove(<twilightdelight:aurora_cake>);
recipes.remove(<twilightdelight:torchberry_cake>);
recipes.remove(<twilightdelight:phytochemical_cake>);
recipes.remove(<twilightdelight:glacier_cake>);

Oven.add("aq_cake_vanilla", [<ore:listAllmilk>, <ore:listAllmilk>, <ore:listAllmilk>, <minecraft:sugar>, <minecraft:sugar>, <ore:listAllEgg>, <ore:foodFlour>, <ore:foodFlour>, <ore:foodFlour>] as IIngredient[], <extradelightlegacy:square_pan>, <minecraft:cake>, 800, false);
Oven.add("aq_cake_aurora", [<ore:listAllmilk>, <ore:listAllmilk>, <ore:listAllmilk>, <minecraft:sugar>, <minecraft:sugar>, <ore:listAllEgg>, <ore:foodFlour>, <ore:foodFlour>, <twilightforest:aurora_block>] as IIngredient[], <extradelightlegacy:square_pan>, <twilightdelight:aurora_cake>, 800, false);
Oven.add("aq_cake_torchberry", [<ore:listAllmilk>, <ore:listAllmilk>, <ore:listAllmilk>, <minecraft:sugar>, <minecraft:sugar>, <ore:listAllEgg>, <ore:foodFlour>, <ore:foodFlour>, <twilightforest:torchberries>] as IIngredient[], <extradelightlegacy:square_pan>, <twilightdelight:torchberry_cake>, 800, false);
Oven.add("aq_cake_phytochemical", [<ore:listAllmilk>, <ore:listAllmilk>, <ore:listAllmilk>, <minecraft:sugar>, <minecraft:sugar>, <ore:listAllEgg>, <ore:foodFlour>, <ore:foodFlour>, <twilightforest:experiment_115>] as IIngredient[], <extradelightlegacy:square_pan>, <twilightdelight:phytochemical_cake>, 800, false);
Oven.add("aq_cake_glacier", [<ore:listAllmilk>, <ore:listAllmilk>, <ore:listAllmilk>, <minecraft:sugar>, <minecraft:sugar>, <ore:listAllEgg>, <ore:foodFlour>, <ore:foodFlour>, <twilightforest:ice_bomb>] as IIngredient[], <extradelightlegacy:square_pan>, <twilightdelight:glacier_cake>, 800, false);

// --- Pies (Pie Dish in Extra Delight Oven) ---
recipes.remove(<farmersdelight:apple_pie>);
recipes.remove(<ends_delight:chorus_fruit_pie>);
recipes.remove(<twilightdelight:aurora_pie>);
Oven.removeByOutput(<extradelightlegacy:sweet_berry_pie>);

Oven.add("aq_pie_apple", [<ore:foodDough>, <minecraft:apple>, <minecraft:apple>, <minecraft:apple>, <minecraft:sugar>, <minecraft:sugar>, <farmersdelight:pie_crust>] as IIngredient[], <extradelightlegacy:pie_dish>, <farmersdelight:apple_pie>, 800, false);
Oven.add("aq_pie_chorus_fruit", [<ore:foodDough>, <minecraft:red_flower:*>, <minecraft:chorus_fruit>, <ends_delight:dried_chorus_flower>, <minecraft:sugar>, <minecraft:sugar>, <farmersdelight:pie_crust>] as IIngredient[], <extradelightlegacy:pie_dish>, <ends_delight:chorus_fruit_pie>, 800, false);
Oven.add("aq_pie_aurora", [<ore:foodDough>, <twilightforest:aurora_block>, <twilightforest:aurora_block>, <twilightforest:aurora_block>, <minecraft:sugar>, <minecraft:sugar>, <farmersdelight:pie_crust>] as IIngredient[], <extradelightlegacy:pie_dish>, <twilightdelight:aurora_pie>, 800, false);
Oven.add("aq_pie_wildberry", [<ore:foodDough>, <rustic:wildberries>, <rustic:wildberries>, <rustic:wildberries>, <minecraft:sugar>, <minecraft:sugar>, <farmersdelight:pie_crust>] as IIngredient[], <extradelightlegacy:pie_dish>, <extradelightlegacy:sweet_berry_pie>, 800, false);

// Pie Crust (2x Flour + 1x Milk or Butter)
recipes.remove(<farmersdelight:pie_crust>);
recipes.addShaped("aq_pie_crust", <farmersdelight:pie_crust>, [
    [<ore:foodFlour>, <ore:listAllmilk> | <ore:foodButter>, <ore:foodFlour>]
]);

// ==========================================
// 15. Wheat Dough & Milling Progression
// ==========================================

// Wheat Dough: Strict 3x Flour + 1x Egg recipe (no water recipe)
recipes.removeByRecipeName("farmersdelight:wheat_dough_from_egg");
recipes.addShapeless("aq_wheat_dough_from_egg", <farmersdelight:wheat_dough> * 3, [
    <ore:foodFlour>, <ore:foodFlour>, <ore:foodFlour>, <ore:listAllEgg>
]);

// Remove water dough recipe from Extra Delight Mixing Bowl
MixingBowl.remove("wheat_dough");

// Early-Game Knife Wheat Threshing (Cutting Board: 1 Wheat -> 1 Wheat Seeds + 1 Straw)
CuttingBoard.addRecipeWithTool("aq_cut_wheat", [<minecraft:wheat>] as IIngredient[], [<ore:toolKnife>] as IIngredient[], [<minecraft:wheat_seeds>, <farmersdelight:straw>] as IItemStack[]);

// ==========================================
// 16. Thematic Recipe Updates & Food Pruning
// ==========================================

// Lycanites Mobs flour/rice updates
recipes.remove(<lycanitesmobs:searing_taco>);
recipes.addShaped("aq_searing_taco", <lycanitesmobs:searing_taco>, [
    [null, <minecraft:blaze_powder>, null],
    [<ore:foodFlour>, <lycanitesmobs:cooked_cephignis_meat>, <ore:foodFlour>]
]);

recipes.remove(<lycanitesmobs:seashell_maki>);
recipes.addShaped("aq_seashell_maki", <lycanitesmobs:seashell_maki>, [
    [null, <minecraft:vine>, null],
    [<farmersdelight:cooked_rice>, <lycanitesmobs:cooked_ika_meat>, <farmersdelight:cooked_rice>]
]);

// Purge Grimoire of Gaia Pies
recipes.remove(<grimoireofgaia:food_pie_mandrake>);
recipes.remove(<grimoireofgaia:food_pie_meat>);
recipes.remove(<grimoireofgaia:food_pie_apple_gold>);
JEI.hide(<grimoireofgaia:food_pie_mandrake>);
JEI.hide(<grimoireofgaia:food_pie_meat>);
JEI.hide(<grimoireofgaia:food_pie_apple_gold>);

// ==========================================
// 17. Comprehensive Sweet Berry to Wildberry Conversion
// ==========================================

// Ore Dictionary integration
<ore:cropSweetBerry>.add(<rustic:wildberries>);
<ore:cropBerrySweet>.add(<rustic:wildberries>);

// Farmer's Delight Cheesecake to Oven (Pie Dish)
recipes.remove(<farmersdelight:sweet_berry_cheesecake>);
Oven.add("aq_cheesecake_wildberry", [<rustic:wildberries>, <rustic:wildberries>, <rustic:wildberries>, <rustic:wildberries>, <rustic:wildberries>, <rustic:wildberries>, <ore:listAllmilk>, <ore:listAllmilk>, <farmersdelight:pie_crust>] as IIngredient[], <extradelightlegacy:pie_dish>, <farmersdelight:sweet_berry_cheesecake>, 800, false);

// Display Names (Active Items Only)
<farmersdelight:sweet_berry_cookie>.displayName = "Wildberry Cookie";
<farmersdelight:sweet_berry_cheesecake>.displayName = "Wildberry Cheesecake";
<farmersdelight:sweet_berry_cheesecake_slice>.displayName = "Wildberry Cheesecake Slice";

<extradelightlegacy:sweet_berry_pie>.displayName = "Wildberry Pie";
<extradelightlegacy:sweet_berry_pie_slice>.displayName = "Wildberry Pie Slice";
<extradelightlegacy:sweet_berry_cookie_dough>.displayName = "Wildberry Cookie Dough";
<extradelightlegacy:sweet_berry_ice_cream>.displayName = "Wildberry Ice Cream";
<extradelightlegacy:sweet_berry_custard>.displayName = "Wildberry Custard";
<extradelightlegacy:sweet_berry_juice>.displayName = "Wildberry Juice";
<extradelightlegacy:sweet_berry_juice_fluid_bucket>.displayName = "Wildberry Juice Bucket";

// Localizations (Active Items Only)
game.setLocalization("en_us", "tile.farmersdelight.sweet_berry_cheesecake.name", "Wildberry Cheesecake");
game.setLocalization("en_us", "item.farmersdelight.sweet_berry_cheesecake_slice.name", "Wildberry Cheesecake Slice");
game.setLocalization("en_us", "item.farmersdelight.sweet_berry_cookie.name", "Wildberry Cookie");

game.setLocalization("en_us", "tile.extradelightlegacy.sweet_berry_pie.name", "Wildberry Pie");
game.setLocalization("en_us", "item.extradelightlegacy.sweet_berry_pie_slice.name", "Wildberry Pie Slice");
game.setLocalization("en_us", "item.extradelightlegacy.sweet_berry_cookie_dough.name", "Wildberry Cookie Dough");
game.setLocalization("en_us", "item.extradelightlegacy.sweet_berry_ice_cream.name", "Wildberry Ice Cream");
game.setLocalization("en_us", "item.extradelightlegacy.sweet_berry_custard.name", "Wildberry Custard");
game.setLocalization("en_us", "item.extradelightlegacy.sweet_berry_juice.name", "Wildberry Juice");
game.setLocalization("en_us", "item.extradelightlegacy.sweet_berry_juice_fluid_bucket.name", "Wildberry Juice Bucket");
game.setLocalization("en_us", "extradelightlegacy.jam.sweet_berries", "Wildberry Jam");
game.setLocalization("en_us", "extradelightlegacy.dynamic_toast.topping.sweet_berries_jam", "Wildberry Jam");

// ==========================================
// 18. Tomato Canonicalization (Rustic)
// ==========================================

// Remove recipes for Farmer's Delight tomato items (hidden in jei.zs)
recipes.remove(<farmersdelight:tomato>);
recipes.remove(<farmersdelight:tomato_seeds>);

// Tomato Crate Compression & Uncrating
recipes.remove(<farmersdelight:tomato_crate>);
recipes.addShaped("aq_tomato_crate", <farmersdelight:tomato_crate>, [
    [<rustic:tomato>, <rustic:tomato>, <rustic:tomato>],
    [<rustic:tomato>, <rustic:tomato>, <rustic:tomato>],
    [<rustic:tomato>, <rustic:tomato>, <rustic:tomato>]
]);
recipes.addShapeless("aq_tomato_uncrate", <rustic:tomato> * 9, [<farmersdelight:tomato_crate>]);

// Seed extraction from Rustic Tomato
recipes.addShapeless("aq_tomato_seeds_from_tomato", <rustic:tomato_seeds>, [<rustic:tomato>]);

// Cutting Board: Wild Tomatoes + Knife -> Rustic Tomato Seeds + Rustic Tomato
CuttingBoard.removeRecipe("wild_tomatoes");
CuttingBoard.addRecipeWithTool("aq_cut_wild_tomatoes", [<farmersdelight:wild_tomatoes>] as IIngredient[], [<ore:toolKnife>] as IIngredient[], [<rustic:tomato_seeds>, <rustic:tomato>] as IItemStack[]);

// Cutting Board: 1 Rustic Tomato + Knife -> 4x Tomato Slices
CuttingBoard.removeRecipesByOutput(<extradelightlegacy:sliced_tomato>);
CuttingBoard.addRecipeWithTool("aq_cut_rustic_tomato", [<rustic:tomato>] as IIngredient[], [<ore:toolKnife>] as IIngredient[], [<extradelightlegacy:sliced_tomato> * 4] as IItemStack[]);

// ==========================================
// 19. Crushing Tub & Juicer Extraction
// ==========================================

// Remove BOP Honey from Crushing Tub
CrushingTub.removeRecipe(<biomesoplenty:filled_honeycomb>);
CrushingTub.removeRecipe(<biomesoplenty:honeycomb>);
CrushingTub.removeRecipe(<biomesoplenty:honey_block>);

// Rustic Crushing Tub: Rustic Honeycomb -> 250mB Rustic Honey + Beeswax byproduct
CrushingTub.removeRecipe(<rustic:honeycomb>);
CrushingTub.addRecipe(<liquid:honey> * 250, <rustic:beeswax>, <rustic:honeycomb>);

// Extra Delight Juicer Recipes
Juicer.add("aq_juice_wildberry", <rustic:wildberries>, null, <liquid:sweet_berry_juice> * 250, 0);
Juicer.add("aq_juice_grape", <rustic:grapes>, null, <liquid:grapejuice> * 250, 0);
Juicer.add("aq_juice_tomato", <rustic:tomato>, <minecraft:dye:1>, <liquid:tomato_juice> * 250, 25);
Juicer.add("aq_juice_honeycomb", <rustic:honeycomb>, <rustic:beeswax>, <liquid:honey> * 250, 100);

// ==========================================
// 20. Beeswax Smelting Removal
// ==========================================

// Remove furnace & oven smelting of honeycomb into beeswax
furnace.remove(<rustic:beeswax>);
Oven.removeByOutput(<rustic:beeswax>);

// Blacklist honeycomb from Atum's Kiln
Kiln.blacklist("rustic:honeycomb");

// ==========================================
// 21. Cooking Pot: Rustic Ale Wort Brewing
// ==========================================

// Iron Bucket: 4 Wheat -> Universal Ale Wort Bucket (300 ticks / 15s, 1.0 XP)
CookingPot.addRecipeAdvanced(
    "aq_ale_wort_bucket",
    [<ore:cropWheat>, <ore:cropWheat>, <ore:cropWheat>, <ore:cropWheat>] as IIngredient[],
    <forge:bucketfilled>.withTag({FluidName: "alewort", Amount: 1000}),
    <minecraft:bucket>,
    300,
    1.0,
    true
);

// Ceramics Clay Bucket: 4 Wheat -> Clay Ale Wort Bucket (300 ticks / 15s, 1.0 XP)
CookingPot.addRecipeAdvanced(
    "aq_ale_wort_clay_bucket",
    [<ore:cropWheat>, <ore:cropWheat>, <ore:cropWheat>, <ore:cropWheat>] as IIngredient[],
    <ceramics:clay_bucket>.withTag({fluids: {FluidName: "alewort", Amount: 1000}}),
    <ceramics:clay_bucket>,
    300,
    1.0,
    true
);

// ==========================================
// 22. Honey Cookie Dough, Custard & Ice Cream
// ==========================================

// Honey Cookie Dough in Mixing Bowl
MixingBowl.removeByOutput(<extradelightlegacy:honey_cookie_dough>);
MixingBowl.add("aq_honey_cookie_dough", [<ore:cookieDoughSugar> | <extradelightlegacy:sugar_cookie_dough>, honeyBottle] as IIngredient[], [] as ILiquidStack[], null, "toolSpoon", <extradelightlegacy:honey_cookie_dough>, 4);
MixingBowl.add("aq_honey_cookie_dough_full", [<ore:foodFlour> | <ore:flour>, <ore:edlSweetener> | <minecraft:sugar>, <ore:butter> | <extradelightlegacy:butter>, honeyBottle, <ore:listAllEgg> | <minecraft:egg>] as IIngredient[], [] as ILiquidStack[], null, "toolSpoon", <extradelightlegacy:honey_cookie_dough>, 4);

// Shapeless Crafting Table for Honey Cookie Dough
recipes.addShapeless("aq_craft_honey_cookie_dough", <extradelightlegacy:honey_cookie_dough>, [<ore:cookieDoughSugar> | <extradelightlegacy:sugar_cookie_dough>, honeyBottle]);

// Crafting Table & Furnace for Honey Cookie
recipes.addShapeless("aq_craft_honey_cookie", <farmersdelight:honey_cookie> * 8, [<extradelightlegacy:honey_cookie_dough>]);
furnace.addRecipe(<farmersdelight:honey_cookie> * 8, <extradelightlegacy:honey_cookie_dough>, 0.35);

// Honey Custard in Cooking Pot
CookingPot.removeRecipesByOutput(<extradelightlegacy:honey_custard>);
CookingPot.addRecipeWithContainer(
    "aq_honey_custard",
    [honeyBottle, <ore:listAllmilk> | <minecraft:milk_bucket>, <ore:listAllEgg> | <minecraft:egg>, <ore:edlSweetener> | <minecraft:sugar>] as IIngredient[],
    <extradelightlegacy:honey_custard>,
    <minecraft:bowl>
);

// Honey Ice Cream in Chiller
Chiller.removeByOutput(<extradelightlegacy:honey_ice_cream>);
Chiller.add(
    "aq_chiller_honey_ice_cream",
    [<ore:edlSweetener> | <minecraft:sugar>, honeyBottle, honeyBottle, honeyBottle] as IIngredient[],
    <liquid:milk> * 250,
    <minecraft:bowl>,
    <extradelightlegacy:honey_ice_cream>,
    800,
    true
);

// ==========================================
// 23. Honey Dishes & Redundant Honey Removal
// ==========================================

// Purge recipes for Animania and BOP honey containers
recipes.remove(<animania:honey_bottle>);
recipes.remove(<biomesoplenty:jar_filled:0>);

// Honey Chili Chicken in Cooking Pot
CookingPot.removeRecipesByOutput(<extradelightlegacy:honey_chili_chicken>);
CookingPot.addRecipeWithContainer(
    "aq_honey_chili_chicken",
    [
        <extradelightlegacy:cubed_chicken>,
        honeyBottle,
        <extradelightlegacy:chili_powder>,
        <extradelightlegacy:garlic_clove>,
        <extradelightlegacy:grated_ginger>,
        <extradelightlegacy:soy_sauce_item>
    ] as IIngredient[],
    <extradelightlegacy:honey_chili_chicken>,
    <minecraft:bowl>
);

// Honey Cheesecake in Pie Dish (Oven, 800 ticks)
recipes.remove(<extradelightlegacy:honey_cheesecake>);
Oven.removeByOutput(<extradelightlegacy:honey_cheesecake>);
Oven.add(
    "aq_cheesecake_honey",
    [honeyBottle, honeyBottle, honeyBottle, <ore:listAllmilk>, <ore:listAllmilk>, <farmersdelight:pie_crust>] as IIngredient[],
    <extradelightlegacy:pie_dish>,
    <extradelightlegacy:honey_cheesecake>,
    800,
    false
);

// Twilight Delight Honey 113
recipes.remove(<twilightdelight:honey_113>);
recipes.addShapeless("aq_honey_113", <twilightdelight:honey_113>, [<twilightdelight:experiment_113>, honeyBottle]);

// ==========================================
// 24. Disable Twilight Delight Milkshakes
// ==========================================

recipes.remove(<twilightdelight:aurora_milkshake>);
recipes.remove(<twilightdelight:glacier_milkshake>);
recipes.remove(<twilightdelight:phytochemical_milkshake>);
recipes.remove(<twilightdelight:torchberry_milkshake>);

// ==========================================
// 25. Cocoa Processing & Chocolate Desserts
// ==========================================

// Remove obsolete cocoa recipes
recipes.remove(<extradelightlegacy:cocoa_solids>);
recipes.remove(<extradelightlegacy:roasted_cocoa_beans>);
recipes.remove(<extradelightlegacy:chocolate_orange>);
furnace.remove(<extradelightlegacy:roasted_cocoa_beans>);
Mortar.removeByItemOutput(<extradelightlegacy:cocoa_powder>);

// Direct Mortar Grinding: 1 Cocoa Bean -> 2 Cocoa Powder in 4 pestle hits
Mortar.add("aq_mortar_cocoa_powder", <minecraft:dye:3>, <extradelightlegacy:cocoa_powder> * 2, 4);

// Trail Mix using raw Cocoa Beans
recipes.remove(<extradelightlegacy:trail_mix>);
recipes.addShapeless("aq_trail_mix", <extradelightlegacy:trail_mix> * 3, [
    <extradelightlegacy:dried_fruit>,
    <extradelightlegacy:roasted_peanuts>,
    <minecraft:dye:3>
]);

// Chocolate Pie (Pie Dish in Oven, 800 ticks)
recipes.remove(<farmersdelight:chocolate_pie>);
Oven.removeByOutput(<farmersdelight:chocolate_pie>);
Oven.add(
    "aq_pie_chocolate",
    [
        <extradelightlegacy:cocoa_powder>,
        <extradelightlegacy:cocoa_powder>,
        <extradelightlegacy:cocoa_powder>,
        <ore:listAllmilk>,
        <ore:listAllmilk>,
        <ore:listAllmilk>,
        <minecraft:sugar>,
        <minecraft:sugar>,
        <farmersdelight:pie_crust>
    ] as IIngredient[],
    <extradelightlegacy:pie_dish>,
    <farmersdelight:chocolate_pie>,
    800,
    false
);

// Mint Chip Ice Cream (Chiller using raw Cocoa Beans)
Chiller.removeByOutput(<extradelightlegacy:mint_chip_ice_cream>);
Chiller.add(
    "aq_chiller_mint_chip",
    [<ore:edlSweetener> | <minecraft:sugar>, <extradelightlegacy:mint>, <minecraft:dye:3>] as IIngredient[],
    <liquid:milk> * 250,
    <minecraft:bowl>,
    <extradelightlegacy:mint_chip_ice_cream>,
    800,
    true
);

