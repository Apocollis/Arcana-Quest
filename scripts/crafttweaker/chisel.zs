
# CHISEL
print(<chisel:chisel_iron>.displayName);
<chisel:chisel_iron>.displayName = "Iron Block Chisel";
print(<chisel:chisel_diamond>.displayName);
<chisel:chisel_diamond>.displayName = "Diamond Block Chisel";
 
# STAINED PLANKS
recipes.remove(<quark:vertical_planks:*>);
recipes.remove(<quark:vertical_stained_planks:*>);
mods.chisel.Carving.addVariation("planks-oak", <quark:vertical_planks:0>);
mods.chisel.Carving.addVariation("planks-spruce", <quark:vertical_planks:1>);
mods.chisel.Carving.addVariation("planks-birch", <quark:vertical_planks:2>);
mods.chisel.Carving.addVariation("planks-jungle", <quark:vertical_planks:3>);
mods.chisel.Carving.addVariation("planks-acacia", <quark:vertical_planks:4>);
mods.chisel.Carving.addVariation("planks-dark-oak", <quark:vertical_planks:5>);

mods.chisel.Carving.addGroup("wood_white"); 
mods.chisel.Carving.addVariation("wood_white", <quark:stained_planks:0>);
mods.chisel.Carving.addVariation("wood_white", <quark:vertical_stained_planks:0>);
mods.chisel.Carving.addVariation("wood_white", <rustic:painted_wood_white>);
recipes.remove(<rustic:painted_wood_white>);

mods.chisel.Carving.addGroup("wood_orange"); 
mods.chisel.Carving.addVariation("wood_orange", <quark:stained_planks:1>);
mods.chisel.Carving.addVariation("wood_orange", <quark:vertical_stained_planks:1>);
mods.chisel.Carving.addVariation("wood_orange", <rustic:painted_wood_orange>);
recipes.remove(<rustic:painted_wood_orange>);

mods.chisel.Carving.addGroup("wood_magenta"); 
mods.chisel.Carving.addVariation("wood_magenta", <quark:stained_planks:2>);
mods.chisel.Carving.addVariation("wood_magenta", <quark:vertical_stained_planks:2>);
mods.chisel.Carving.addVariation("wood_magenta", <rustic:painted_wood_magenta>);
recipes.remove(<rustic:painted_wood_magenta>);

mods.chisel.Carving.addGroup("wood_light_blue"); 
mods.chisel.Carving.addVariation("wood_light_blue", <quark:stained_planks:3>);
mods.chisel.Carving.addVariation("wood_light_blue", <quark:vertical_stained_planks:3>);
mods.chisel.Carving.addVariation("wood_light_blue", <rustic:painted_wood_light_blue>);
recipes.remove(<rustic:painted_wood_light_blue>);

mods.chisel.Carving.addGroup("wood_yellow"); 
mods.chisel.Carving.addVariation("wood_yellow", <quark:stained_planks:4>);
mods.chisel.Carving.addVariation("wood_yellow", <quark:vertical_stained_planks:4>);
mods.chisel.Carving.addVariation("wood_yellow", <rustic:painted_wood_yellow>);
recipes.remove(<rustic:painted_wood_yellow>);

mods.chisel.Carving.addGroup("wood_lime"); 
mods.chisel.Carving.addVariation("wood_lime", <quark:stained_planks:5>);
mods.chisel.Carving.addVariation("wood_lime", <quark:vertical_stained_planks:5>);
mods.chisel.Carving.addVariation("wood_lime", <rustic:painted_wood_lime>);
recipes.remove(<rustic:painted_wood_lime>);

mods.chisel.Carving.addGroup("wood_pink"); 
mods.chisel.Carving.addVariation("wood_pink", <quark:stained_planks:6>);
mods.chisel.Carving.addVariation("wood_pink", <quark:vertical_stained_planks:6>);
mods.chisel.Carving.addVariation("wood_pink", <rustic:painted_wood_pink>);
recipes.remove(<rustic:painted_wood_pink>);

mods.chisel.Carving.addGroup("wood_gray"); 
mods.chisel.Carving.addVariation("wood_gray", <quark:stained_planks:7>);
mods.chisel.Carving.addVariation("wood_gray", <quark:vertical_stained_planks:7>);
mods.chisel.Carving.addVariation("wood_gray", <rustic:painted_wood_gray>);
recipes.remove(<rustic:painted_wood_gray>);

mods.chisel.Carving.addGroup("wood_silver"); 
mods.chisel.Carving.addVariation("wood_silver", <quark:stained_planks:8>);
mods.chisel.Carving.addVariation("wood_silver", <quark:vertical_stained_planks:8>);
mods.chisel.Carving.addVariation("wood_silver", <rustic:painted_wood_silver>);
recipes.remove(<rustic:painted_wood_silver>);

mods.chisel.Carving.addGroup("wood_cyan"); 
mods.chisel.Carving.addVariation("wood_cyan", <quark:stained_planks:9>);
mods.chisel.Carving.addVariation("wood_cyan", <quark:vertical_stained_planks:9>);
mods.chisel.Carving.addVariation("wood_cyan", <rustic:painted_wood_cyan>);
recipes.remove(<rustic:painted_wood_cyan>);

mods.chisel.Carving.addGroup("wood_purple"); 
mods.chisel.Carving.addVariation("wood_purple", <quark:stained_planks:10>);
mods.chisel.Carving.addVariation("wood_purple", <quark:vertical_stained_planks:10>);
mods.chisel.Carving.addVariation("wood_purple", <rustic:painted_wood_purple>);
recipes.remove(<rustic:painted_wood_purple>);

mods.chisel.Carving.addGroup("wood_blue"); 
mods.chisel.Carving.addVariation("wood_blue", <quark:stained_planks:11>);
mods.chisel.Carving.addVariation("wood_blue", <quark:vertical_stained_planks:11>);
mods.chisel.Carving.addVariation("wood_blue", <rustic:painted_wood_blue>);
recipes.remove(<rustic:painted_wood_blue>);

mods.chisel.Carving.addGroup("wood_brown"); 
mods.chisel.Carving.addVariation("wood_brown", <quark:stained_planks:12>);
mods.chisel.Carving.addVariation("wood_brown", <quark:vertical_stained_planks:12>);
mods.chisel.Carving.addVariation("wood_brown", <rustic:painted_wood_brown>);
recipes.remove(<rustic:painted_wood_brown>);

mods.chisel.Carving.addGroup("wood_green"); 
mods.chisel.Carving.addVariation("wood_green", <quark:stained_planks:13>);
mods.chisel.Carving.addVariation("wood_green", <quark:vertical_stained_planks:13>);
mods.chisel.Carving.addVariation("wood_green", <rustic:painted_wood_green>);
recipes.remove(<rustic:painted_wood_green>);

mods.chisel.Carving.addGroup("wood_red"); 
mods.chisel.Carving.addVariation("wood_red", <quark:stained_planks:14>);
mods.chisel.Carving.addVariation("wood_red", <quark:vertical_stained_planks:14>);
mods.chisel.Carving.addVariation("wood_red", <rustic:painted_wood_red>);
recipes.remove(<rustic:painted_wood_red>);

mods.chisel.Carving.addGroup("wood_black"); 
mods.chisel.Carving.addVariation("wood_black", <quark:stained_planks:15>);
mods.chisel.Carving.addVariation("wood_black", <quark:vertical_stained_planks:15>);
mods.chisel.Carving.addVariation("wood_black", <rustic:painted_wood_black>);
recipes.remove(<rustic:painted_wood_black>);

# AMETHYST
mods.chisel.Carving.addGroup("amethyst_block"); 
mods.chisel.Carving.addVariation("amethyst_block", <mysticalworld:amethyst_block>);
mods.chisel.Carving.addVariation("amethyst_block", <netherex:amethyst_block>);
recipes.remove(<netherex:amethyst_block>);

# BASALT
mods.chisel.Carving.addVariation("basalt", <netherex:basalt:0>);
mods.chisel.Carving.addVariation("basalt", <netherex:basalt:1>);
mods.chisel.Carving.addVariation("basalt", <netherex:basalt:2>);
mods.chisel.Carving.addVariation("basalt", <netherex:basalt:3>);
mods.chisel.Carving.addVariation("basalt", <quark:basalt:0>);
mods.chisel.Carving.addVariation("basalt", <quark:basalt:1>);
mods.chisel.Carving.addVariation("basalt", <quark:world_stone_bricks:3>);
mods.chisel.Carving.addVariation("basalt", <quark:world_stone_pavement:3>);

recipes.removeByRecipeName("cathedral:basalt_block_checkeredb");
recipes.removeByRecipeName("cathedral:basalt_block_checkereda");
recipes.removeByRecipeName("cathedral:dwemer_stone");

recipes.addShaped(<cathedral:dwemer_block_carved>*16,
 [[<ore:stoneBasalt>, <ore:stoneBasalt>, <ore:stoneBasalt>],
  [<ore:stoneBasalt>, <ore:ingotDawnstone>, <ore:stoneBasalt>],
  [<ore:stoneBasalt>, <ore:stoneBasalt>, <ore:stoneBasalt>]]);
  
recipes.addShaped(<cathedral:dwemer_block_carved>*16,
 [[<ore:slate>, <ore:slate>, <ore:slate>],
  [<ore:slate>, <ore:ingotDawnstone>, <ore:slate>],
  [<ore:slate>, <ore:slate>, <ore:slate>]]);
  
mods.chisel.Carving.addVariation("stonebrick", <rustic:stone_pillar>);
recipes.remove(<rustic:stone_pillar>);
recipes.addShapedMirrored(<rustic:stone_pillar>*2,
 [[<ore:stone>],
  [<ore:stone>]]);
  
mods.chisel.Carving.addVariation("andesite", <rustic:andesite_pillar>);
recipes.remove(<rustic:andesite_pillar>);
recipes.addShapedMirrored(<rustic:andesite_pillar>*2,
 [[<ore:stoneAndesite>],
  [<ore:stoneAndesite>]]);
  
mods.chisel.Carving.addVariation("diorite", <rustic:diorite_pillar>);
recipes.remove(<rustic:diorite_pillar>);
recipes.addShapedMirrored(<rustic:diorite_pillar>*2,
 [[<ore:stoneDiorite>],
  [<ore:stoneDiorite>]]);
  
mods.chisel.Carving.addVariation("granite", <rustic:granite_pillar>);
recipes.remove(<rustic:granite_pillar>);
recipes.addShapedMirrored(<rustic:granite_pillar>*2,
 [[<ore:stoneGranite>],
  [<ore:stoneGranite>]]);
  
mods.chisel.Carving.addGroup("black_slate"); 
mods.chisel.Carving.addVariation("black_slate", <rustic:slate_pillar>);
mods.chisel.Carving.addVariation("black_slate", <rustic:slate>);
mods.chisel.Carving.addVariation("black_slate", <rustic:slate_roof>);
mods.chisel.Carving.addVariation("black_slate", <rustic:slate_tile>);
mods.chisel.Carving.addVariation("black_slate", <rustic:slate_brick>);
mods.chisel.Carving.addVariation("black_slate", <rustic:slate_chiseled>);
recipes.remove(<rustic:slate_pillar>);
recipes.addShapedMirrored(<rustic:slate_pillar>*2,
 [[<ore:slate>],
  [<ore:slate>]]);

mods.chisel.Carving.addGroup("green_slate"); 
mods.chisel.Carving.addVariation("green_slate", <earthworks:block_slate_green>);
mods.chisel.Carving.addVariation("green_slate", <earthworks:block_slate_slab_green>);
mods.chisel.Carving.addVariation("green_slate", <earthworks:block_slate_shingle_verte>);
mods.chisel.Carving.addVariation("green_slate", <earthworks:block_slate_tile_verte>);

mods.chisel.Carving.addGroup("blue_slate"); 
mods.chisel.Carving.addVariation("blue_slate", <earthworks:block_slate>);
mods.chisel.Carving.addVariation("blue_slate", <earthworks:block_slate_slab>);
mods.chisel.Carving.addVariation("blue_slate", <earthworks:block_slate_shingle>);
mods.chisel.Carving.addVariation("blue_slate", <earthworks:block_slate_tile>);

mods.chisel.Carving.addGroup("purple_slate"); 
mods.chisel.Carving.addVariation("purple_slate", <earthworks:block_slate_purple>);
mods.chisel.Carving.addVariation("purple_slate", <earthworks:block_slate_slab_purple>);
mods.chisel.Carving.addVariation("purple_slate", <earthworks:block_slate_shingle_purple>);
mods.chisel.Carving.addVariation("purple_slate", <earthworks:block_slate_tile_purple>);

recipes.remove(<cathedral:cathedral_pillar_various:0>);
recipes.addShapedMirrored(<cathedral:cathedral_pillar_various:0>*8,
 [[<ore:stone>, <ore:stone>],
  [<ore:stone>, <ore:stone>],
  [<ore:stone>, <ore:stone>]]);
  
recipes.remove(<cathedral:cathedral_pillar_various:1>);
recipes.addShapedMirrored(<cathedral:cathedral_pillar_various:1>*8,
 [[<minecraft:sandstone>, <minecraft:sandstone>],
  [<minecraft:sandstone>, <minecraft:sandstone>],
  [<minecraft:sandstone>, <minecraft:sandstone>]]);
  
recipes.remove(<cathedral:cathedral_pillar_various:2>);
recipes.addShapedMirrored(<cathedral:cathedral_pillar_various:2>*8,
 [[<minecraft:red_sandstone>, <minecraft:red_sandstone>],
  [<minecraft:red_sandstone>, <minecraft:red_sandstone>],
  [<minecraft:red_sandstone>, <minecraft:red_sandstone>]]);
  
recipes.remove(<cathedral:cathedral_pillar_various:3>);
recipes.addShapedMirrored(<cathedral:cathedral_pillar_various:3>*8,
 [[<ore:obsidian>, <ore:obsidian>],
  [<ore:obsidian>, <ore:obsidian>],
  [<ore:obsidian>, <ore:obsidian>]]);
  
recipes.remove(<cathedral:cathedral_pillar_various:4>);
recipes.addShapedMirrored(<cathedral:cathedral_pillar_various:4>*8,
 [[<minecraft:nether_brick>, <minecraft:nether_brick>],
  [<minecraft:nether_brick>, <minecraft:nether_brick>],
  [<minecraft:nether_brick>, <minecraft:nether_brick>]]);
  
recipes.remove(<cathedral:cathedral_pillar_various:5>);
recipes.addShapedMirrored(<cathedral:cathedral_pillar_various:5>*8,
 [[<ore:blockQuartz>, <ore:blockQuartz>],
  [<ore:blockQuartz>, <ore:blockQuartz>],
  [<ore:blockQuartz>, <ore:blockQuartz>]]);
  
recipes.remove(<cathedral:cathedral_pillar_various:6>);
recipes.addShapedMirrored(<cathedral:cathedral_pillar_various:6>*8,
 [[<ore:endstone>, <ore:endstone>],
  [<ore:endstone>, <ore:endstone>],
  [<ore:endstone>, <ore:endstone>]]);
  
recipes.remove(<cathedral:cathedral_pillar_various:7>);
recipes.addShapedMirrored(<cathedral:cathedral_pillar_various:7>*8,
 [[<minecraft:packed_ice>, <minecraft:packed_ice>],
  [<minecraft:packed_ice>, <minecraft:packed_ice>],
  [<minecraft:packed_ice>, <minecraft:packed_ice>]]);
  
recipes.remove(<cathedral:cathedral_pillar_various:8>);
recipes.addShapedMirrored(<cathedral:cathedral_pillar_various:8>*8,
 [[<minecraft:snow>, <minecraft:snow>],
  [<minecraft:snow>, <minecraft:snow>],
  [<minecraft:snow>, <minecraft:snow>]]);
  
recipes.remove(<cathedral:cathedral_pillar_various:9>);
recipes.addShapedMirrored(<cathedral:cathedral_pillar_various:9>*8,
 [[<ore:stoneMarble>, <ore:stoneMarble>],
  [<ore:stoneMarble>, <ore:stoneMarble>],
  [<ore:stoneMarble>, <ore:stoneMarble>]]);
  
recipes.remove(<cathedral:cathedral_pillar_various:10>);
recipes.addShapedMirrored(<cathedral:cathedral_pillar_various:10>*8,
 [[<ore:stoneLimestone>, <ore:stoneLimestone>],
  [<ore:stoneLimestone>, <ore:stoneLimestone>],
  [<ore:stoneLimestone>, <ore:stoneLimestone>]]);
  
recipes.remove(<cathedral:cathedral_pillar_various:11>);
recipes.addShapedMirrored(<cathedral:cathedral_pillar_various:11>*8,
 [[<ore:stoneBasalt>, <ore:stoneBasalt>],
  [<ore:stoneBasalt>, <ore:stoneBasalt>],
  [<ore:stoneBasalt>, <ore:stoneBasalt>]]);
  
recipes.remove(<cathedral:cathedral_pillar_various:12>);
recipes.addShapedMirrored(<cathedral:cathedral_pillar_various:12>*8,
 [[<cathedral:dwemer_block_carved>, <cathedral:dwemer_block_carved>],
  [<cathedral:dwemer_block_carved>, <cathedral:dwemer_block_carved>],
  [<cathedral:dwemer_block_carved>, <cathedral:dwemer_block_carved>]]);
