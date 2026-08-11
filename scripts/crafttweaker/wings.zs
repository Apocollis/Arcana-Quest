#priority 70
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import mods.thaumcraft.Infusion;
import mods.jei.JEI;

// 1. Remove default crafting table recipes for all Wings
val wingsList = [
    <wings:angel_wings>,
    <wings:slime_wings>,
    <wings:blue_butterfly_wings>,
    <wings:monarch_butterfly_wings>,
    <wings:fire_wings>,
    <wings:bat_wings>,
    <wings:fairy_wings>,
    <wings:evil_wings>,
    <wings:dragon_wings>
] as IItemStack[];

for wing in wingsList {
    recipes.remove(wing);
}

// 2. Hide unused ores, dusts, and gems from JEI
recipes.remove(<wings:amethyst_ore>);
JEI.hide(<wings:amethyst_ore>);

recipes.remove(<wings:fairy_dust_ore>);
JEI.hide(<wings:fairy_dust_ore>);

recipes.remove(<wings:fairy_dust>);
JEI.hide(<wings:fairy_dust>);

recipes.remove(<mysticalworld:amethyst_gem>);
JEI.hide(<mysticalworld:amethyst_gem>);

// 3. Thaumcraft Infusion Altar Recipes for Wings
val harness = <thaumicaugmentation:thaumostatic_harness>;
val wildfireCore = <embers:wildfire_core>;
val flyingOintment = <bewitchment:flying_ointment>;
val shiftingStar = <astralsorcery:itemshiftingstar>;
val pixieRing = <botania:pixiering>;

val wingRecipes as IIngredient[][IItemStack] = {
    <wings:angel_wings>: [<minecraft:feather>, <minecraft:feather>],
    <wings:dragon_wings>: [<minecraft:leather>, <ore:dyeRed>],
    <wings:fairy_wings>: [<ore:dyeWhite>, <ore:dyePink>],
    <wings:fire_wings>: [<minecraft:blaze_powder>, <minecraft:blaze_powder>],
    <wings:bat_wings>: [<minecraft:leather>, <ore:dyeBrown>],
    <wings:slime_wings>: [<minecraft:slime_ball>, <minecraft:slime_ball>],
    <wings:blue_butterfly_wings>: [<ore:dyeBlack>, <ore:dyeBlue>],
    <wings:monarch_butterfly_wings>: [<ore:dyeBlack>, <ore:dyeOrange>],
    <wings:evil_wings>: [<minecraft:leather>, <ore:dyeBlack>]
};

var recipeIdx = 0;
for wingOutput, uniqueItems in wingRecipes {
    recipeIdx = recipeIdx + 1;
    val recipeName = "aq_wings_recipe_" + recipeIdx;
    val pedestals as IIngredient[] = [
        harness,
        wildfireCore,
        flyingOintment,
        shiftingStar,
        pixieRing,
        uniqueItems[0],
        uniqueItems[1]
    ];
    
    Infusion.registerRecipe(
        recipeName,
        "AQ_WINGS",
        wingOutput,
        6,
        [<aspect:volatus> * 100, <aspect:praecantatio> * 40, <aspect:motus> * 20, <aspect:potentia> * 20],
        <minecraft:elytra>,
        pedestals
    );
}
