#priority 50
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import mods.jei.JEI;
import mods.thaumcraft.Infusion;
import mods.thaumcraft.ArcaneWorkbench;

// ============================================================================
// 1. Reliquary Mob Charms, Fragments, and Belt Removal
// ============================================================================

val charmsToHide = [
    <xreliquary:mob_charm_belt>,
    <xreliquary:mob_charm:*>,
    <xreliquary:mob_charm_fragment:*>
] as IItemStack[];

for item in charmsToHide {
    recipes.remove(item);
    JEI.hide(item);
}

for i in 0 to 14 {
    recipes.remove(<xreliquary:mob_charm>.withTag({type: i as byte}));
    recipes.remove(<xreliquary:mob_charm_fragment>.definition.makeStack(i));
    JEI.hide(<xreliquary:mob_charm>.withTag({type: i as byte}));
    JEI.hide(<xreliquary:mob_charm_fragment>.definition.makeStack(i));
}


// ============================================================================
// 2. Thaumcraft Infusion Altar Recipes (12 Legendary Relics)
// ============================================================================

// 1. Witherless Rose
recipes.remove(<xreliquary:witherless_rose>);
Infusion.registerRecipe(
    "aq_witherless_rose",
    "WITHERLESS_ROSE",
    <xreliquary:witherless_rose>,
    4,
    [<aspect:victus> * 50, <aspect:herba> * 20, <aspect:auram> * 20],
    <minecraft:double_plant:4>,
    [
        <minecraft:nether_star>,
        <xreliquary:mob_ingredient:9>,
        <minecraft:nether_star>,
        <xreliquary:mob_ingredient:9>
    ]
);

// 2. Tome of Alkahestry
recipes.remove(<xreliquary:alkahestry_tome>);
Infusion.registerRecipe(
    "aq_alkahestry_tome",
    "ALKAHESTRY_TOME",
    <xreliquary:alkahestry_tome>,
    6,
    [<aspect:permutatio> * 50, <aspect:alkimia> * 30, <aspect:desiderium> * 30, <aspect:praecantatio> * 20],
    <minecraft:book>,
    [
        <thaumcraft:metal_alchemical>,
        <embers:isolated_materia>,
        <astralsorcery:itemcraftingcomponent:4>,
        <xreliquary:void_tear>,
        <minecraft:nether_star>,
        <botania:alchemycatalyst>
    ]
);

// 3. Void Tear
recipes.remove(<xreliquary:void_tear>);
Infusion.registerRecipe(
    "aq_void_tear",
    "VOID_TEAR",
    <xreliquary:void_tear>,
    3,
    [<aspect:vacuos> * 25, <aspect:alienis> * 20, <aspect:praecantatio> * 15],
    <minecraft:ghast_tear>,
    [
        <xreliquary:mob_ingredient:11>,
        <xreliquary:mob_ingredient:6>,
        <ore:gemLapis>,
        <minecraft:ender_pearl>
    ]
);

// 4. Twilight Cloak
recipes.remove(<xreliquary:twilight_cloak>);
Infusion.registerRecipe(
    "aq_twilight_cloak",
    "TWILIGHT_CLOAK",
    <xreliquary:twilight_cloak>,
    4,
    [<aspect:tenebrae> * 30, <aspect:sensus> * 30, <aspect:volatus> * 20],
    <thaumcraft:fabric>,
    [
        <xreliquary:mob_ingredient:15>,
        <bewitchment:pure_filament>,
        <embers:ashen_cloth>,
        <xreliquary:mob_ingredient:15>,
        <bewitchment:pure_filament>,
        <embers:ashen_cloth>
    ]
);

// 5. Infernal Claws
recipes.remove(<xreliquary:infernal_claws>);
Infusion.registerRecipe(
    "aq_infernal_claws",
    "INFERNAL_CLAWS",
    <xreliquary:infernal_claws>,
    2,
    [<aspect:ignis> * 35, <aspect:bestia> * 25],
    <embers:wildfire_core>,
    [
        <xreliquary:mob_ingredient:13>,
        <xreliquary:mob_ingredient:13>,
        <xreliquary:mob_ingredient:13>
    ]
);

// 6. Emperor's Chalice
recipes.remove(<xreliquary:emperor_chalice>);
Infusion.registerRecipe(
    "aq_emperor_chalice",
    "EMPEROR_CHALICE",
    <xreliquary:emperor_chalice>,
    4,
    [<aspect:aqua> * 40, <aspect:victus> * 30, <aspect:desiderium> * 20],
    <minecraft:water_bucket>,
    [
        <thaumicwonders:lethe_water>,
        <xreliquary:void_tear>,
        <botania:keepivy>,
        <thaumcraft:ingot:2>
    ]
);

// 7. Infernal Chalice
recipes.remove(<xreliquary:infernal_chalice>);
Infusion.registerRecipe(
    "aq_infernal_chalice",
    "INFERNAL_CHALICE",
    <xreliquary:infernal_chalice>,
    4,
    [<aspect:ignis> * 40, <aspect:diabolus> * 20, <aspect:praemunio> * 20],
    <minecraft:lava_bucket>,
    [
        <xreliquary:infernal_claws>,
        <xreliquary:infernal_tear>,
        <embers:ingot_dawnstone>,
        <bewitchment:fiery_unguent>
    ]
);

// 8. Lilypad of Fertility
recipes.remove(<xreliquary:fertile_lilypad>);
Infusion.registerRecipe(
    "aq_fertile_lilypad",
    "FERTILE_LILYPAD",
    <xreliquary:fertile_lilypad>,
    3,
    [<aspect:herba> * 40, <aspect:aqua> * 25],
    <minecraft:waterlily>,
    [
        <xreliquary:mob_ingredient:9>,
        <botania:fertilizer>,
        <minecraft:emerald>,
        <rustic:fertile_soil>,
        <xreliquary:mob_ingredient:9>,
        <botania:fertilizer>,
        <minecraft:emerald>,
        <rustic:fertile_soil>
    ]
);

// 9. Hero's Medallion
recipes.remove(<xreliquary:hero_medallion>);
Infusion.registerRecipe(
    "aq_hero_medallion",
    "HERO_MEDALLION",
    <xreliquary:hero_medallion>,
    4,
    [<aspect:cognitio> * 40, <aspect:humanus> * 20, <aspect:vacuos> * 20],
    <xreliquary:fortune_coin>,
    [
        <xreliquary:mob_ingredient:11>,
        <xreliquary:infernal_tear>,
        <astralsorcery:itemcraftingcomponent:4>,
        <botania:manatablet:*>
    ]
);

// 10. Magicbane
recipes.remove(<xreliquary:magicbane>);
Infusion.registerRecipe(
    "aq_magicbane",
    "MAGICBANE",
    <xreliquary:magicbane>,
    3,
    [<aspect:aversio> * 40, <aspect:praecantatio> * 35],
    <spartanweaponry:dagger_gold>,
    [
        <botania:manaresource:2>,
        <thaumcraft:ingot:0>,
        <thaumcraft:ingot:0>,
        <bewitchment:liquid_witchcraft>
    ]
);

// 11. Rod of Lyssa
recipes.remove(<xreliquary:rod_of_lyssa>);
Infusion.registerRecipe(
    "aq_rod_of_lyssa",
    "ROD_OF_LYSSA",
    <xreliquary:rod_of_lyssa>,
    4,
    [<aspect:vinculum> * 30, <aspect:motus> * 15, <aspect:desiderium> * 15],
    <minecraft:fishing_rod>,
    [
        <minecraft:gold_ingot>,
        <bewitchment:golden_thread>,
        <minecraft:gold_ingot>,
        <bewitchment:golden_thread>
    ]
);

// 12. Phoenix Down
recipes.remove(<xreliquary:phoenix_down>);
Infusion.registerRecipe(
    "aq_phoenix_down",
    "PHOENIX_DOWN",
    <xreliquary:phoenix_down>,
    3,
    [<aspect:victus> * 50, <aspect:auram> * 25, <aspect:spiritus> * 10],
    <xreliquary:angelic_feather>,
    [
        <xreliquary:angelheart_vial>,
        <rustic:elixir>.withTag({ElixirEffects: [{Effect: "minecraft:instant_health", Duration: 1, Amplifier: 0}]}),
        <botania:specialflower>.withTag({type: "fallenKanade"})
    ]
);


// ============================================================================
// 3. Thaumcraft Arcane Workbench Recipes (23 Utility & Staves)
// ============================================================================

// 1. Altar of Light
recipes.remove(<xreliquary:altar>);
ArcaneWorkbench.registerShapelessRecipe(
    "aq_altar_of_light",
    "ARTIFICE",
    25,
    [<aspect:ordo> * 2, <aspect:ignis> * 2],
    <xreliquary:altar>,
    [<minecraft:obsidian>, <minecraft:redstone_lamp>, <xreliquary:mob_ingredient:11>, <xreliquary:mob_ingredient:3>]
);

// 2. Interdiction Torch
recipes.remove(<xreliquary:interdiction_torch>);
ArcaneWorkbench.registerShapedRecipe(
    "aq_interdiction_torch",
    "ARTIFICE",
    15,
    [<aspect:ordo> * 1, <aspect:perditio> * 1],
    <xreliquary:interdiction_torch> * 4,
    [
        [<xreliquary:mob_ingredient:4>, <xreliquary:mob_ingredient:7>, null],
        [<xreliquary:mob_ingredient:11>, <minecraft:blaze_rod>, null],
        [null, null, null]
    ]
);

// 3. Wraith Node
recipes.remove(<xreliquary:wraith_node>);
ArcaneWorkbench.registerShapelessRecipe(
    "aq_wraith_node",
    "ARTIFICE",
    20,
    [<aspect:aer> * 2, <aspect:motus> * 2],
    <xreliquary:wraith_node>,
    [<xreliquary:mob_ingredient:11>, <minecraft:emerald>]
);

// 4. Cross of Mercy
recipes.remove(<xreliquary:mercy_cross>);
ArcaneWorkbench.registerShapedRecipe(
    "aq_mercy_cross",
    "ARTIFICE",
    20,
    [<aspect:victus> * 2, <aspect:ordo> * 2],
    <xreliquary:mercy_cross>,
    [
        [<xreliquary:mob_ingredient:1>, <minecraft:gold_ingot>, <xreliquary:mob_ingredient:10>],
        [<minecraft:gold_ingot>, <minecraft:leather>, <minecraft:gold_ingot>],
        [<minecraft:skull:1>, <minecraft:gold_ingot>, <xreliquary:mob_ingredient:0>]
    ]
);

// 5. Angelheart Vial
recipes.remove(<xreliquary:angelheart_vial>);
ArcaneWorkbench.registerShapedRecipe(
    "aq_angelheart_vial",
    "ARTIFICE",
    15,
    [<aspect:victus> * 2, <aspect:aqua> * 1],
    <xreliquary:angelheart_vial>,
    [
        [<minecraft:glass_pane>, <minecraft:milk_bucket>, <minecraft:glass_pane>],
        [<minecraft:glass_pane>, <xreliquary:mob_ingredient:13>, <minecraft:glass_pane>],
        [<xreliquary:mob_ingredient:9>, <minecraft:glass_pane>, <xreliquary:mob_ingredient:9>]
    ]
);

// 6. Angelic Feather
recipes.remove(<xreliquary:angelic_feather>);
ArcaneWorkbench.registerShapelessRecipe(
    "aq_angelic_feather",
    "ARTIFICE",
    15,
    [<aspect:volatus> * 2, <aspect:aer> * 1],
    <xreliquary:angelic_feather>,
    [<minecraft:feather>, <xreliquary:mob_ingredient:11>, <xreliquary:mob_ingredient:4>, <xreliquary:mob_ingredient:9>]
);

// 7. Destruction Catalyst
recipes.remove(<xreliquary:destruction_catalyst>);
ArcaneWorkbench.registerShapelessRecipe(
    "aq_destruction_catalyst",
    "ARTIFICE",
    25,
    [<aspect:perditio> * 3, <aspect:ignis> * 2],
    <xreliquary:destruction_catalyst>,
    [<minecraft:flint_and_steel>, <xreliquary:mob_ingredient:7>, <xreliquary:mob_ingredient:3>, <xreliquary:infernal_tear>]
);

// 8. Ender Staff
recipes.remove(<xreliquary:ender_staff>);
ArcaneWorkbench.registerShapedRecipe(
    "aq_ender_staff",
    "ARTIFICE",
    25,
    [<aspect:motus> * 3, <aspect:aer> * 2],
    <xreliquary:ender_staff>,
    [
        [null, <xreliquary:mob_ingredient:4>, <minecraft:ender_eye>],
        [<xreliquary:mob_ingredient:11>, <xreliquary:void_tear>, <xreliquary:mob_ingredient:4>],
        [<minecraft:stick>, <xreliquary:mob_ingredient:11>, null]
    ]
);

// 9. Coin of Fortune
recipes.remove(<xreliquary:fortune_coin>);
ArcaneWorkbench.registerShapelessRecipe(
    "aq_fortune_coin",
    "ARTIFICE",
    15,
    [<aspect:desiderium> * 2, <aspect:motus> * 1],
    <xreliquary:fortune_coin>,
    [<xreliquary:mob_ingredient:11>, <minecraft:gold_nugget>, <xreliquary:mob_ingredient:6>, <xreliquary:mob_ingredient:4>]
);

// 10. Glacial Staff
recipes.remove(<xreliquary:glacial_staff>);
ArcaneWorkbench.registerShapelessRecipe(
    "aq_glacial_staff",
    "ARTIFICE",
    30,
    [<aspect:gelum> * 3, <aspect:aqua> * 2],
    <xreliquary:glacial_staff>,
    [<xreliquary:ice_magus_rod>, <xreliquary:void_tear>, <xreliquary:mob_ingredient:8>, <xreliquary:shears_of_winter>]
);

// 11. Harvest Rod
recipes.remove(<xreliquary:harvest_rod>);
ArcaneWorkbench.registerShapedRecipe(
    "aq_harvest_rod",
    "ARTIFICE",
    20,
    [<aspect:herba> * 2, <aspect:terra> * 2],
    <xreliquary:harvest_rod>,
    [
        [null, <minecraft:double_plant:4>, <xreliquary:mob_ingredient:9>],
        [<minecraft:vine>, <xreliquary:void_tear>, <minecraft:double_plant:4>],
        [<minecraft:stick>, <minecraft:vine>, null]
    ]
);

// 12. Holy Hand Grenade
recipes.remove(<xreliquary:holy_hand_grenade>);
ArcaneWorkbench.registerShapelessRecipe(
    "aq_holy_hand_grenade",
    "ARTIFICE",
    10,
    [<aspect:ignis> * 1, <aspect:perditio> * 1],
    <xreliquary:holy_hand_grenade> * 4,
    [<xreliquary:glowing_water>, <minecraft:gold_nugget>, <minecraft:tnt>, <xreliquary:mob_ingredient:3>]
);

// 13. Ice Magus Rod
recipes.remove(<xreliquary:ice_magus_rod>);
ArcaneWorkbench.registerShapedRecipe(
    "aq_ice_magus_rod",
    "ARTIFICE",
    20,
    [<aspect:gelum> * 2, <aspect:aqua> * 2],
    <xreliquary:ice_magus_rod>,
    [
        [null, <minecraft:diamond>, <xreliquary:mob_ingredient:8>],
        [null, <xreliquary:void_tear>, <minecraft:diamond>],
        [<minecraft:iron_ingot>, null, null]
    ]
);

// 14. Infernal Tear
recipes.remove(<xreliquary:infernal_tear>);
ArcaneWorkbench.registerShapelessRecipe(
    "aq_infernal_tear",
    "ARTIFICE",
    25,
    [<aspect:ignis> * 3, <aspect:perditio> * 2],
    <xreliquary:infernal_tear>,
    [<xreliquary:void_tear>, <xreliquary:witch_hat>, <xreliquary:mob_ingredient:7>, <xreliquary:mob_ingredient:13>]
);

// 15. Kraken Shell
recipes.remove(<xreliquary:kraken_shell>);
ArcaneWorkbench.registerShapelessRecipe(
    "aq_kraken_shell",
    "ARTIFICE",
    20,
    [<aspect:aqua> * 2, <aspect:praecantatio> * 2],
    <xreliquary:kraken_shell>,
    [<xreliquary:mob_ingredient:14>, <xreliquary:mob_ingredient:14>, <xreliquary:mob_ingredient:14>, <xreliquary:mob_ingredient:11>]
);

// 16. Lantern of Paranoia
recipes.remove(<xreliquary:lantern_of_paranoia>);
ArcaneWorkbench.registerShapedRecipe(
    "aq_lantern_of_paranoia",
    "ARTIFICE",
    15,
    [<aspect:lux> * 2, <aspect:sensus> * 1],
    <xreliquary:lantern_of_paranoia>,
    [
        [<minecraft:iron_ingot>, <xreliquary:mob_ingredient:6>, <minecraft:iron_ingot>],
        [<minecraft:glass>, <xreliquary:mob_ingredient:7>, <minecraft:glass>],
        [null, <minecraft:iron_ingot>, null]
    ]
);

// 17. Touchstone of Midas
recipes.remove(<xreliquary:midas_touchstone>);
ArcaneWorkbench.registerShapelessRecipe(
    "aq_midas_touchstone",
    "ARTIFICE",
    35,
    [<aspect:metallum> * 4, <aspect:desiderium> * 3],
    <xreliquary:midas_touchstone>,
    [
        <minecraft:anvil>,
        <minecraft:gold_block>,
        <minecraft:gold_block>,
        <xreliquary:mob_ingredient:7>,
        <xreliquary:mob_ingredient:7>,
        <xreliquary:mob_ingredient:7>,
        <xreliquary:mob_ingredient:3>,
        <xreliquary:mob_ingredient:3>,
        <xreliquary:void_tear>
    ]
);

// 18. Pyromancer's Staff
recipes.remove(<xreliquary:pyromancer_staff>);
ArcaneWorkbench.registerShapelessRecipe(
    "aq_pyromancer_staff",
    "ARTIFICE",
    30,
    [<aspect:ignis> * 4, <aspect:potentia> * 2],
    <xreliquary:pyromancer_staff>,
    [<xreliquary:infernal_claws>, <minecraft:blaze_rod>, <xreliquary:infernal_tear>, <xreliquary:salamander_eye>]
);

// 19. Rending Gale
recipes.remove(<xreliquary:rending_gale>);
ArcaneWorkbench.registerShapedRecipe(
    "aq_rending_gale",
    "ARTIFICE",
    25,
    [<aspect:volatus> * 3, <aspect:aer> * 2],
    <xreliquary:rending_gale>,
    [
        [null, <xreliquary:mob_ingredient:4>, <xreliquary:mob_ingredient:5>],
        [<minecraft:gold_ingot>, <xreliquary:void_tear>, <xreliquary:mob_ingredient:4>],
        [<minecraft:stick>, <minecraft:gold_ingot>, null]
    ]
);

// 20. Salamander's Eye
recipes.remove(<xreliquary:salamander_eye>);
ArcaneWorkbench.registerShapelessRecipe(
    "aq_salamander_eye",
    "ARTIFICE",
    20,
    [<aspect:ignis> * 2, <aspect:gelum> * 2],
    <xreliquary:salamander_eye>,
    [<minecraft:ender_eye>, <xreliquary:mob_ingredient:7>, <xreliquary:mob_ingredient:8>, <xreliquary:mob_ingredient:11>]
);

// 21. Serpent Staff
recipes.remove(<xreliquary:serpent_staff>);
ArcaneWorkbench.registerShapedRecipe(
    "aq_serpent_staff",
    "ARTIFICE",
    20,
    [<aspect:aversio> * 2, <aspect:bestia> * 2],
    <xreliquary:serpent_staff>,
    [
        [null, <xreliquary:mob_ingredient:2>, <minecraft:ender_eye>],
        [null, <xreliquary:mob_ingredient:14>, <xreliquary:mob_ingredient:2>],
        [<minecraft:stick>, null, null]
    ]
);

// 22. Shears of Winter
recipes.remove(<xreliquary:shears_of_winter>);
ArcaneWorkbench.registerShapelessRecipe(
    "aq_shears_of_winter",
    "ARTIFICE",
    15,
    [<aspect:gelum> * 2, <aspect:fabrico> * 1],
    <xreliquary:shears_of_winter>,
    [<xreliquary:mob_ingredient:8>, <minecraft:shears>, <minecraft:diamond>, <minecraft:diamond>]
);

// 23. Sojourner's Staff
recipes.remove(<xreliquary:sojourner_staff>);
ArcaneWorkbench.registerShapelessRecipe(
    "aq_sojourner_staff",
    "ARTIFICE",
    25,
    [<aspect:lux> * 3, <aspect:motus> * 2],
    <xreliquary:sojourner_staff>,
    [<xreliquary:mob_ingredient:7>, <minecraft:gold_ingot>, <minecraft:blaze_rod>, <xreliquary:void_tear>]
);
