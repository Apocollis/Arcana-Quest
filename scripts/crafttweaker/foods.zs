#priority 50
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import mods.jei.JEI;
import mods.farmersdelight.CookingPot;
import mods.farmersdelight.CuttingBoard;

// 1. High-Tier Feasts Gating (Cooking Pot with Raw Animania Prime Meats)

// Roast Chicken: Gated behind Raw Prime Chicken
CookingPot.removeRecipesByOutput(<farmersdelight:roast_chicken>);
CookingPot.addRecipeWithContainer(
    "aq_roast_chicken_prime",
    [
        <animania:raw_prime_chicken>,
        <minecraft:potato>,
        <minecraft:carrot>,
        <farmersdelight:onion>,
        <farmersdelight:onion>
    ] as IIngredient[],
    <farmersdelight:roast_chicken>,
    <minecraft:bowl>
);

// Honey Glazed Ham: Gated behind Raw Prime Pork or Raw Prime Bacon
CookingPot.removeRecipesByOutput(<farmersdelight:honey_glazed_ham>);
CookingPot.addRecipeWithContainer(
    "aq_honey_glazed_ham_prime_pork",
    [
        <animania:raw_prime_pork>,
        <minecraft:honey_bottle>,
        <minecraft:sweet_berries>,
        <minecraft:sweet_berries>
    ] as IIngredient[],
    <farmersdelight:honey_glazed_ham>,
    <minecraft:bowl>
);
CookingPot.addRecipeWithContainer(
    "aq_honey_glazed_ham_prime_bacon",
    [
        <animania:raw_prime_bacon>,
        <minecraft:honey_bottle>,
        <minecraft:sweet_berries>,
        <minecraft:sweet_berries>
    ] as IIngredient[],
    <farmersdelight:honey_glazed_ham>,
    <minecraft:bowl>
);

// Shepherd's Pie: Gated behind Raw Prime Mutton or Raw Prime Chevon
CookingPot.removeRecipesByOutput(<farmersdelight:shepherds_pie>);
CookingPot.addRecipeWithContainer(
    "aq_shepherds_pie_prime_mutton",
    [
        <animania:raw_prime_mutton>,
        <minecraft:potato>,
        <minecraft:potato>,
        <minecraft:milk_bucket>
    ] as IIngredient[],
    <farmersdelight:shepherds_pie>,
    <minecraft:bowl>
);
CookingPot.addRecipeWithContainer(
    "aq_shepherds_pie_prime_chevon",
    [
        <animania:raw_prime_chevon>,
        <minecraft:potato>,
        <minecraft:potato>,
        <minecraft:milk_bucket>
    ] as IIngredient[],
    <farmersdelight:shepherds_pie>,
    <minecraft:bowl>
);

// 2. Burger Pruning & JEI Hiding
val burgersToHide = [
    <farmersdelight:hamburger>,
    <twilightdelight:ghast_burger>,
    <twilightdelight:hydra_burger>,
    <lycanitesmobs:bulwark_burger>
] as IItemStack[];

for burger in burgersToHide {
    recipes.remove(burger);
    JEI.hide(burger);
}

// 3. Animania Prime Meat Cutting Board Recipes (Yields 2x Base Meat)

// Raw Meats
CuttingBoard.addRecipe("cut_raw_prime_beef", [<animania:raw_prime_beef>] as IIngredient[], [<minecraft:beef> * 2] as IItemStack[]);
CuttingBoard.addRecipe("cut_raw_prime_steak", [<animania:raw_prime_steak>] as IIngredient[], [<minecraft:beef> * 2] as IItemStack[]);
CuttingBoard.addRecipe("cut_raw_prime_pork", [<animania:raw_prime_pork>] as IIngredient[], [<minecraft:porkchop> * 2] as IItemStack[]);
CuttingBoard.addRecipe("cut_raw_prime_bacon", [<animania:raw_prime_bacon>] as IIngredient[], [<minecraft:porkchop> * 2] as IItemStack[]);
CuttingBoard.addRecipe("cut_raw_prime_chicken", [<animania:raw_prime_chicken>] as IIngredient[], [<minecraft:chicken> * 2] as IItemStack[]);
CuttingBoard.addRecipe("cut_raw_prime_mutton", [<animania:raw_prime_mutton>] as IIngredient[], [<minecraft:mutton> * 2] as IItemStack[]);
CuttingBoard.addRecipe("cut_raw_prime_chevon", [<animania:raw_prime_chevon>] as IIngredient[], [<minecraft:mutton> * 2] as IItemStack[]);

// Cooked Meats
CuttingBoard.addRecipe("cut_cooked_prime_beef", [<animania:cooked_prime_beef>] as IIngredient[], [<minecraft:cooked_beef> * 2] as IItemStack[]);
CuttingBoard.addRecipe("cut_cooked_prime_steak", [<animania:cooked_prime_steak>] as IIngredient[], [<minecraft:cooked_beef> * 2] as IItemStack[]);
CuttingBoard.addRecipe("cut_cooked_prime_pork", [<animania:cooked_prime_pork>] as IIngredient[], [<minecraft:cooked_porkchop> * 2] as IItemStack[]);
CuttingBoard.addRecipe("cut_cooked_prime_bacon", [<animania:cooked_prime_bacon>] as IIngredient[], [<minecraft:cooked_porkchop> * 2] as IItemStack[]);
CuttingBoard.addRecipe("cut_cooked_prime_chicken", [<animania:cooked_prime_chicken>] as IIngredient[], [<minecraft:cooked_chicken> * 2] as IItemStack[]);
CuttingBoard.addRecipe("cut_cooked_prime_mutton", [<animania:cooked_prime_mutton>] as IIngredient[], [<minecraft:cooked_mutton> * 2] as IItemStack[]);
CuttingBoard.addRecipe("cut_cooked_prime_chevon", [<animania:cooked_prime_chevon>] as IIngredient[], [<minecraft:cooked_mutton> * 2] as IItemStack[]);
