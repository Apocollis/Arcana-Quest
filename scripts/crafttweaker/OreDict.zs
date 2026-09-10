#Thaumcraft Crystals
val itemPrimalEssence = <ore:PrimalEssence>;
itemPrimalEssence.add(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "ordo"}]}));
itemPrimalEssence.add(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "perditio"}]}));
itemPrimalEssence.add(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "terra"}]}));
itemPrimalEssence.add(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "ignis"}]}));
itemPrimalEssence.add(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "aer"}]}));
itemPrimalEssence.add(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "aqua"}]}));

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

#Flour Unification
val foodFlour = <ore:foodFlour>;
val flour = <ore:flour>;
val dustWheat = <ore:dustWheat>;
foodFlour.addAll(flour);
flour.addAll(foodFlour);
foodFlour.addAll(dustWheat);
dustWheat.addAll(foodFlour);

