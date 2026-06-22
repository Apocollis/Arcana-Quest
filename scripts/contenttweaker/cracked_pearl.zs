#loader contenttweaker
import mods.contenttweaker.Commands;
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.IItemRightClick;
import mods.contenttweaker.ActionResult;
import mods.contenttweaker.MutableItemStack;

var zsItem = VanillaFactory.createItem("cracked_pearl");
zsItem.maxStackSize = 16;
zsItem.creativeTab = <creativetab:misc>;
zsItem.rarity = "uncommon";
zsItem.glowing = false;
zsItem.itemRightClick = function(stack, world, player, hand) {
	if(world.isRemote()) { return "PASS"; }
	else {
    Commands.call("particle portal ~ ~ ~ 1 1 1 0.1 150 force @s", player, world, false, true);
    Commands.call("spreadplayers 0 0 0 10000 false @s", player, world, false, true);
    Commands.call("playsound minecraft:block.glass.break master @s", player, world, false, true);
    Commands.call("playsound minecraft:block.portal.travel master @s", player, world, false, true);
    Commands.call("particle portal ~ ~ ~ 1 1 1 0.1 150 force @s", player, world, false, true);
	stack.shrink(1);
    return "SUCCESS";
	}
};
zsItem.register();