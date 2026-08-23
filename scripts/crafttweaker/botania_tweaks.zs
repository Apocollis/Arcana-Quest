#priority 50
import crafttweaker.item.IItemStack;

// ========================================================
// Botania Recipe Tweaks & Cross-Mod Integrations
// ========================================================

// 1. Mana Lens (Requires Astral Sorcery Glass Lens)
recipes.remove(<botania:lens:0>);
recipes.addShaped("aq_mana_lens", <botania:lens:0>, [
    [null, <ore:ingotManasteel>, null],
    [<ore:ingotManasteel>, <astralsorcery:itemcraftingcomponent:3>, <ore:ingotManasteel>],
    [null, <ore:ingotManasteel>, null]
]);

// 2. Mana Spreader (Requires Prometheum Ingot in Center)
recipes.remove(<botania:spreader:0>);
recipes.addShaped("aq_mana_spreader", <botania:spreader:0>, [
    [<ore:livingwood>, <ore:livingwood>, <ore:livingwood>],
    [<ore:ingotGold>, <ore:ingotPrometheum>, null],
    [<ore:livingwood>, <ore:livingwood>, <ore:livingwood>]
]);

// 3. Mana Blaster (Requires Prometheum Ingot)
recipes.remove(<botania:managun:0>);
recipes.addShaped("aq_mana_blaster", <botania:managun:0>, [
    [<botania:spreader:1>, <ore:runeManaB>, <ore:manaDiamond>],
    [<ore:ingotPrometheum>, <ore:livingwood>, <minecraft:tnt>],
    [null, null, <ore:livingwood>]
]);

// 4. Wand of the Forest (Requires Prometheum Ingot in addition to Petals & Twigs)
recipes.remove(<botania:twigwand>);
recipes.addShaped("aq_wand_of_the_forest", <botania:twigwand>, [
    [null, <ore:petal>, <ore:livingwoodTwig>],
    [<ore:ingotPrometheum>, <ore:livingwoodTwig>, <ore:petal>],
    [<ore:livingwoodTwig>, null, null]
]);

// 5. Petal Apothecary (Requires Prometheum Ingot in Top-Center)
recipes.remove(<botania:altar:0>);
recipes.addShaped("aq_petal_apothecary", <botania:altar:0>, [
    [<ore:slabCobblestone>, <ore:ingotPrometheum>, <ore:slabCobblestone>],
    [null, <ore:cobblestone>, null],
    [<ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>]
]);

// 6. Floral Fertilizer (Alternate Recipe: 1x Bone Meal + 1x Prometheum Dust)
recipes.addShapeless("aq_floral_fertilizer_prometheum", <botania:fertilizer>, [
    <minecraft:dye:15>, <ore:dustPrometheum>
]);
