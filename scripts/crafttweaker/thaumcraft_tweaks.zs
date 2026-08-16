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
