#priority 80
import crafttweaker.item.IItemStack;

// Remove and hide BOP redundant gems
val bopGems = [
    <biomesoplenty:gem:0>, // Topaz
    <biomesoplenty:gem:1>, // Tanzanite
    <biomesoplenty:gem:2>, // Malachite
    <biomesoplenty:gem:3>, // Sapphire
    <biomesoplenty:gem:4>, // Amber
    <biomesoplenty:gem:5>, // Peridot
    <biomesoplenty:gem:6>, // Ruby
    <biomesoplenty:gem_block:*>
] as IItemStack[];

for item in bopGems {
    recipes.remove(item);
    mods.jei.JEI.hide(item);
}

// Remove standard craft recipe for Terrestrial Artifact
recipes.remove(<biomesoplenty:terrestrial_artifact>);
