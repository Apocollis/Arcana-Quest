#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.IItemRightClick;
import mods.contenttweaker.Commands;

var zsItem = VanillaFactory.createItem("arcane_blueprint");
zsItem.maxStackSize = 1;
zsItem.creativeTab = <creativetab:misc>;
zsItem.rarity = "epic";
zsItem.glowing = false;
zsItem.register();