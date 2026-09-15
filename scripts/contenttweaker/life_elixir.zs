#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.ItemFood;

var zsItem = VanillaFactory.createItemFood("life_elixir", 0);
zsItem.maxStackSize = 1;
zsItem.alwaysEdible = true;
zsItem.saturation = 0.0;
zsItem.itemUseAction = "DRINK"; 
zsItem.creativeTab = <creativetab:misc>;
zsItem.rarity = "epic";
zsItem.glowing = true;
zsItem.register();