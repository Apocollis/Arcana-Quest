#priority 70
import crafttweaker.item.IItemStack;
import mods.jei.JEI;
import mods.thaumcraft.ArcaneWorkbench;
import mods.thaumcraft.Infusion;

// 1. Hide internal rendering prop items from JEI
val disabledProps = [
    <grimoireofgaia:weapon_prop>,
    <grimoireofgaia:weapon_prop_projectile_bubble>,
    <grimoireofgaia:weapon_prop_projectile_magic>,
    <grimoireofgaia:weapon_prop_projectile_magic_random>,
    <grimoireofgaia:weapon_prop_projectile_poison>,
    <grimoireofgaia:weapon_prop_projectile_web>,
    <grimoireofgaia:weapon_prop_enchanted>,
    <grimoireofgaia:shield_prop>,
    <grimoireofgaia:weapon_prop_sword_wood>,
    <grimoireofgaia:weapon_prop_sword_stone>,
    <grimoireofgaia:weapon_prop_sword_iron>,
    <grimoireofgaia:weapon_prop_sword_gold>,
    <grimoireofgaia:weapon_prop_axe_wood>,
    <grimoireofgaia:weapon_prop_axe_stone>,
    <grimoireofgaia:weapon_prop_axe_iron>,
    <grimoireofgaia:weapon_prop_axe_gold>,
    <grimoireofgaia:weapon_prop_dagger_metal>,
    <grimoireofgaia:weapon_prop_broom>,
    <grimoireofgaia:weapon_prop_hammer_minotaur>,
    <grimoireofgaia:web_temp>
] as IItemStack[];

for prop in disabledProps {
    recipes.remove(prop);
    JEI.hide(prop);
}

// 2. Arcane Workbench Crafting for Gaia Elemental Fans
ArcaneWorkbench.registerShapedRecipe(
    "aq_gaia_fire_fan",
    "FIRSTSTEPS",
    15,
    [<aspect:ignis> * 5],
    <grimoireofgaia:weapon_fan_fire>,
    [
        [<minecraft:feather>, <thaumcraft:nugget:8>, <minecraft:feather>],
        [<minecraft:feather>, <minecraft:blaze_rod>, <minecraft:feather>],
        [<minecraft:feather>, <thaumcraft:nugget:8>, <minecraft:feather>]
    ]
);

ArcaneWorkbench.registerShapedRecipe(
    "aq_gaia_ice_fan",
    "FIRSTSTEPS",
    15,
    [<aspect:aqua> * 5],
    <grimoireofgaia:weapon_fan_ice>,
    [
        [<minecraft:feather>, <thaumcraft:nugget:8>, <minecraft:feather>],
        [<minecraft:feather>, <minecraft:packed_ice>, <minecraft:feather>],
        [<minecraft:feather>, <thaumcraft:nugget:8>, <minecraft:feather>]
    ]
);

// 3. Arcane Workbench Crafting for Basic Gaia Book
ArcaneWorkbench.registerShapedRecipe(
    "aq_gaia_weapon_book",
    "FIRSTSTEPS",
    15,
    [<aspect:ordo> * 5, <aspect:perditio> * 5],
    <grimoireofgaia:weapon_book>,
    [
        [<thaumcraft:fabric>, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "cognitio"}]}), <thaumcraft:fabric>],
        [<thaumcraft:fabric>, <minecraft:book>, <thaumcraft:fabric>],
        [<thaumcraft:fabric>, <thaumcraft:nugget:8>, <thaumcraft:fabric>]
    ]
);
