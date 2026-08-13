#priority 50
import crafttweaker.item.IItemStack;
import mods.jei.JEI;

// Simple Difficulty Cleanup: Remove Ice Armor & Chunks (Replaced by Atum Wanderer Armor & Potions/Elixirs)

val sdItemsToHide = [
    <simpledifficulty:ice_helmet>,
    <simpledifficulty:ice_chestplate>,
    <simpledifficulty:ice_leggings>,
    <simpledifficulty:ice_boots>,
    <simpledifficulty:ice_chunk>,
    <simpledifficulty:magma_chunk>
] as IItemStack[];

for item in sdItemsToHide {
    recipes.remove(item);
    JEI.hide(item);
}
