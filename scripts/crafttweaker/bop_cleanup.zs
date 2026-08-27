#priority 80
import crafttweaker.item.IItemStack;
import mods.jei.JEI;

// Remove and hide redundant BOP gems: Topaz (:0), Tanzanite (:1), Malachite (:2), Peridot (:5)
val disabledBopGems = [
    <biomesoplenty:gem:0>,       // Topaz
    <biomesoplenty:gem_block:0>,
    <biomesoplenty:gem:1>,       // Tanzanite
    <biomesoplenty:gem_block:1>,
    <biomesoplenty:gem:2>,       // Malachite
    <biomesoplenty:gem_block:2>,
    <biomesoplenty:gem:5>,       // Peridot
    <biomesoplenty:gem_block:5>
] as IItemStack[];

for item in disabledBopGems {
    recipes.remove(item);
    JEI.hide(item);
}

// Remove standard craft recipe for Terrestrial Artifact
recipes.remove(<biomesoplenty:terrestrial_artifact>);

// Remove and hide BOP Berry Bushes and Berries
val bopBerriesToHide = [
    <biomesoplenty:plant_0:5>, // Berry Bush
    <biomesoplenty:berries>     // BOP Berries
] as IItemStack[];

for item in bopBerriesToHide {
    recipes.remove(item);
    JEI.hide(item);
}

// Remove and hide BOP Biome Finder
recipes.remove(<biomesoplenty:biome_finder>);
JEI.hide(<biomesoplenty:biome_finder>);


