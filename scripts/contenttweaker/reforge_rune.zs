#loader contenttweaker
import mods.contenttweaker.VanillaFactory;

var reforgeRune = VanillaFactory.createItem("reforge_rune");
reforgeRune.maxStackSize = 64;
reforgeRune.creativeTab = <creativetab:misc>;
reforgeRune.rarity = "rare";
reforgeRune.register();
