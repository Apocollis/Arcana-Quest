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


