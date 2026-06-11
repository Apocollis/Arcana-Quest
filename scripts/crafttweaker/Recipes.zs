import crafttweaker.item.IItemCondition;
import crafttweaker.item.IItemTransformer;
import crafttweaker.item.IItemStack;

#VANILLA
recipes.remove(<minecraft:mossy_cobblestone>);
recipes.addShapeless(<minecraft:mossy_cobblestone>,
 [<minecraft:cobblestone>, <minecraft:vine>]);

#CERAMICS
recipes.remove(<ceramics:unfired_clay:0>);
recipes.addShaped(<ceramics:unfired_clay:0> * 2,[[<ore:itemClay>, null, <ore:itemClay>],[<ore:itemClay>, <ore:itemClay>, <ore:itemClay>]]);

#GOG
recipes.addShapeless(<grimoireofgaia:food_monster_feed_premium>, [<grimoireofgaia:food_monster_feed>,<minecraft:golden_apple>,<grimoireofgaia:food_meat>]);

# Waystones
recipes.remove(<waystones:warp_stone>);
recipes.addShaped(<waystones:warp_stone>,
 [[<quark:biotite>, <xreliquary:mob_ingredient:11>, <quark:biotite>],
  [<xreliquary:mob_ingredient:11>, <minecraft:diamond>, <xreliquary:mob_ingredient:11>],
  [<quark:biotite>, <xreliquary:mob_ingredient:11>, <quark:biotite>]]);

recipes.remove(<waystones:waystone>);
recipes.addShaped(<waystones:waystone>,
 [[null, <ore:bricksStone>, null],
  [<ore:bricksStone>, <minecraft:ender_pearl>, <ore:bricksStone>],
  [<ore:bricksStone>, <minecraft:diamond>, <ore:bricksStone>]]);

recipes.remove(<waystones:return_scroll>);
recipes.addShaped(<waystones:return_scroll>*3,
 [[null, <minecraft:stick>, null],
  [<minecraft:paper>, <minecraft:ender_pearl>, <minecraft:paper>],
  [null, <minecraft:stick>, null]]);
  
recipes.remove(<waystones:warp_scroll>);
recipes.addShaped(<waystones:warp_scroll>*3,
 [[<minecraft:gold_nugget>, <minecraft:stick>, <minecraft:gold_nugget>],
  [<minecraft:paper>, <minecraft:ender_pearl>, <minecraft:paper>],
  [<minecraft:gold_nugget>, <minecraft:stick>, <minecraft:gold_nugget>]]);

# BENEATH

recipes.addShaped(<beneath:teleporterbeneath>,
 [[<minecraft:cobblestone>, <minecraft:obsidian>, <minecraft:cobblestone>],
  [<minecraft:obsidian>, <minecraft:diamond>, <minecraft:obsidian>],
  [<minecraft:cobblestone>, <minecraft:obsidian>, <minecraft:cobblestone>]]);

# SOPHISTICATED WOLVES

recipes.remove(<sophisticatedwolves:swdogtreat>);
recipes.addShaped(<sophisticatedwolves:swdogtreat>,
 [[<ore:listAllgrain>, <ore:listAllmeatraw>, <ore:listAllgrain>]]);
recipes.addShaped(<sophisticatedwolves:swdogtreat>*2,
 [[<ore:listAllgrain>, <ore:listAllmeatcooked>, <ore:listAllgrain>]]);
 
# EVERLASTING ABILITIES

recipes.remove(<everlastingabilities:ability_bottle>);

recipes.addShaped(<everlastingabilities:ability_bottle>,
 [[null, <minecraft:slime_ball>, null],
  [<minecraft:quartz>, <minecraft:glass_bottle>, <minecraft:quartz>],
  [<minecraft:gold_nugget>, <minecraft:gold_ingot>, <minecraft:gold_nugget>]]);
  
  
# WITHER SKELE TWEAKS

recipes.remove(<witherskelefix:blade>);
recipes.remove(<witherskelefix:blade2>);
	
	
# ENDER COMPASS

recipes.remove(<endercompass:ender_compass>);
recipes.addShaped(<endercompass:ender_compass>,
 [[<minecraft:ender_eye>, <quark:biotite>, <minecraft:ender_eye>],
  [<quark:biotite>, <minecraft:compass>, <quark:biotite>],
  [<minecraft:ender_eye>, <quark:biotite>, <minecraft:ender_eye>]]);
  
  
# EFFORTLESS BUILDING

recipes.remove(<effortlessbuilding:reach_upgrade1>);
recipes.addShaped(<effortlessbuilding:reach_upgrade1>,
 [[<ore:gemEmerald>, <minecraft:obsidian>, <ore:gemEmerald>],
  [<minecraft:obsidian>, <ore:cobblestone>, <minecraft:obsidian>],
  [<ore:gemEmerald>, <minecraft:obsidian>, <ore:gemEmerald>]]);
  
recipes.remove(<effortlessbuilding:reach_upgrade2>);
recipes.addShaped(<effortlessbuilding:reach_upgrade2>,
 [[<ore:gemDiamond>, <minecraft:obsidian>, <ore:gemDiamond>],
  [<minecraft:obsidian>, <effortlessbuilding:reach_upgrade1>, <minecraft:obsidian>],
  [<ore:gemDiamond>, <minecraft:obsidian>, <ore:gemDiamond>]]);
  
recipes.remove(<effortlessbuilding:reach_upgrade3>);
recipes.addShaped(<effortlessbuilding:reach_upgrade3>,
 [[<ore:gemAmethyst>, <minecraft:obsidian>, <ore:gemAmethyst>],
  [<minecraft:obsidian>, <effortlessbuilding:reach_upgrade2>, <minecraft:obsidian>],
  [<ore:gemAmethyst>, <minecraft:obsidian>, <ore:gemAmethyst>]]);

  
# ANTIQUE ATLAS
 
recipes.addShapeless(<antiqueatlas:antique_atlas:0>,
 [<antiqueatlas:antique_atlas:*>, <minecraft:dye:0>]);
 
recipes.addShapeless(<antiqueatlas:antique_atlas:0>,
 [<antiqueatlas:empty_antique_atlas>, <minecraft:dye:0>]);
 
recipes.addShapeless(<antiqueatlas:empty_antique_atlas>,
 [<antiqueatlas:antique_atlas>, <minecraft:dye:15>]); 
 
recipes.addShapeless(<antiqueatlas:empty_antique_atlas>,
 [<antiqueatlas:antique_atlas:*>, <minecraft:dye:15>]);
  
# CHISELS N BITS

print(<chiselsandbits:chisel_stone>.displayName);
<chiselsandbits:chisel_stone>.displayName = "Stone Bit Chisel";
print(<chiselsandbits:chisel_iron>.displayName);
<chiselsandbits:chisel_iron>.displayName = "Iron Bit Chisel";
print(<chiselsandbits:chisel_gold>.displayName);
<chiselsandbits:chisel_gold>.displayName = "Gold Bit Chisel";
print(<chiselsandbits:chisel_diamond>.displayName);
<chiselsandbits:chisel_diamond>.displayName = "Diamond Bit Chisel";

 
# EARTHWORKS

recipes.remove(<earthworks:tool_wood_hammer>);
recipes.remove(<earthworks:tool_stone_hammer>);
recipes.remove(<earthworks:tool_iron_hammer>);
recipes.remove(<earthworks:tool_gold_hammer>);
recipes.remove(<earthworks:tool_diamond_hammer>);

# UNCRAFTING TABLE

recipes.remove(<uncraftingtable:uncrafting_table>);
recipes.addShaped(<uncraftingtable:uncrafting_table>,
 [[<minecraft:cobblestone>, <minecraft:diamond>, <minecraft:cobblestone>],
  [<minecraft:cobblestone>, <minecraft:crafting_table>, <minecraft:cobblestone>],
  [<minecraft:cobblestone>, <minecraft:cobblestone>, <minecraft:cobblestone>]]);

# INSPIRATIONS
  
recipes.remove(<inspirations:materials:8>);
recipes.remove(<inspirations:stone_crook>);
  
# FARMING FOR BLOCKHEADS

recipes.remove(<farmingforblockheads:fertilizer:*>);

recipes.addShapeless(<farmingforblockheads:fertilizer:0>,
 [<minecraft:dirt>, <ore:dyeRed>, <ore:bonemeal>, <ore:bonemeal>]);
 
recipes.addShapeless(<farmingforblockheads:fertilizer:1>,
 [<minecraft:dirt>, <ore:dyeGreen>, <ore:bonemeal>, <ore:bonemeal>]);
 
recipes.addShapeless(<farmingforblockheads:fertilizer:2>,
 [<minecraft:dirt>, <ore:dyeYellow>, <ore:bonemeal>, <ore:bonemeal>]);
 
# NETHER EX

val orelistAllmushroom = <ore:listAllmushroom>;
orelistAllmushroom.add(<netherex:red_elder_mushroom>);
orelistAllmushroom.add(<netherex:brown_elder_mushroom>);

val oremushroomAny = <ore:mushroomAny>;
oremushroomAny.add(<netherex:red_elder_mushroom>);
oremushroomAny.add(<netherex:brown_elder_mushroom>);

recipes.addShapeless(<minecraft:ghast_tear> * 12,
 [<netherex:ghast_queen_tear>]);
 
 # SIMPLE DIFFICULTY
 
 
 
 # RELIQUARY

recipes.remove(<xreliquary:gun_part:0>);
recipes.remove(<xreliquary:gun_part:1>);
recipes.remove(<xreliquary:gun_part:2>);

recipes.remove(<xreliquary:glowing_bread>);
recipes.addShapeless(<xreliquary:glowing_bread>,
 [<minecraft:bread>, <xreliquary:glowing_water>, <xreliquary:glowing_water>]);

recipes.addShaped(<xreliquary:angelheart_vial>,
 [[<minecraft:glass_pane>, null, <minecraft:glass_pane>],
  [<minecraft:glass_pane>, <contenttweaker:life_crystal>, <minecraft:glass_pane>],
  [null, <minecraft:glass_pane>, null]]);
  
print(<xreliquary:mob_ingredient:5>.displayName);
<xreliquary:mob_ingredient:5>.displayName = "Leathery Wing";

print(<xreliquary:pedestal>.displayName);
<xreliquary:pedestal>.displayName = "Magic Pedestal";

print(<xreliquary:pedestal_passive>.displayName);
<xreliquary:pedestal_passive>.displayName = "Pedestal";

#DIVERGENT UNDERGROUND

val IronChisel = <chisel:chisel_iron>;
val DiamondChisel = <chisel:chisel_diamond>;
val rawDiamond = <divergentunderground:gem_raw_diamond>;
val rawEmerald = <divergentunderground:gem_raw_emerald>;
val nuggetDiamond = <uncraftingtable:nugget>;
val nuggetEmerald = <uncraftingtable:nugget:1>;

recipes.remove(<divergentunderground:chisel>);
recipes.addShapeless("diamondcutting1",<minecraft:diamond>,
	[IronChisel.anyDamage().transformDamage(5).reuse(),rawDiamond],
	function(out, ins, cInfo){
		return out;
	},
	function(out,cInfo,player){
		player.xp += 1;
		player.give(nuggetDiamond);
	}
);
recipes.addShapeless("diamondcutting2",<minecraft:diamond>,
	[DiamondChisel.anyDamage().transformDamage(5).reuse(),rawDiamond],
	function(out, ins, cInfo){
		return out;
	},
	function(out,cInfo,player){
		player.xp += 1;
		player.give(nuggetDiamond);
	}
);
recipes.addShapeless("emeraldcutting1",<minecraft:emerald>,
	[IronChisel.anyDamage().transformDamage(5).reuse(),rawEmerald],
	function(out, ins, cInfo){
		return out;
	},
	function(out,cInfo,player){
		player.xp += 1;
		player.give(nuggetEmerald);
	}
);
recipes.addShapeless("emeraldcutting2",<minecraft:emerald>,
	[DiamondChisel.anyDamage().transformDamage(5).reuse(),rawEmerald],
	function(out, ins, cInfo){
		return out;
	},
	function(out,cInfo,player){
		player.xp += 1;
		player.give(nuggetEmerald);
	}
);

furnace.addRecipe(<embers:ingot_aluminum>, <contenttweaker:du_aluminum_ore>, 0.7);
furnace.addRecipe(<embers:ingot_copper>, <contenttweaker:du_copper_ore>, 0.7);
furnace.addRecipe(<embers:ingot_lead>, <contenttweaker:du_lead_ore>, 0.7);
furnace.addRecipe(<embers:ingot_nickel>, <contenttweaker:du_nickel_ore>, 0.7);
furnace.addRecipe(<embers:ingot_silver>, <contenttweaker:du_silver_ore>, 0.7);
furnace.addRecipe(<embers:ingot_tin>, <contenttweaker:du_tin_ore>, 0.7);



#ANIMALNET

recipes.remove(<minecraft:mob_spawner>);


#METALLURGY

recipes.remove(<metallurgy:quicksilver_ingot>);
recipes.addShaped(<metallurgy:quicksilver_ingot>,
 [[<metallurgy:quicksilver_nugget>, <metallurgy:quicksilver_nugget>, <metallurgy:quicksilver_nugget>],
  [<metallurgy:quicksilver_nugget>, <metallurgy:quicksilver_nugget>, <metallurgy:quicksilver_nugget>],
  [<metallurgy:quicksilver_nugget>, <metallurgy:quicksilver_nugget>, <metallurgy:quicksilver_nugget>]]);
recipes.addShapeless(<metallurgy:quicksilver_ingot> * 9,
 [<metallurgy:quicksilver_block>]);