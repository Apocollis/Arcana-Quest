import crafttweaker.item.IItemStack;
import mods.jei.JEI;
import mods.metallurgyreforged.Alloyer;
import mods.metallurgyreforged.Crusher;

// --- List of Metallurgy metals to disable ---
val metalsToDisable = [
    "adamantine",
    "haderoth",
    "osmium",
    "krik",
    "lutetium",
    "inolashite",
    "alduorite",
    "carmot",
    "rubracium",
    "midasium",
    "oureclase",
    "angmallen",
    "hepatizon",
    "lemurite",
    "electrum",
    "etherium",
	"carmot"
] as string[];

val subItems = [
    "block", "engraved_block", "large_bricks", "bricks", "crystals", "hazard_block", "reinforced_glass",
    "ingot", "dust", "nugget", "axe", "hoe", "pickaxe", "shovel", "sword",
    "helmet", "chestplate", "leggings", "boots", "ore",
    "shield", "gauntlet", "knuckles"
] as string[];

for metal in metalsToDisable {
    for subItem in subItems {
        val itemId = "metallurgy:" + metal + "_" + subItem;
        val item = itemUtils.getItem(itemId);
        
        if (!isNull(item)) {
            // Remove standard crafting and furnace smelting recipes
            recipes.remove(item);
            furnace.remove(item);
            
            // Hide from JEI
            JEI.hide(item);
        }
    }
    
    // Specifically remove from Metallurgy Crusher/Alloyer registries
    val dust = itemUtils.getItem("metallurgy:" + metal + "_dust");
    val ingot = itemUtils.getItem("metallurgy:" + metal + "_ingot");
    
    if (!isNull(dust)) {
        Crusher.removeRecipe(dust);
    }
    if (!isNull(ingot)) {
        Alloyer.removeRecipe(ingot);
    }
}

// Astral Silver Ore cleanup (Hide ore from JEI, remove furnace smelting to ingot; keep dust & dust smelting intact)
val astralSilverOre = <metallurgy:astral_silver_ore>;
furnace.remove(<metallurgy:astral_silver_ingot>, astralSilverOre);
JEI.hide(astralSilverOre);

