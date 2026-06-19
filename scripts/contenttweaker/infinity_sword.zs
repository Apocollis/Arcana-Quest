#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;

var infinity_sword = VanillaFactory.createItem("infinity_sword");

infinity_sword.maxStackSize = 1;
infinity_sword.maxDamage = 6000; // Flawlessly handles your 6,000 durability
infinity_sword.creativeTab = <creativetab:combat>;
infinity_sword.rarity = "EPIC";

infinity_sword.register();