#Thaumcraft Crystals
val itemPrimalEssence = <ore:PrimalEssence>;
itemPrimalEssence.add(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "ordo"}]}));
itemPrimalEssence.add(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "perditio"}]}));
itemPrimalEssence.add(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "terra"}]}));
itemPrimalEssence.add(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "ignis"}]}));
itemPrimalEssence.add(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "aer"}]}));
itemPrimalEssence.add(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "aqua"}]}));

#Divergent Underground
val itemStone = <ore:cobblestone>;
itemStone.add(<divergentunderground:rock_stone>);

#Divergent Underground Compat
val aluminumOre = <ore:oreAluminum>;
val copperOre = <ore:oreCopper>;
val leadOre = <ore:oreLead>;
val nickelOre = <ore:oreNickel>;
val silverOre = <ore:oreSilver>;
val tinOre = <ore:oreTin>;
aluminumOre.add(<contenttweaker:du_aluminum_ore>);
copperOre.add(<contenttweaker:du_copper_ore>);
leadOre.add(<contenttweaker:du_lead_ore>);
nickelOre.add(<contenttweaker:du_nickel_ore>);
silverOre.add(<contenttweaker:du_silver_ore>);
tinOre.add(<contenttweaker:du_tin_ore>);

#Salt Fix
val salt = <ore:salt>;
val allsalt = <ore:listAllsalt>;
val foodsalt = <ore:foodSalt>;
val itemsalt = <ore:itemSalt>;
salt.add(<saltmod:salt_pinch>);
allsalt.add(<saltmod:salt_pinch>);
foodsalt.add(<saltmod:salt_pinch>);
itemsalt.add(<saltmod:salt_pinch>);

#Seperate Thaumcraft and Metallurgy Quicksilver
val tcquicksilverdrop = <ore:nuggetQuicksilver>;
tcquicksilverdrop.remove(<metallurgy:quicksilver_nugget>);
