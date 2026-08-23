#priority 50
import crafttweaker.item.IItemStack;
import mods.thaumcraft.ArcaneWorkbench;

// Thaumcraft Simple Mechanism Rebalance
// Requires Basic Artifice research, 10 Vis, 1 Ignis, 1 Aqua
recipes.remove(<thaumcraft:mechanism_simple>);
ArcaneWorkbench.registerShapedRecipe(
    "aq_mechanism_simple",
    "BASEARTIFICE",
    10,
    [<aspect:ignis> * 1, <aspect:aqua> * 1],
    <thaumcraft:mechanism_simple>,
    [
        [null, <thaumicperiphery:gear_brass>, null],
        [<mysticalmechanics:gear_iron>, <embers:plate_iron>, <mysticalmechanics:gear_iron>],
        [null, <thaumicperiphery:gear_brass>, null]
    ]
);

// Thaumcraft Complex Mechanism Rebalance
// Requires Basic Artifice research, 50 Vis, 1 Ignis, 1 Aqua
recipes.remove(<thaumcraft:mechanism_complex>);
ArcaneWorkbench.registerShapedRecipe(
    "aq_mechanism_complex",
    "BASEARTIFICE",
    50,
    [<aspect:ignis> * 1, <aspect:aqua> * 1],
    <thaumcraft:mechanism_complex>,
    [
        [null, <thaumcraft:mechanism_simple>, null],
        [<mystgears:gear_thaumium>, <embers:winding_gears>, <mystgears:gear_thaumium>],
        [null, <thaumcraft:mechanism_simple>, null]
    ]
);

// Glass Phial (Requires Botania Mana Glass)
recipes.remove(<thaumcraft:phial:0>);
recipes.addShaped("aq_glass_phial", <thaumcraft:phial:0> * 8, [
    [null, <minecraft:clay_ball>, null],
    [<botania:managlass>, null, <botania:managlass>],
    [null, <botania:managlass>, null]
]);

// Essentia Tube (Requires Alchemical Brass Ingots + Mana Glass)
// Research: TUBES, 5 Vis, 1 Aer, 1 Aqua
recipes.remove(<thaumcraft:tube:0>);
ArcaneWorkbench.registerShapedRecipe(
    "aq_essentia_tube",
    "TUBES",
    5,
    [<aspect:aer> * 1, <aspect:aqua> * 1],
    <thaumcraft:tube:0> * 8,
    [
        [null, null, null],
        [<thaumcraft:ingot:2>, <botania:managlass>, <thaumcraft:ingot:2>],
        [null, null, null]
    ]
);

// Glass Essentia Tube (Requires Vertical Mana Glass)
// Research: TUBES, 5 Vis, 1 Aer, 1 Aqua
recipes.remove(<thaumcraft:tube:4>);
ArcaneWorkbench.registerShapedRecipe(
    "aq_glass_essentia_tube",
    "TUBES",
    5,
    [<aspect:aer> * 1, <aspect:aqua> * 1],
    <thaumcraft:tube:4>,
    [
        [null, <botania:managlass>, null],
        [null, <thaumcraft:tube:0>, null],
        [null, <botania:managlass>, null]
    ]
);

// Warded Jar (Requires 3 Wood Slabs on Top + Mana Glass)
// Research: BASEALCHEMY, 5 Vis, 1 Aqua
recipes.remove(<thaumcraft:jar_normal:0>);
ArcaneWorkbench.registerShapedRecipe(
    "aq_warded_jar",
    "BASEALCHEMY",
    5,
    [<aspect:aqua> * 1],
    <thaumcraft:jar_normal:0>,
    [
        [<ore:slabWood>, <ore:slabWood>, <ore:slabWood>],
        [<botania:managlass>, null, <botania:managlass>],
        [<botania:managlass>, <botania:managlass>, <botania:managlass>]
    ]
);
