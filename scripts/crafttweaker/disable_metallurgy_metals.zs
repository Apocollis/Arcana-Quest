#priority 80
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import mods.jei.JEI;
import mods.metallurgyreforged.Alloyer;
import mods.metallurgyreforged.Crusher;
import mods.rustichromia.Quern;

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
    "etherium"
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

    // Hide Molten Fluids from JEI
    val moltenFluid = game.getLiquid("molten_" + metal);
    if (!isNull(moltenFluid)) {
        JEI.hide(moltenFluid);
    }
    val metalFluid = game.getLiquid(metal);
    if (!isNull(metalFluid)) {
        JEI.hide(metalFluid);
    }
}

// Astral Silver Ore / Raw Astral Silver Cleanup
val astralSilverOre = <metallurgy:astral_silver_ore>;
val astralSilverDust = <metallurgy:astral_silver_dust>;
val astralSilverIngot = <metallurgy:astral_silver_ingot>;

// Remove furnace smelting from Raw Astral Silver to Ingot
furnace.remove(astralSilverIngot, astralSilverOre);

// Hide Raw Astral Silver from JEI
JEI.hide(astralSilverOre);

// Remove Crusher recipe for Astral Silver Dust
Crusher.removeRecipe(astralSilverDust);

// Remove Quern milling recipes for Astral Silver Dust
Quern.remove("rustichromia:auto_astralsilver");
Quern.remove("rustichromia:auto_astral_silver");

// Remove Astral Silver Ore from ore dictionary to prevent dynamic grinder matching
<ore:oreAstralSilver>.remove(astralSilverOre);
