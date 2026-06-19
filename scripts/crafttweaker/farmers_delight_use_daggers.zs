import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

// Define the Ore Dictionary entry
val knives = <ore:forgeKnives>;

// Add Spartan Weaponry Daggers to the 'forgeKnives' tag
// This loop dynamically finds all daggers to save you from writing them individually
for item in loadedMods["spartanweaponry"].items {
    if (item.name.contains("dagger")) {
        knives.add(item);
    }
}

// 1. Define the knife list from FDL (add any specific materials you have)
val fdlKnives = [
    <farmersdelight:flint_knife>,
    <farmersdelight:iron_knife>,
    <farmersdelight:golden_knife>,
    <farmersdelight:diamond_knife>
] as IItemStack[];

// 2. Remove the recipes and hide them from JEI
// for knife in fdlKnives {
    // recipes.remove(knife);
    // mods.jei.JEI.hide(knife);
// }

// 3. Optional: If you want to be extremely thorough and remove them from the 
// 'forge:knives' ore dictionary tag so nothing else tries to use them:
// <ore:forgeKnives>.remove(fdlKnives);

// This tells CraftTweaker: "Whenever a recipe asks for any knife, allow my daggers instead."
recipes.replaceAllOccurences(<ore:forgeKnives>, <ore:forgeDaggers>);