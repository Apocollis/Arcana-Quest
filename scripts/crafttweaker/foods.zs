#priority 50
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import mods.jei.JEI;
import mods.farmersdelight.CookingPot;
import mods.farmersdelight.CuttingBoard;

// ==========================================
// 1. High-Tier Feasts (Primal Cuts Gating)
// ==========================================

val honeyBottle = <animania:honey_bottle> | <rustic:honey>;
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
        <farmersdelight:raw_pasta> | <extradelightlegacy:pasta>,
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
    <animania:cooked_prime_chevon>,
    <animania:raw_prime_peacock>,
    <animania:raw_prime_rabbit>
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
CuttingBoard.removeRecipesByInput(<minecraft:beef>);
CuttingBoard.addRecipeAdvanced(
    "aq_cut_raw_beef",
    [<minecraft:beef>],
    [knife],
    [
        <extradelightlegacy:ground_beef> * 2,
        <extradelightlegacy:ground_beef>,
        <extradelightlegacy:cubed_beef>,
        <extradelightlegacy:cubed_beef>,
        <extradelightlegacy:beef_scraps>
    ],
    [1.0, 0.5, 1.0, 0.5, 0.5]
);
CuttingBoard.removeRecipesByInput(<minecraft:cooked_beef>);
CuttingBoard.addRecipeAdvanced(
    "aq_cut_cooked_beef",
    [<minecraft:cooked_beef>],
    [knife],
    [
        <extradelightlegacy:cooked_ground_beef> * 2,
        <extradelightlegacy:cooked_ground_beef>,
        <extradelightlegacy:cooked_cubed_beef>,
        <extradelightlegacy:cooked_cubed_beef>,
        <extradelightlegacy:cooked_beef_scraps>
    ],
    [1.0, 0.5, 1.0, 0.5, 0.5]
);

CuttingBoard.addRecipeAdvanced(
    "aq_cut_raw_beef_roast",
    [<extradelightlegacy:beef_roast>],
    [knife],
    [<extradelightlegacy:beef_stewmeat> * 2, <extradelightlegacy:beef_stewmeat>],
    [1.0, 0.5]
);
CuttingBoard.addRecipeAdvanced(
    "aq_cut_cooked_beef_roast",
    [<extradelightlegacy:cooked_beef_roast>],
    [knife],
    [<extradelightlegacy:cooked_beef_stewmeat> * 2, <extradelightlegacy:cooked_beef_stewmeat>],
    [1.0, 0.5]
);

CuttingBoard.addRecipe(
    "aq_cut_raw_beef_ribs",
    [<extradelightlegacy:beef_ribs>],
    [<minecraft:bone> * 2, <extradelightlegacy:beef_stewmeat>]
);
CuttingBoard.addRecipe(
    "aq_cut_cooked_beef_ribs",
    [<extradelightlegacy:cooked_beef_ribs>],
    [<minecraft:bone> * 2, <extradelightlegacy:cooked_beef_stewmeat>]
);

// --- Sheep & Lamb Butchery ---
CuttingBoard.removeRecipesByInput(<minecraft:mutton>);
CuttingBoard.addRecipeAdvanced(
    "aq_cut_raw_mutton",
    [<minecraft:mutton>],
    [knife],
    [
        <extradelightlegacy:ground_lamb>,
        <extradelightlegacy:ground_lamb>,
        <extradelightlegacy:cubed_lamb>,
        <farmersdelight:mutton_chops>,
        <farmersdelight:mutton_chops>,
        <extradelightlegacy:lamb_scraps>
    ],
    [1.0, 0.5, 1.0, 1.0, 0.5, 0.5]
);
CuttingBoard.removeRecipesByInput(<minecraft:cooked_mutton>);
CuttingBoard.addRecipeAdvanced(
    "aq_cut_cooked_mutton",
    [<minecraft:cooked_mutton>],
    [knife],
    [
        <extradelightlegacy:cooked_ground_lamb>,
        <extradelightlegacy:cooked_ground_lamb>,
        <extradelightlegacy:cooked_cubed_lamb>,
        <farmersdelight:cooked_mutton_chops>,
        <farmersdelight:cooked_mutton_chops>,
        <extradelightlegacy:cooked_lamb_scraps>
    ],
    [1.0, 0.5, 1.0, 1.0, 0.5, 0.5]
);

CuttingBoard.addRecipeAdvanced(
    "aq_cut_raw_lamb_roast",
    [<extradelightlegacy:lamb_roast>],
    [knife],
    [<extradelightlegacy:lamb_stewmeat> * 2, <extradelightlegacy:lamb_stewmeat>],
    [1.0, 0.5]
);
CuttingBoard.addRecipeAdvanced(
    "aq_cut_cooked_lamb_roast",
    [<extradelightlegacy:cooked_lamb_roast>],
    [knife],
    [<extradelightlegacy:cooked_lamb_stewmeat> * 2, <extradelightlegacy:cooked_lamb_stewmeat>],
    [1.0, 0.5]
);

CuttingBoard.addRecipe(
    "aq_cut_raw_lamb_ribs",
    [<extradelightlegacy:lamb_ribs>],
    [<minecraft:bone> * 2, <extradelightlegacy:lamb_stewmeat>]
);
CuttingBoard.addRecipe(
    "aq_cut_cooked_lamb_ribs",
    [<extradelightlegacy:cooked_lamb_ribs>],
    [<minecraft:bone> * 2, <extradelightlegacy:cooked_lamb_stewmeat>]
);

// --- Goat Butchery ---
CuttingBoard.removeRecipesByInput(<animania:raw_chevon>);
CuttingBoard.addRecipeAdvanced(
    "aq_cut_raw_chevon",
    [<animania:raw_chevon>],
    [knife],
    [
        <extradelightlegacy:ground_goat> * 2,
        <extradelightlegacy:ground_goat>,
        <extradelightlegacy:cubed_goat>,
        <extradelightlegacy:cubed_goat>,
        <extradelightlegacy:goat_scraps>
    ],
    [1.0, 0.5, 1.0, 0.5, 0.5]
);
CuttingBoard.removeRecipesByInput(<animania:cooked_chevon>);
CuttingBoard.addRecipeAdvanced(
    "aq_cut_cooked_chevon",
    [<animania:cooked_chevon>],
    [knife],
    [
        <extradelightlegacy:cooked_ground_goat> * 2,
        <extradelightlegacy:cooked_ground_goat>,
        <extradelightlegacy:cooked_cubed_goat>,
        <extradelightlegacy:cooked_cubed_goat>,
        <extradelightlegacy:cooked_goat_scraps>
    ],
    [1.0, 0.5, 1.0, 0.5, 0.5]
);

CuttingBoard.addRecipeAdvanced(
    "aq_cut_raw_goat_roast",
    [<extradelightlegacy:goat_roast>],
    [knife],
    [<extradelightlegacy:goat_stewmeat> * 2, <extradelightlegacy:goat_stewmeat>],
    [1.0, 0.5]
);
CuttingBoard.addRecipeAdvanced(
    "aq_cut_cooked_goat_roast",
    [<extradelightlegacy:cooked_goat_roast>],
    [knife],
    [<extradelightlegacy:cooked_goat_stewmeat> * 2, <extradelightlegacy:cooked_goat_stewmeat>],
    [1.0, 0.5]
);

CuttingBoard.addRecipe(
    "aq_cut_raw_goat_ribs",
    [<extradelightlegacy:goat_ribs>],
    [<minecraft:bone> * 2, <extradelightlegacy:goat_stewmeat>]
);
CuttingBoard.addRecipe(
    "aq_cut_cooked_goat_ribs",
    [<extradelightlegacy:cooked_goat_ribs>],
    [<minecraft:bone> * 2, <extradelightlegacy:cooked_goat_stewmeat>]
);

// --- Swine Butchery ---
CuttingBoard.removeRecipesByInput(<minecraft:porkchop>);
CuttingBoard.addRecipeAdvanced(
    "aq_cut_raw_porkchop",
    [<minecraft:porkchop>],
    [knife],
    [
        <extradelightlegacy:bacon> * 2,
        <extradelightlegacy:bacon>,
        <extradelightlegacy:cubed_pork>,
        <extradelightlegacy:ground_pork>,
        <extradelightlegacy:pork_scraps>
    ],
    [1.0, 0.5, 1.0, 1.0, 0.5]
);
CuttingBoard.removeRecipesByInput(<minecraft:cooked_porkchop>);
CuttingBoard.addRecipeAdvanced(
    "aq_cut_cooked_porkchop",
    [<minecraft:cooked_porkchop>],
    [knife],
    [
        <extradelightlegacy:cooked_bacon> * 2,
        <extradelightlegacy:cooked_bacon>,
        <extradelightlegacy:cooked_cubed_pork>,
        <extradelightlegacy:cooked_ground_pork>,
        <extradelightlegacy:cooked_pork_scraps>
    ],
    [1.0, 0.5, 1.0, 1.0, 0.5]
);

CuttingBoard.addRecipeAdvanced(
    "aq_cut_raw_pork_roast",
    [<extradelightlegacy:pork_roast>],
    [knife],
    [<extradelightlegacy:pork_stewmeat> * 2, <extradelightlegacy:pork_stewmeat>],
    [1.0, 0.5]
);
CuttingBoard.addRecipeAdvanced(
    "aq_cut_cooked_pork_roast",
    [<extradelightlegacy:cooked_pork_roast>],
    [knife],
    [<extradelightlegacy:cooked_pork_stewmeat> * 2, <extradelightlegacy:cooked_pork_stewmeat>],
    [1.0, 0.5]
);

CuttingBoard.addRecipe(
    "aq_cut_raw_pork_ribs",
    [<extradelightlegacy:pork_ribs>],
    [<minecraft:bone> * 2, <extradelightlegacy:pork_stewmeat>]
);
CuttingBoard.addRecipe(
    "aq_cut_cooked_pork_ribs",
    [<extradelightlegacy:cooked_pork_ribs>],
    [<minecraft:bone> * 2, <extradelightlegacy:cooked_pork_stewmeat>]
);

CuttingBoard.addRecipe(
    "aq_cut_ham",
    [<farmersdelight:ham>],
    [<minecraft:porkchop> * 2, <minecraft:bone>]
);
CuttingBoard.addRecipe(
    "aq_cut_smoked_ham",
    [<farmersdelight:smoked_ham>],
    [<minecraft:cooked_porkchop> * 2, <minecraft:bone>]
);

// --- Venison Butchery ---
CuttingBoard.addRecipe(
    "aq_cut_raw_venison_ribs",
    [<twilightdelight:raw_venison_rib>],
    [<minecraft:bone> * 2, <twilightforest:raw_venison>]
);
CuttingBoard.addRecipe(
    "aq_cut_cooked_venison_ribs",
    [<twilightdelight:cooked_venison_rib>],
    [<minecraft:bone> * 2, <twilightforest:cooked_venison>]
);

// --- Poultry Butchery Hierarchy ---
CuttingBoard.removeRecipesByInput(<minecraft:chicken>);
CuttingBoard.addRecipe(
    "aq_cut_raw_chicken",
    [<minecraft:chicken>],
    [
        <extradelightlegacy:chicken_breast> * 2,
        <extradelightlegacy:chicken_leg> * 2,
        <extradelightlegacy:chicken_thigh> * 2
    ]
);
CuttingBoard.removeRecipesByInput(<minecraft:cooked_chicken>);
CuttingBoard.addRecipe(
    "aq_cut_cooked_chicken",
    [<minecraft:cooked_chicken>],
    [
        <extradelightlegacy:cooked_chicken_breast> * 2,
        <extradelightlegacy:cooked_chicken_leg> * 2,
        <extradelightlegacy:cooked_chicken_thigh> * 2
    ]
);

CuttingBoard.addRecipeAdvanced(
    "aq_cut_raw_chicken_breast",
    [<extradelightlegacy:chicken_breast>],
    [knife],
    [<farmersdelight:chicken_cuts> * 2, <farmersdelight:chicken_cuts>],
    [1.0, 0.5]
);
CuttingBoard.addRecipeAdvanced(
    "aq_cut_cooked_chicken_breast",
    [<extradelightlegacy:cooked_chicken_breast>],
    [knife],
    [<farmersdelight:cooked_chicken_cuts> * 2, <farmersdelight:cooked_chicken_cuts>],
    [1.0, 0.5]
);

CuttingBoard.addRecipeAdvanced(
    "aq_cut_raw_chicken_thigh",
    [<extradelightlegacy:chicken_thigh>],
    [knife],
    [<extradelightlegacy:chicken_stewmeat>, <extradelightlegacy:chicken_stewmeat>, <extradelightlegacy:chicken_scraps>],
    [1.0, 0.5, 0.5]
);
CuttingBoard.addRecipeAdvanced(
    "aq_cut_cooked_chicken_thigh",
    [<extradelightlegacy:cooked_chicken_thigh>],
    [knife],
    [<extradelightlegacy:cooked_chicken_stewmeat>, <extradelightlegacy:cooked_chicken_stewmeat>, <extradelightlegacy:cooked_chicken_scraps>],
    [1.0, 0.5, 0.5]
);

CuttingBoard.addRecipeAdvanced(
    "aq_cut_raw_chicken_cuts",
    [<farmersdelight:chicken_cuts>],
    [knife],
    [<extradelightlegacy:cubed_chicken>, <extradelightlegacy:cubed_chicken>, <extradelightlegacy:chicken_scraps>],
    [1.0, 0.5, 0.5]
);
CuttingBoard.addRecipeAdvanced(
    "aq_cut_cooked_chicken_cuts",
    [<farmersdelight:cooked_chicken_cuts>],
    [knife],
    [<extradelightlegacy:cooked_cubed_chicken>, <extradelightlegacy:cooked_cubed_chicken>, <extradelightlegacy:cooked_chicken_scraps>],
    [1.0, 0.5, 0.5]
);

// --- Rabbit Butchery Hierarchy ---
CuttingBoard.removeRecipesByInput(<minecraft:rabbit>);
CuttingBoard.addRecipe(
    "aq_cut_raw_rabbit",
    [<minecraft:rabbit>],
    [
        <extradelightlegacy:rabbit_leg> * 2,
        <extradelightlegacy:rabbit_thigh> * 2,
        <extradelightlegacy:rabbit_saddle>
    ]
);
CuttingBoard.removeRecipesByInput(<minecraft:cooked_rabbit>);
CuttingBoard.addRecipe(
    "aq_cut_cooked_rabbit",
    [<minecraft:cooked_rabbit>],
    [
        <extradelightlegacy:cooked_rabbit_leg> * 2,
        <extradelightlegacy:cooked_rabbit_thigh> * 2,
        <extradelightlegacy:cooked_rabbit_saddle>
    ]
);

CuttingBoard.addRecipeAdvanced(
    "aq_cut_raw_rabbit_saddle",
    [<extradelightlegacy:rabbit_saddle>],
    [knife],
    [<extradelightlegacy:rabbit_stewmeat> * 2, <extradelightlegacy:rabbit_stewmeat>],
    [1.0, 0.5]
);
CuttingBoard.addRecipeAdvanced(
    "aq_cut_cooked_rabbit_saddle",
    [<extradelightlegacy:cooked_rabbit_saddle>],
    [knife],
    [<extradelightlegacy:cooked_rabbit_stewmeat> * 2, <extradelightlegacy:cooked_rabbit_stewmeat>],
    [1.0, 0.5]
);

CuttingBoard.addRecipeAdvanced(
    "aq_cut_raw_rabbit_thigh",
    [<extradelightlegacy:rabbit_thigh>],
    [knife],
    [
        <extradelightlegacy:cubed_rabbit>,
        <extradelightlegacy:cubed_rabbit>,
        <extradelightlegacy:ground_rabbit>,
        <extradelightlegacy:ground_rabbit>,
        <extradelightlegacy:rabbit_scraps>
    ],
    [1.0, 0.5, 1.0, 0.5, 0.5]
);
CuttingBoard.addRecipeAdvanced(
    "aq_cut_cooked_rabbit_thigh",
    [<extradelightlegacy:cooked_rabbit_thigh>],
    [knife],
    [
        <extradelightlegacy:cooked_cubed_rabbit>,
        <extradelightlegacy:cooked_cubed_rabbit>,
        <extradelightlegacy:cooked_ground_rabbit>,
        <extradelightlegacy:cooked_ground_rabbit>,
        <extradelightlegacy:cooked_rabbit_scraps>
    ],
    [1.0, 0.5, 1.0, 0.5, 0.5]
);
