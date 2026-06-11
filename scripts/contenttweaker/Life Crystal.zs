#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.IItemRightClick;
import mods.contenttweaker.Commands;

var zsItem = VanillaFactory.createItem("life_crystal");
zsItem.maxStackSize = 16;
zsItem.creativeTab = <creativetab:misc>;
zsItem.rarity = "epic";
zsItem.glowing = true;
zsItem.register();