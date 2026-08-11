#priority 70
import crafttweaker.item.IItemStack;
import mods.thaumcraft.Infusion;
import mods.jei.JEI;

// 1. Remove Small Mob Net recipe & hide from JEI
recipes.remove(<animalnet:mob_net_small>);
JEI.hide(<animalnet:mob_net_small>);

// Remove default recipes for Big Mob Net and NPC Net
recipes.remove(<animalnet:mob_net_big>);
recipes.remove(<animalnet:npc_net>);

// 2. Rename & Single-Use Configuration
<animalnet:mob_net_big>.displayName = "Mob Net";
<animalnet:mob_net_big>.maxDamage = 1;
<animalnet:mob_net_big>.addTooltip("Single Use Only");

<animalnet:npc_net>.maxDamage = 1;
<animalnet:npc_net>.addTooltip("Single Use Only");

// 3. Thaumcraft Infusion Recipes
// Mob Net Infusion
Infusion.registerRecipe(
    "aq_mob_net",
    "AQ_ANIMAL_NETS",
    <animalnet:mob_net_big>,
    4,
    [<aspect:instrumentum> * 40, <aspect:vinculum> * 40, <aspect:aversio> * 40],
    <thaumicwonders:disjunction_cloth>,
    [
        <bewitchment:pure_filament>,
        <bewitchment:pure_filament>,
        <bewitchment:pure_filament>,
        <bewitchment:pure_filament>
    ]
);

// NPC Net Infusion
Infusion.registerRecipe(
    "aq_npc_net",
    "AQ_ANIMAL_NETS",
    <animalnet:npc_net>,
    4,
    [<aspect:instrumentum> * 40, <aspect:vinculum> * 40, <aspect:humanus> * 40],
    <thaumcraft:fabric>,
    [
        <bewitchment:pure_filament>,
        <bewitchment:pure_filament>,
        <bewitchment:pure_filament>,
        <bewitchment:pure_filament>
    ]
);
