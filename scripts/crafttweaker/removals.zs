# removals.zs
# Cleanup script for removing specific recipes and hiding items from JEI.

# --- Torchmaster Removals ---
recipes.remove(<torchmaster:feral_flare_lantern>);
recipes.remove(<torchmaster:frozen_pearl>);

mods.jei.JEI.hide(<torchmaster:feral_flare_lantern>);
mods.jei.JEI.hide(<torchmaster:frozen_pearl>);

# --- Dynaores Removals ---
recipes.remove(<dynaores:raw_adamantine_block>);
mods.jei.JEI.hide(<dynaores:raw_adamantine>);
mods.jei.JEI.hide(<dynaores:raw_adamantine_block>);

# --- Ceramics Fluid Removals ---
mods.jei.JEI.hide(<ceramics:clay_bucket>.withTag({fluids: {FluidName: "adamantine", Amount: 1000}}));

# --- Ceramics Clay Armor Removals ---
val clayArmor = [
    <ceramics:clay_helmet>,
    <ceramics:clay_chestplate>,
    <ceramics:clay_leggings>,
    <ceramics:clay_boots>
] as crafttweaker.item.IItemStack[];

for item in clayArmor {
    recipes.remove(item);
    mods.jei.JEI.hide(item);
}

# --- Mystical World Copper & Silver Armor Removals ---
val mysticalWorldArmor = [
    <mysticalworld:copper_helmet>,
    <mysticalworld:copper_chestplate>,
    <mysticalworld:copper_leggings>,
    <mysticalworld:copper_boots>,
    <mysticalworld:silver_helmet>,
    <mysticalworld:silver_chestplate>,
    <mysticalworld:silver_leggings>,
    <mysticalworld:silver_boots>
] as crafttweaker.item.IItemStack[];

for item in mysticalWorldArmor {
    recipes.remove(item);
    mods.jei.JEI.hide(item);
}

# --- Biotite Removals & JEI Hiding ---
recipes.remove(<quark:biotite_block:0>);
recipes.remove(<quark:biotite_block:1>);
recipes.remove(<quark:biotite_block:2>);
recipes.remove(<quark:biotite_stairs>);
recipes.remove(<quark:biotite_slab>);
recipes.remove(<quark:biotite_wall>);
furnace.remove(<quark:biotite>);

mods.jei.JEI.hide(<quark:biotite>);
mods.jei.JEI.hide(<quark:biotite_block:*>);
mods.jei.JEI.hide(<quark:biotite_stairs>);
mods.jei.JEI.hide(<quark:biotite_slab>);
mods.jei.JEI.hide(<quark:biotite_wall>);
mods.jei.JEI.hide(<quark:biotite_ore>);

# --- Modern Treats & Popsicles Removals ---
recipes.remove(<ends_delight:dragon_breath_soda>);
recipes.remove(<farmersdelight:melon_popsicle>);
recipes.remove(<ends_delight:chorus_fruit_popsicle>);

mods.jei.JEI.hide(<ends_delight:dragon_breath_soda>);
mods.jei.JEI.hide(<farmersdelight:melon_popsicle>);
mods.jei.JEI.hide(<ends_delight:chorus_fruit_popsicle>);

# --- Quality Tools Removals ---
recipes.remove(<qualitytools:reforging_station>);
mods.jei.JEI.hide(<qualitytools:reforging_station>);
