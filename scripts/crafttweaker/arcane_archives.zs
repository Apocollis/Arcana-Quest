#priority 70
import mods.thaumcraft.ArcaneWorkbench;

// Remove default crafting table recipe for Radiant Resonator
recipes.remove(<arcanearchives:radiant_resonator>);

// Add Arcane Workbench recipe gated behind ARTIFICE research
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
