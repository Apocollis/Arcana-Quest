import loottweaker.LootTweaker;
import loottweaker.LootTable;
import loottweaker.LootPool;

// Add Terrestrial Artifact as rare stronghold library loot
val strongholdLibTable = LootTweaker.getTable("minecraft:chests/stronghold_library");
if (!isNull(strongholdLibTable)) {
    val strongholdLibPool = strongholdLibTable.getPool("main");
    if (!isNull(strongholdLibPool)) {
        strongholdLibPool.addItemEntry(<biomesoplenty:terrestrial_artifact>, 2, 0);
    }
}
