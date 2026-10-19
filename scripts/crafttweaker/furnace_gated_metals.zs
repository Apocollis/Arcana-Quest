#priority 70
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;
import mods.embers.Melter;
import mods.embers.Stamper;

// ============================================================================
// TIERED METAL PROCESSING: REMOVE FURNACE RECIPES FOR NON-BASIC METALS
// Basic furnace is reserved for: Prometheum, Copper, Tin, Zinc, and Iron.
// All advanced, rare, and dimensional metals require an Embers Melter or
// Thaumcraft Infernal Furnace.
// ============================================================================

val gatedTooltip as string = "§6Requires an Embers Melter or Thaumcraft Infernal Furnace§r";

// ----------------------------------------------------------------------------
// 1. Metallurgy Gated Metals
// ----------------------------------------------------------------------------
val gatedMetallurgyMetals = [
    "silver",
    "platinum",
    "deep_iron",
    "shadow_iron",
    "ignatius",
    "vulcanite",
    "kalendrite",
    "mithril",
    "orichalcum",
    "sanguinite",
    "vyroxeres",
    "ceruclase",
    "atlarus",
    "manganese",
    "eximite",
    "meutoite"
] as string[];

for metal in gatedMetallurgyMetals {
    val ingot = itemUtils.getItem("metallurgy:" + metal + "_ingot");
    val ore = itemUtils.getItem("metallurgy:" + metal + "_ore");
    val dust = itemUtils.getItem("metallurgy:" + metal + "_dust");
    
    if (!isNull(ingot)) {
        if (!isNull(ore)) {
            furnace.remove(ingot, ore);
            ore.addTooltip(gatedTooltip);
        }
        if (!isNull(dust)) {
            furnace.remove(ingot, dust);
            dust.addTooltip(gatedTooltip);
        }
    }
}

// ----------------------------------------------------------------------------
// 2. Silver (handles Metallurgy, Embers, and OreDict variants)
// ----------------------------------------------------------------------------
val silverIngots = [<metallurgy:silver_ingot>, <embers:ingot_silver>] as IItemStack[];
for ingot in silverIngots {
    if (!isNull(ingot)) {
        for oreItem in <ore:oreSilver>.items {
            furnace.remove(ingot, oreItem);
        }
        for dustItem in <ore:dustSilver>.items {
            furnace.remove(ingot, dustItem);
        }
    }
}
for oreItem in <ore:oreSilver>.items {
    oreItem.addTooltip(gatedTooltip);
}
for dustItem in <ore:dustSilver>.items {
    dustItem.addTooltip(gatedTooltip);
}

// ----------------------------------------------------------------------------
// 3. Gold (Vanilla, Gravel Ores, Metallurgy dust, OreDict)
// ----------------------------------------------------------------------------
val goldIngot = <minecraft:gold_ingot>;
val goldOre = <minecraft:gold_ore>;
val goldGravelOre = <gravelores:gold_gravel_ore>;
val goldDust = <metallurgy:gold_dust>;

furnace.remove(goldIngot, goldOre);
goldOre.addTooltip(gatedTooltip);

if (!isNull(goldGravelOre)) {
    furnace.remove(goldIngot, goldGravelOre);
    goldGravelOre.addTooltip(gatedTooltip);
}

if (!isNull(goldDust)) {
    furnace.remove(goldIngot, goldDust);
    goldDust.addTooltip(gatedTooltip);
}

for oreItem in <ore:oreGold>.items {
    furnace.remove(goldIngot, oreItem);
}
for dustItem in <ore:dustGold>.items {
    furnace.remove(goldIngot, dustItem);
}

// ----------------------------------------------------------------------------
// 4. Dimensional Ores: The Aurorian (Moonstone & Cerulean)
// ----------------------------------------------------------------------------
val moonstoneOre = <theaurorian:moonstoneore>;
val moonstoneIngot = <theaurorian:moonstoneingot>;
val moonstoneNugget = <theaurorian:moonstonenugget>;
if (!isNull(moonstoneOre) && !isNull(moonstoneIngot)) {
    furnace.remove(moonstoneIngot, moonstoneOre);
    moonstoneOre.addTooltip(gatedTooltip);
    
    // Embers Melter & Stamper integration for Moonstone
    Melter.add(<liquid:tamoltenmoonstone> * 288, moonstoneOre);
    Melter.add(<liquid:tamoltenmoonstone> * 144, moonstoneIngot);
    if (!isNull(moonstoneNugget)) {
        Melter.add(<liquid:tamoltenmoonstone> * 16, moonstoneNugget);
        Stamper.add(moonstoneNugget, <liquid:tamoltenmoonstone> * 16, <soot:stamp_nugget>);
    }
    Stamper.add(moonstoneIngot, <liquid:tamoltenmoonstone> * 144, <embers:stamp_bar>);
}

val ceruleanOre = <theaurorian:ceruleanore>;
val ceruleanIngot = <theaurorian:ceruleaningot>;
val ceruleanNugget = <theaurorian:ceruleannugget>;
if (!isNull(ceruleanOre) && !isNull(ceruleanIngot)) {
    furnace.remove(ceruleanIngot, ceruleanOre);
    ceruleanOre.addTooltip(gatedTooltip);
    
    // Embers Melter & Stamper integration for Cerulean
    Melter.add(<liquid:tamoltencerulean> * 288, ceruleanOre);
    Melter.add(<liquid:tamoltencerulean> * 144, ceruleanIngot);
    if (!isNull(ceruleanNugget)) {
        Melter.add(<liquid:tamoltencerulean> * 16, ceruleanNugget);
        Stamper.add(ceruleanNugget, <liquid:tamoltencerulean> * 16, <soot:stamp_nugget>);
    }
    Stamper.add(ceruleanIngot, <liquid:tamoltencerulean> * 144, <embers:stamp_bar>);
}

// ----------------------------------------------------------------------------
// 5. Dimensional Ores: Astral Sorcery (Starmetal)
// ----------------------------------------------------------------------------
val starmetalOre = <astralsorcery:blockcustomore:1>;
val starmetalIngot = <astralsorcery:itemcraftingcomponent:1>;
if (!isNull(starmetalOre) && !isNull(starmetalIngot)) {
    furnace.remove(starmetalIngot, starmetalOre);
    starmetalOre.addTooltip(gatedTooltip);
}
