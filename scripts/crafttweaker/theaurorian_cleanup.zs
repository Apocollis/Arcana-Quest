#priority 50
import crafttweaker.item.IItemStack;
import mods.jei.JEI;
import loottweaker.LootTweaker;
import loottweaker.LootTable;
import loottweaker.LootPool;

// ============================================================================
// THE AURORIAN: ULTRA-LEAN BLOAT PRUNING
// ============================================================================

// 1. Hide JEI recipe tabs for removed machines
JEI.hideCategory("theaurorian.moonlightforge");
JEI.hideCategory("theaurorian.scrapper");

// 2. Items to remove recipes and hide from JEI
static prunedItems as IItemStack[] = [
    // --- Isolated Machines & Scrap ---
    <theaurorian:moonlightforge>,
    <theaurorian:scrapper>,
    <theaurorian:scrapaurorianite>,
    <theaurorian:scrapcrystalline>,
    <theaurorian:scrapumbra>,

    // --- Silentwood Tool Clones (keeps silentwoodstick for portal ignition) ---
    <theaurorian:silentwoodsword>,
    <theaurorian:silentwoodpickaxe>,
    <theaurorian:silentwoodaxe>,
    <theaurorian:silentwoodshovel>,
    <theaurorian:silentwoodhoe>,
    <theaurorian:silentwoodbow>,
    <theaurorian:silentwoodsickle>,

    // --- Aurorian Stone Tool Clones ---
    <theaurorian:aurorianstonesword>,
    <theaurorian:aurorianstonepickaxe>,
    <theaurorian:aurorianstoneaxe>,
    <theaurorian:aurorianstoneshovel>,
    <theaurorian:aurorianstonehoe>,
    <theaurorian:aurorianstonesickle>,

    // --- Gimmick Tools & Armor ---
    <theaurorian:spikedchestplate>,
    <theaurorian:moonstonesickle>,

    // --- Foods, Drinks, Teas, Seeds & Agriculture ---
    <theaurorian:aurorianpork>,
    <theaurorian:aurorianporkcooked>,
    <theaurorian:aurorianbacon>,
    <theaurorian:lavenderbread>,
    <theaurorian:silkberryjam>,
    <theaurorian:silkberryjamsandwich>,
    <theaurorian:silkshroomstew>,
    <theaurorian:strangemeat>,
    <theaurorian:tealavender>,
    <theaurorian:teapetunia>,
    <theaurorian:teaseedy>,
    <theaurorian:teasilkberry>,
    <theaurorian:cup>,
    <theaurorian:bepsi>,
    <theaurorian:weepingwillowsap>,
    <theaurorian:plantfiber>,
    <theaurorian:lavenderseeds>
] as IItemStack[];

for item in prunedItems {
    recipes.remove(item);
    JEI.hide(item);
}

// Remove cooking recipe for Aurorian pork
furnace.remove(<theaurorian:aurorianporkcooked>);

// Remove and wildcard-hide Cerulean Bucket & filled variants
recipes.remove(<theaurorian:ceruleanbucket>);
JEI.hide(<theaurorian:ceruleanbucket>);
JEI.hide(<theaurorian:ceruleanbucket:*>);

// ============================================================================
// 3. SANITIZE AURORIAN DUNGEON, RUINS & URN LOOT TABLES
// ============================================================================

// --- Ruins ---
val ruins = LootTweaker.getTable("theaurorian:chests/ruins");
val ruinsMain = ruins.getPool("main");
ruinsMain.removeEntry("theaurorian:aurorianstonesword");
ruinsMain.removeEntry("theaurorian:silentwoodpickaxe");
ruinsMain.removeEntry("theaurorian:silkberryjam");

// --- Runestone Tower ---
val rstLow = LootTweaker.getTable("theaurorian:chests/runestonetowerlow");
rstLow.removePool("teas");
val rstLowFoods = rstLow.getPool("foods");
rstLowFoods.removeEntry("theaurorian:lavenderseeds");
val rstLowMat = rstLow.getPool("materials");
rstLowMat.removeEntry("theaurorian:plantfiber");
rstLowMat.removeEntry("theaurorian:scrapaurorianite");

val rstMed = LootTweaker.getTable("theaurorian:chests/runestonetowermed");
rstMed.removePool("teas");
rstMed.removePool("foods");
val rstMedMat = rstMed.getPool("materials");
rstMedMat.removeEntry("theaurorian:scrapaurorianite");

val rstHigh = LootTweaker.getTable("theaurorian:chests/runestonetowerhigh");
val rstHighTools = rstHigh.getPool("tools");
rstHighTools.removeEntry("theaurorian:strangemeat");
val rstHighRare = rstHigh.getPool("rare");
rstHighRare.removeEntry("theaurorian:bepsi");

// --- Darkstone Dungeon ---
val dsLow = LootTweaker.getTable("theaurorian:chests/darkstonelow");
dsLow.removePool("teas");
val dsLowFoods = dsLow.getPool("foods");
dsLowFoods.removeEntry("theaurorian:aurorianpork");
val dsLowUtils = dsLow.getPool("utils");
dsLowUtils.removeEntry("theaurorian:weepingwillowsap");
val dsLowMat = dsLow.getPool("materials");
dsLowMat.removeEntry("theaurorian:plantfiber");
dsLowMat.removeEntry("theaurorian:scrapumbra");

val dsMed = LootTweaker.getTable("theaurorian:chests/darkstonemed");
dsMed.removePool("teas");
dsMed.removePool("foods");
val dsMedUtils = dsMed.getPool("utils");
dsMedUtils.removeEntry("theaurorian:weepingwillowsap");
val dsMedMat = dsMed.getPool("materials");
dsMedMat.removeEntry("theaurorian:scrapumbra");
val dsMedTools = dsMed.getPool("tools");
dsMedTools.removeEntry("theaurorian:spikedchestplate");

val dsHigh = LootTweaker.getTable("theaurorian:chests/darkstonehigh");
val dsHighTools = dsHigh.getPool("tools");
dsHighTools.removeEntry("theaurorian:strangemeat");
dsHighTools.removeEntry("theaurorian:spikedchestplate");
val dsHighRare = dsHigh.getPool("rare");
dsHighRare.removeEntry("theaurorian:bepsi");
dsHighRare.removeEntry("theaurorian:silentwoodbow");

// --- Moon Temple ---
val mtLow = LootTweaker.getTable("theaurorian:chests/moontemplelow");
mtLow.removePool("teas");
mtLow.removePool("foods");
val mtLowMat = mtLow.getPool("materials");
mtLowMat.removeEntry("theaurorian:scrapcrystalline");
val mtLowTools = mtLow.getPool("tools");
mtLowTools.removeEntry("theaurorian:strangemeat");

val mtMed = LootTweaker.getTable("theaurorian:chests/moontemplemed");
mtMed.removePool("teas");
mtMed.removePool("foods");
val mtMedMat = mtMed.getPool("materials");
mtMedMat.removeEntry("theaurorian:scrapcrystalline");

val mtHigh = LootTweaker.getTable("theaurorian:chests/moontemplehigh");
val mtHighRare = mtHigh.getPool("rare");
mtHighRare.removeEntry("theaurorian:bepsi");

// --- Urns ---
val urn = LootTweaker.getTable("theaurorian:blocks/urn");
val urnMain = urn.getPool("main");
urnMain.removeEntry("theaurorian:silkberryjam");
