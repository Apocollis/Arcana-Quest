#priority 50
import crafttweaker.item.IItemStack;
import mods.jei.JEI;

// Dungeon Additions Cleanup: Remove/Hide Trader Coins & Trader Bag

val daItemsToHide = [
    <da:copper_coin>,
    <da:silver_coin>,
    <da:golden_coin>,
    <da:trader_bag>
] as IItemStack[];

for item in daItemsToHide {
    recipes.remove(item);
    JEI.hide(item);
}
