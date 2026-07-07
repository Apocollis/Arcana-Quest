// Register the Armor Mastery perk under the Defense skill (reskillable:defense)
// Coordinates: X=2, Y=3 | Cost: 6 points | Registry name: aqtweaks:armor_mastery
// This namespaced ID maps automatically to aqtweaks:textures/unlockables/armor_mastery.png for its icon.
var armorMastery = mods.compatskills.TraitCreator.createNewTrait("aqtweaks:armor_mastery", 2, 3, "reskillable:defense", 6);
armorMastery.name = "Armor Mastery";
armorMastery.description = "Reduces the weight of all worn armor pieces by 1 half-feather.";

// Register the Mining Efficiency perk under the Mining skill (reskillable:mining)
// Coordinates: X=2, Y=3 | Cost: 6 points | Registry name: aqtweaks:mining_efficiency
// This namespaced ID maps automatically to aqtweaks:textures/unlockables/mining_efficiency.png for its icon.
var miningEfficiency = mods.compatskills.TraitCreator.createNewTrait("aqtweaks:mining_efficiency", 2, 3, "reskillable:mining", 6);
miningEfficiency.name = "Mining Efficiency";
miningEfficiency.description = "Reduces the stamina cost of all mining actions by 1 half-feather.";
