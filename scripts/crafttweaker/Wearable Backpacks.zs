
# WEARABLE BACKPACKS

val leather = <ore:leather>;
val iron = <ore:ingotIron>;
val gold = <ore:ingotGold>;
val diamond = <ore:gemDiamond>;

val backpack = <wearablebackpacks:backpack>;
val backpack_1 = <wearablebackpacks:backpack>.withTag({backpack:{size:[9,3]}, display: {LocName: "Backpack"}});
val backpack_2 = <wearablebackpacks:backpack>.withTag({backpack:{size:[9,4]}, display: {LocName: "Big Backpack", color: 16383998}});
val backpack_3 = <wearablebackpacks:backpack>.withTag({backpack:{size:[9,6]}, display: {LocName: "Huge Backpack", color: 6932195}});
	
mods.jei.JEI.addItem(<wearablebackpacks:backpack>.withTag({backpack:{size:[9,4]}, display: {LocName: "Big Backpack", color: 16383998}}));
mods.jei.JEI.addItem(<wearablebackpacks:backpack>.withTag({backpack:{size:[9,6]}, display: {LocName: "Huge Backpack", color: 6932195}}));
	
recipes.addShaped(backpack_2,
	[[leather, iron, leather],
	 [iron, backpack_1, iron],
	 [leather, iron, leather]]);
	
recipes.addShaped(backpack_2,
	[[leather, iron, leather],
	 [iron, backpack, iron],
	 [leather, iron, leather]]);
	
recipes.addShaped(backpack_3,
	[[gold, diamond, gold],
	 [diamond, backpack_2, diamond],
	 [gold, diamond, gold]]);