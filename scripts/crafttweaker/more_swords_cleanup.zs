#priority 70
import mods.jei.JEI;

// 1. Remove crafting table recipes for all More Swords Mod items
recipes.remove(<msmlegacy:dawn_star>);
recipes.remove(<msmlegacy:vampiric_blade>);
recipes.remove(<msmlegacy:wither_bane>);
recipes.remove(<msmlegacy:gladiolus>);
recipes.remove(<msmlegacy:crystaline_blade>);
recipes.remove(<msmlegacy:glacial_blade>);
recipes.remove(<msmlegacy:eye_end_blade>);
recipes.remove(<msmlegacy:aethers_guard>);
recipes.remove(<msmlegacy:draconic_blade>);

recipes.remove(<msmlegacy:adminium_ark>);
recipes.remove(<msmlegacy:relic_aqueous>);
recipes.remove(<msmlegacy:relic_candy>);
recipes.remove(<msmlegacy:relic_infinity>);
recipes.remove(<msmlegacy:relic_keyblade>);
recipes.remove(<msmlegacy:relic_master>);
recipes.remove(<msmlegacy:relic_molten>);
recipes.remove(<msmlegacy:relic_pie>);

// 2. Hide unobtainable relics from JEI
JEI.hide(<msmlegacy:adminium_ark>);
JEI.hide(<msmlegacy:relic_aqueous>);
JEI.hide(<msmlegacy:relic_candy>);
JEI.hide(<msmlegacy:relic_infinity>);
JEI.hide(<msmlegacy:relic_keyblade>);
JEI.hide(<msmlegacy:relic_master>);
JEI.hide(<msmlegacy:relic_molten>);
JEI.hide(<msmlegacy:relic_pie>);
