#priority 70
import crafttweaker.item.IItemStack;
import mods.thaumcraft.Infusion;

// Remove basic crafting table recipes for Ozzy Liners
recipes.remove(<armorunder:auto_chestplate_liner>);
recipes.remove(<armorunder:auto_leggings_liner>);

// 1. Ozzy Chestplate Liner Infusion
Infusion.registerRecipe(
    "aq_ozzy_chestplate_liner",
    "",
    <armorunder:auto_chestplate_liner>,
    5,
    [<aspect:praemunio> * 25, <aspect:ignis> * 25, <aspect:gelum> * 25],
    <thaumcraft:fabric>,
    [
        <armorunder:cool_chestplate_liner>,
        <embers:ashen_cloth>,
        <armorunder:warm_chestplate_liner>,
        <embers:ashen_cloth>
    ]
);

// 2. Ozzy Leggings Liner Infusion
Infusion.registerRecipe(
    "aq_ozzy_leggings_liner",
    "",
    <armorunder:auto_leggings_liner>,
    5,
    [<aspect:praemunio> * 25, <aspect:ignis> * 25, <aspect:gelum> * 25],
    <thaumcraft:fabric>,
    [
        <armorunder:cool_leggings_liner>,
        <embers:ashen_cloth>,
        <armorunder:warm_leggings_liner>,
        <embers:ashen_cloth>
    ]
);
