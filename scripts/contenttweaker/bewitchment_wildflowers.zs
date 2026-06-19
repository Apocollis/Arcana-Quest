#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;

val plants as string[] = [
    "wild_mandrake",
    "wild_belladonna",
    "wild_aconitum",
    "wild_garlic",
    "wild_hellebore",
    "wild_wormwood",
    "wild_white_sage"
];

for plant in plants {
    var b = VanillaFactory.createBlock(plant, <blockmaterial:plants>);
    b.setBlockHardness(0.0); // 0.0 = Instabreak like a flower
    b.setBlockSoundType(<soundtype:plant>);
    b.setFullBlock(false);
    b.setLightOpacity(0);
    b.setTranslucent(true);
    b.setBlockLayer("CUTOUT"); // Allows transparency in the texture
    
    // Core setting to turn off physical player and mob collision completely
    b.passable = true; 
    
    b.register();
}