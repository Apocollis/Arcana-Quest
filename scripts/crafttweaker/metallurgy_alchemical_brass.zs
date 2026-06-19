import mods.thaumcraft.Crucible;

// 1. Remove the default output mapping entirely to prevent duplication
Crucible.removeRecipe(<thaumcraft:ingot:2>);

// 2. Register via the verified internal core alchemy key "BASEALCHEMY"
// Registry name "AlchemicalBrass" overwrites the original recipe entry cleanly
Crucible.registerRecipe(
    "AlchemicalBrass", 
    "BASEALCHEMY", 
    <thaumcraft:ingot:2>, 
    <metallurgy:brass_ingot>, 
    [<aspect:instrumentum> * 5]
);