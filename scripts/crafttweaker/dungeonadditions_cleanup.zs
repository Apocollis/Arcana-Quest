#priority 50
import crafttweaker.item.IItemStack;
import loottweaker.LootTweaker;
import mods.jei.JEI;

// Dungeon Additions Cleanup: Remove/Hide Trader Coins, Trader Bag & Modern/Grief Trinkets

val daItemsToHide = [
    <da:copper_coin>,
    <da:silver_coin>,
    <da:golden_coin>,
    <da:trader_bag>,
    <da:pistol_trinket>,
    <da:confetti_trinket>,
    <da:flame_explosion_trinket>
] as IItemStack[];

for item in daItemsToHide {
    recipes.remove(item);
    JEI.hide(item);
}

// Remove from Dungeon Additions loot tables
val copperBag = LootTweaker.getTable("da:copper_loot_bag");
if (!isNull(copperBag)) {
    val pool = copperBag.getPool("da:copper_loot_bag");
    if (!isNull(pool)) {
        pool.removeEntry("da:confetti_trinket");
    }
}

val silverBag = LootTweaker.getTable("da:silver_loot_bag");
if (!isNull(silverBag)) {
    val pool = silverBag.getPool("da:silver_loot_bag");
    if (!isNull(pool)) {
        pool.removeEntry("da:confetti_trinket");
    }
}

val flameChests = LootTweaker.getTable("da:flame_arena_chests");
if (!isNull(flameChests)) {
    val pool = flameChests.getPool("da:flame_arena_chests");
    if (!isNull(pool)) {
        pool.removeEntry("da:flame_explosion_trinket");
    }
}

val flameChestsNC = LootTweaker.getTable("da:flame_arena_chests_nc");
if (!isNull(flameChestsNC)) {
    val pool = flameChestsNC.getPool("da:flame_arena_chests_nc");
    if (!isNull(pool)) {
        pool.removeEntry("da:flame_explosion_trinket");
    }
}
