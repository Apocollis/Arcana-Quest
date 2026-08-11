#priority 80
import crafttweaker.item.IItemStack;
import mods.jei.JEI;

// Weapon types to disable across all materials for high-fantasy medieval theme
val disabledWeaponPrefixes = [
    "spartanweaponry:katana_",
    "spartanweaponry:rapier_",
    "spartanweaponry:saber_",
    "spartanweaponry:boomerang_",
    "spartanweaponry:caestus",
    "spartanweaponry:scythe_",
    "spartanweaponryarcana:katana_",
    "spartanweaponryarcana:rapier_",
    "spartanweaponryarcana:saber_",
    "spartanweaponryarcana:scythe_",
    "spartantwilight:katana_",
    "spartantwilight:rapier_",
    "spartantwilight:saber_",
    "spartantwilight:scythe_"
] as string[];

val disabledMaterials = [
    "wood", "stone", "iron", "gold", "diamond",
    "bronze", "steel", "silver", "copper", "tin",
    "electrum", "lead", "nickel", "invar", "constantan",
    "platinum", "mithril", "thaumium", "void", "elementium",
    "manasteel", "terrasteel", "steeleaf", "ironwood", "knightmetal"
] as string[];

// Remove crafting recipes and hide caestus items directly
val caestusItems = [
    <spartanweaponry:caestus>,
    <spartanweaponry:caestus_studded>
] as IItemStack[];

for item in caestusItems {
    recipes.remove(item);
    JEI.hide(item);
}

// Loop through weapon prefixes and materials to remove recipes and hide from JEI
for prefix in disabledWeaponPrefixes {
    if (prefix == "spartanweaponry:caestus") {
        continue;
    }
    for mat in disabledMaterials {
        val itemId = prefix + mat;
        val item = itemUtils.getItem(itemId);
        if (!isNull(item)) {
            recipes.remove(item);
            JEI.hide(item);
        }
    }
}
