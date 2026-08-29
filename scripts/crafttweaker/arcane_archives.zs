#priority 70
import mods.thaumcraft.ArcaneWorkbench;

// 1. Radiant Resonator
recipes.remove(<arcanearchives:radiant_resonator>);
ArcaneWorkbench.registerShapedRecipe(
    "aq_radiant_resonator",
    "ARTIFICE",
    25,
    [<aspect:ordo> * 5, <aspect:aer> * 5, <aspect:terra> * 5],
    <arcanearchives:radiant_resonator>,
    [
        [<thaumcraft:ingot:2>, <minecraft:iron_bars>, <thaumcraft:ingot:2>],
        [<thaumcraft:log_greatwood>, <astralsorcery:itemcraftingcomponent:4>, <thaumcraft:log_greatwood>],
        [<thaumcraft:log_greatwood>, null, <thaumcraft:log_greatwood>]
    ]
);

// 2. Radiant Crafting Table
recipes.remove(<arcanearchives:radiant_crafting_table>);
ArcaneWorkbench.registerShapelessRecipe(
    "aq_radiant_crafting_table",
    "ARTIFICE",
    4,
    [<aspect:ordo> * 1, <aspect:terra> * 1],
    <arcanearchives:radiant_crafting_table>,
    [<arcanearchives:raw_quartz>, <ore:workbench>]
);

// 3. Gem Cutting Table
recipes.remove(<arcanearchives:gemcutters_table>);
ArcaneWorkbench.registerShapedRecipe(
    "aq_gemcutters_table",
    "ARTIFICE",
    10,
    [<aspect:aer> * 5, <aspect:ignis> * 5, <aspect:aqua> * 5, <aspect:terra> * 5, <aspect:ordo> * 5, <aspect:perditio> * 5],
    <arcanearchives:gemcutters_table>,
    [
        [<astralsorcery:blockmachine:1>, <astralsorcery:itemcraftingcomponent:3>, <ore:paper>],
        [<thaumcraft:log_greatwood>, <arcanearchives:radiant_crafting_table>, <thaumcraft:log_greatwood>],
        [<arcanearchives:raw_quartz>, <thaumcraft:ingot:2>, <arcanearchives:raw_quartz>]
    ]
);

// 4. Radiant Chest
recipes.remove(<arcanearchives:radiant_chest>);
ArcaneWorkbench.registerShapelessRecipe(
    "aq_radiant_chest",
    "ARTIFICE",
    2,
    [<aspect:ordo> * 1, <aspect:perditio> * 1],
    <arcanearchives:radiant_chest>,
    [<arcanearchives:raw_quartz>, <ore:chestWood>]
);

// 5. Lectern Manifest
recipes.remove(<arcanearchives:lectern_manifest>);
ArcaneWorkbench.registerShapedRecipe(
    "aq_lectern_manifest",
    "ARTIFICE",
    5,
    [<aspect:terra> * 1, <aspect:ignis> * 1],
    <arcanearchives:lectern_manifest>,
    [
        [null, <arcanearchives:manifest>, null],
        [<thaumcraft:log_greatwood>, <thaumcraft:ingot:2>, <thaumcraft:log_greatwood>],
        [<thaumcraft:log_greatwood>, null, <thaumcraft:log_greatwood>]
    ]
);
