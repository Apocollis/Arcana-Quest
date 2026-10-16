#priority 40
import mods.thaumcraft.Crucible;
import mods.astralsorcery.Altar;
import crafttweaker.item.IIngredient;
import mods.farmersdelight.CookingPot;
import mods.rustic.Condenser;
import mods.rustic.CrushingTub;
import mods.extradelightlegacy.Mortar;
import mods.botania.ManaInfusion;

// ============================================================================
// 1. THAUMCRAFT CRUCIBLE: ELEMENTAL TRANSMUTATION
// ============================================================================
// Moonstone Ingots mined deep underground in The Aurorian are boiled with realm essentia
// to alchemically transmute into pure Aurorianite, Crystalline, and Umbra ingots.

// Aurorianite (Sky / Levitation / Nature)
Crucible.registerRecipe(
    "AurorianiteIngot",
    "BASEALCHEMY",
    <theaurorian:aurorianiteingot>,
    <theaurorian:moonstoneingot>,
    [<aspect:aer> * 15, <aspect:motus> * 15, <aspect:herba> * 10]
);

// Crystalline (Light / Fire / Laser)
Crucible.registerRecipe(
    "CrystallineIngot",
    "BASEALCHEMY",
    <theaurorian:crystallineingot>,
    <theaurorian:moonstoneingot>,
    [<aspect:lux> * 15, <aspect:ignis> * 15, <aspect:vitreus> * 10]
);

// Umbra (Shadow / Protection / Entropy)
Crucible.registerRecipe(
    "UmbraIngot",
    "BASEALCHEMY",
    <theaurorian:umbraingot>,
    <theaurorian:moonstoneingot>,
    [<aspect:tenebrae> * 15, <aspect:praemunio> * 15, <aspect:perditio> * 10]
);

// ============================================================================
// 2. ASTRAL SORCERY TIER 2 ALTAR: AWAKENING ELEMENTAL RELICS
// ============================================================================
// Ritual Layout (13 slots):
// Center (Slot 4): Base Moonstone Tool / Shield
// 4 Outer Corner Pillars (Slots 9, 10, 11, 12): 4x Elemental Ingots
// Remaining slots: null (clean ritual grid)

// --- Aurorianite Relics (Levitation, Ore Frenzy, Treecapitator) ---
Altar.addAttunementAltarRecipe(
    "theaurorian_aurorianite_sword",
    <theaurorian:aurorianitesword>,
    600,
    100,
    [
        null, null, null,
        null, <theaurorian:moonstonesword>, null,
        null, null, null,
        <theaurorian:aurorianiteingot>, <theaurorian:aurorianiteingot>,
        <theaurorian:aurorianiteingot>, <theaurorian:aurorianiteingot>
    ]
);

Altar.addAttunementAltarRecipe(
    "theaurorian_aurorianite_pickaxe",
    <theaurorian:aurorianitepickaxe>,
    600,
    100,
    [
        null, null, null,
        null, <theaurorian:moonstonepickaxe>, null,
        null, null, null,
        <theaurorian:aurorianiteingot>, <theaurorian:aurorianiteingot>,
        <theaurorian:aurorianiteingot>, <theaurorian:aurorianiteingot>
    ]
);

Altar.addAttunementAltarRecipe(
    "theaurorian_aurorianite_axe",
    <theaurorian:aurorianiteaxe>,
    600,
    100,
    [
        null, null, null,
        null, <theaurorian:moonstoneaxe>, null,
        null, null, null,
        <theaurorian:aurorianiteingot>, <theaurorian:aurorianiteingot>,
        <theaurorian:aurorianiteingot>, <theaurorian:aurorianiteingot>
    ]
);

// --- Crystalline Relics (Laser Beam, Auto-Smelter, Mending Shield) ---
Altar.addAttunementAltarRecipe(
    "theaurorian_crystalline_sword",
    <theaurorian:crystallinesword>,
    600,
    100,
    [
        null, null, null,
        null, <theaurorian:moonstonesword>, null,
        null, null, null,
        <theaurorian:crystallineingot>, <theaurorian:crystallineingot>,
        <theaurorian:crystallineingot>, <theaurorian:crystallineingot>
    ]
);

Altar.addAttunementAltarRecipe(
    "theaurorian_crystalline_pickaxe",
    <theaurorian:crystallinepickaxe>,
    600,
    100,
    [
        null, null, null,
        null, <theaurorian:moonstonepickaxe>, null,
        null, null, null,
        <theaurorian:crystallineingot>, <theaurorian:crystallineingot>,
        <theaurorian:crystallineingot>, <theaurorian:crystallineingot>
    ]
);

Altar.addAttunementAltarRecipe(
    "theaurorian_crystalline_shield",
    <theaurorian:crystallineshield>,
    600,
    100,
    [
        null, null, null,
        null, <theaurorian:moonstoneshield>, null,
        null, null, null,
        <theaurorian:crystallineingot>, <theaurorian:crystallineingot>,
        <theaurorian:crystallineingot>, <theaurorian:crystallineingot>
    ]
);

// --- Umbra Relics (Panic Absorption, Tuned Mining, Flamethrower Shield) ---
Altar.addAttunementAltarRecipe(
    "theaurorian_umbra_sword",
    <theaurorian:umbrasword>,
    600,
    100,
    [
        null, null, null,
        null, <theaurorian:moonstonesword>, null,
        null, null, null,
        <theaurorian:umbraingot>, <theaurorian:umbraingot>,
        <theaurorian:umbraingot>, <theaurorian:umbraingot>
    ]
);

Altar.addAttunementAltarRecipe(
    "theaurorian_umbra_pickaxe",
    <theaurorian:umbrapickaxe>,
    600,
    100,
    [
        null, null, null,
        null, <theaurorian:moonstonepickaxe>, null,
        null, null, null,
        <theaurorian:umbraingot>, <theaurorian:umbraingot>,
        <theaurorian:umbraingot>, <theaurorian:umbraingot>
    ]
);

Altar.addAttunementAltarRecipe(
    "theaurorian_umbra_shield",
    <theaurorian:umbrashield>,
    600,
    100,
    [
        null, null, null,
        null, <theaurorian:moonstoneshield>, null,
        null, null, null,
        <theaurorian:umbraingot>, <theaurorian:umbraingot>,
        <theaurorian:umbraingot>, <theaurorian:umbraingot>
    ]
);

// ============================================================================
// 3. ASTRAL SORCERY TIER 2 ALTAR: AURORIAN STEEL FORGING
// ============================================================================
// Ritual Layout (13 slots):
// Center (Slot 4): Cerulean Ingot (Aurorian Subterranean Base Metal)
// Top/Bottom (Slots 1, 7): Geode Crystals
// Left (Slot 3): Moonstone Ingot (Lunar Metal)
// Right (Slot 5): Ceruclase Ingot (Metallurgy Frost Metal)
// 4 Pillars (Slots 9, 10, 11, 12):
//   - Slot 9 (NW): Aurorianite Ingot
//   - Slot 10 (NE): Crystalline Ingot
//   - Slot 11 (SW): Umbra Ingot
//   - Slot 12 (SE): Thaumium Ingot (Arcane Enchantment Matrix)
Altar.addAttunementAltarRecipe(
    "theaurorian_aurorian_steel",
    <theaurorian:auroriansteel>,
    1200,
    200,
    [
        null, <theaurorian:crystal>, null,
        <theaurorian:moonstoneingot>, <theaurorian:ceruleaningot>, <metallurgy:ceruclase_ingot>,
        null, <theaurorian:crystal>, null,
        <theaurorian:aurorianiteingot>, <theaurorian:crystallineingot>,
        <theaurorian:umbraingot>, <thaumcraft:ingot:0>
    ]
);

// Remove basic shapeless 3x3 table recipe for Aurorian Steel
recipes.remove(<theaurorian:auroriansteel>);

// Re-add 9 nuggets -> 1 ingot shaped crafting recipe
recipes.addShaped("aurorian_steel_from_nuggets", <theaurorian:auroriansteel>, [
    [<theaurorian:auroriansteelnugget>, <theaurorian:auroriansteelnugget>, <theaurorian:auroriansteelnugget>],
    [<theaurorian:auroriansteelnugget>, <theaurorian:auroriansteelnugget>, <theaurorian:auroriansteelnugget>],
    [<theaurorian:auroriansteelnugget>, <theaurorian:auroriansteelnugget>, <theaurorian:auroriansteelnugget>]
]);

// ============================================================================
// 4. NATIVE PLANTS & SILKBERRY INTEGRATIONS
// ============================================================================

// --- Indigo Mushroom ---
// Farmer's Delight Cooking Pot: Savory Indigo Stew
CookingPot.addRecipeWithContainer(
    "aq_savory_indigo_stew",
    [
        <theaurorian:mushroomsmall>,
        <farmersdelight:onion>,
        <minecraft:brown_mushroom>,
        <minecraft:carrot>
    ] as IIngredient[],
    <minecraft:mushroom_stew>,
    <minecraft:bowl>
);

// Rustic Condenser: Elixir of Night Vision (3:00)
Condenser.addRecipe(
    <rustic:elixir>.withTag({ElixirEffects: [{Effect: "minecraft:night_vision", Duration: 3600, Amplifier: 0}]}),
    [<theaurorian:mushroomsmall>, <rustic:chamomile>]
);

// Extra Delight Mortar: Indigo Mushroom -> 2x Lapis Blue Dye
Mortar.add("aq_mortar_indigo_mushroom", <theaurorian:mushroomsmall>, <minecraft:dye:4> * 2, 4);

// --- Lavender ---
// Rustic Condenser: Elixir of Restorative Comfort (5:00)
Condenser.addRecipe(
    <rustic:elixir>.withTag({ElixirEffects: [{Effect: "farmersdelight:comfort", Duration: 6000, Amplifier: 0}]}),
    [<theaurorian:lavender>, <rustic:cohosh>]
);

// Extra Delight Mortar: Lavender -> 2x Purple Dye
Mortar.add("aq_mortar_aurorian_lavender", <theaurorian:lavender>, <minecraft:dye:5> * 2, 4);

// --- Petunia ---
// Rustic Condenser: Elixir of Luminescence (5:00)
Condenser.addRecipe(
    <rustic:elixir>.withTag({ElixirEffects: [{Effect: "minecraft:glowing", Duration: 6000, Amplifier: 0}]}),
    [<theaurorian:petuniaplant>, <rustic:cloudsbluff>]
);

// Botania Mana Pool: Petunia Infusion -> 2x Mystical Magenta Petals
ManaInfusion.addInfusion(<botania:petal:2> * 2, <theaurorian:petuniaplant>, 500);

// Extra Delight Mortar: Petunia -> 2x Pink Dye
Mortar.add("aq_mortar_aurorian_petunia", <theaurorian:petuniaplant>, <minecraft:dye:9> * 2, 4);

// --- Silkberry ---
// Rustic Crushing Tub: Silkberry -> 250mB Wildberry Juice + 1x String (Silk Fiber)
CrushingTub.addRecipe(<liquid:wildberryjuice> * 250, <minecraft:string>, <theaurorian:silkberry>);

// Rustic Condenser: Superior Aurorian Cold Resistance Elixir (3:00)
Condenser.addRecipe(
    <rustic:elixir>.withTag({ElixirEffects: [{Effect: "simpledifficulty:cold_resist", Duration: 3600, Amplifier: 0}]}),
    [<theaurorian:silkberry>, <rustic:honeycomb>]
);

// Extended Superior Aurorian Cold Resistance Elixir (8:00)
Condenser.addRecipe(
    <rustic:elixir>.withTag({ElixirEffects: [{Effect: "simpledifficulty:cold_resist", Duration: 9600, Amplifier: 0}]}),
    [<theaurorian:silkberry>, <rustic:honeycomb>],
    <rustic:horsetail>
);

// Rustic Condenser: Elixir of Regeneration (1:00)
Condenser.addRecipe(
    <rustic:elixir>.withTag({ElixirEffects: [{Effect: "minecraft:regeneration", Duration: 1200, Amplifier: 0}]}),
    [<theaurorian:silkberry>, <rustic:aloe_vera>]
);

// Extended Elixir of Regeneration (2:30)
Condenser.addRecipe(
    <rustic:elixir>.withTag({ElixirEffects: [{Effect: "minecraft:regeneration", Duration: 3000, Amplifier: 0}]}),
    [<theaurorian:silkberry>, <rustic:aloe_vera>],
    <rustic:horsetail>
);

// Ore Dictionary Integration for Silkberry
<ore:cropBerry>.add(<theaurorian:silkberry>);
<ore:foodBerry>.add(<theaurorian:silkberry>);

// ============================================================================
// 5. THAUMCRAFT 6 ASPECTS: THE AURORIAN (WITH GELUM / COLD LORE)
// ============================================================================

// --- Ingots & Minerals ---
<theaurorian:ceruleaningot>.setAspects(<aspect:metallum> * 15, <aspect:terra> * 5, <aspect:aqua> * 5, <aspect:gelum> * 5);
<theaurorian:ceruleannugget>.setAspects(<aspect:metallum> * 1);
<theaurorian:moonstoneingot>.setAspects(<aspect:metallum> * 10, <aspect:lux> * 10, <aspect:praecantatio> * 5, <aspect:gelum> * 3);
<theaurorian:moonstonenugget>.setAspects(<aspect:metallum> * 1, <aspect:lux> * 1);
<theaurorian:aurorianiteingot>.setAspects(<aspect:metallum> * 15, <aspect:praecantatio> * 10, <aspect:lux> * 10, <aspect:gelum> * 5);
<theaurorian:crystallineingot>.setAspects(<aspect:metallum> * 15, <aspect:vitreus> * 10, <aspect:gelum> * 15);
<theaurorian:umbraingot>.setAspects(<aspect:metallum> * 15, <aspect:tenebrae> * 15, <aspect:praemunio> * 10, <aspect:gelum> * 5);
<theaurorian:auroriansteel>.setAspects(<aspect:metallum> * 25, <aspect:praecantatio> * 20, <aspect:praemunio> * 15, <aspect:lux> * 15, <aspect:gelum> * 10);
<theaurorian:auroriansteelnugget>.setAspects(<aspect:metallum> * 2, <aspect:praecantatio> * 2, <aspect:gelum> * 1);
<theaurorian:crystal>.setAspects(<aspect:vitreus> * 15, <aspect:lux> * 10, <aspect:praecantatio> * 5, <aspect:gelum> * 5);
<theaurorian:auroriancoal>.setAspects(<aspect:ignis> * 10, <aspect:potentia> * 10);
<theaurorian:auroriancoalnugget>.setAspects(<aspect:ignis> * 1, <aspect:potentia> * 1);

// --- Flora & Blocks ---
<theaurorian:lavender>.setAspects(<aspect:herba> * 10, <aspect:victus> * 5, <aspect:sensus> * 5, <aspect:aer> * 3);
<theaurorian:lavenderplant>.setAspects(<aspect:herba> * 10, <aspect:victus> * 5, <aspect:sensus> * 5);
<theaurorian:petuniaplant>.setAspects(<aspect:herba> * 10, <aspect:lux> * 5, <aspect:sensus> * 5, <aspect:praecantatio> * 3);
<theaurorian:mushroomsmall>.setAspects(<aspect:tenebrae> * 10, <aspect:lux> * 5, <aspect:sensus> * 5, <aspect:victus> * 5, <aspect:gelum> * 3);
<theaurorian:silentwoodstick>.setAspects(<aspect:herba> * 2, <aspect:praecantatio> * 1);
<theaurorian:silentwoodsapling>.setAspects(<aspect:herba> * 10, <aspect:victus> * 5);
<theaurorian:aurorianslimeball>.setAspects(<aspect:aqua> * 10, <aspect:victus> * 5, <aspect:motus> * 5, <aspect:gelum> * 3);
<theaurorian:silkberry>.setAspects(<aspect:victus> * 5, <aspect:vinculum> * 5, <aspect:herba> * 5, <aspect:gelum> * 2);
<theaurorian:moontorch>.setAspects(<aspect:lux> * 10, <aspect:ignis> * 5);

// --- Dungeon Artifacts & Relics ---
<theaurorian:absorptionorb>.setAspects(<aspect:praecantatio> * 25, <aspect:praemunio> * 20, <aspect:victus> * 15);
<theaurorian:trophykeeper>.setAspects(<aspect:cognitio> * 20, <aspect:praecantatio> * 20, <aspect:aversio> * 10);
<theaurorian:trophymoonqueen>.setAspects(<aspect:lux> * 30, <aspect:praecantatio> * 30, <aspect:gelum> * 15, <aspect:exanimis> * 10);
<theaurorian:trophyspider>.setAspects(<aspect:bestia> * 20, <aspect:aversio> * 20, <aspect:vinculum> * 10);
<theaurorian:spectralsilk>.setAspects(<aspect:spiritus> * 15, <aspect:vinculum> * 10, <aspect:praecantatio> * 10, <aspect:gelum> * 5);
<theaurorian:webbing>.setAspects(<aspect:bestia> * 5, <aspect:vinculum> * 5);
<theaurorian:keeperamulet>.setAspects(<aspect:praecantatio> * 15, <aspect:praemunio> * 15);
<theaurorian:darkamulet>.setAspects(<aspect:tenebrae> * 15, <aspect:praecantatio> * 15);
<theaurorian:moontemplekey>.setAspects(<aspect:praecantatio> * 20, <aspect:lux> * 15, <aspect:machina> * 10);
<theaurorian:darkstonekey>.setAspects(<aspect:tenebrae> * 20, <aspect:machina> * 10);
<theaurorian:runestonekey>.setAspects(<aspect:praecantatio> * 20, <aspect:machina> * 10);
<theaurorian:lockpicks>.setAspects(<aspect:machina> * 10, <aspect:metallum> * 5);

// --- Shields & Combat ---
<theaurorian:moonshield>.setAspects(<aspect:praemunio> * 20, <aspect:lux> * 15, <aspect:praecantatio> * 15, <aspect:metallum> * 10, <aspect:gelum> * 5);
<theaurorian:ceruleanshield>.setAspects(<aspect:praemunio> * 15, <aspect:metallum> * 15, <aspect:aqua> * 5, <aspect:gelum> * 5);
<theaurorian:crystallineshield>.setAspects(<aspect:praemunio> * 18, <aspect:vitreus> * 12, <aspect:gelum> * 15);
<theaurorian:umbrashield>.setAspects(<aspect:praemunio> * 18, <aspect:tenebrae> * 15, <aspect:metallum> * 10, <aspect:gelum> * 5);
<theaurorian:moonstoneshield>.setAspects(<aspect:praemunio> * 15, <aspect:lux> * 10, <aspect:metallum> * 10, <aspect:gelum> * 3);
<theaurorian:keepersbow>.setAspects(<aspect:aversio> * 20, <aspect:volatus> * 15, <aspect:praecantatio> * 15, <aspect:gelum> * 5);
<theaurorian:aurorianslimeboots>.setAspects(<aspect:motus> * 15, <aspect:aqua> * 10, <aspect:praemunio> * 5, <aspect:gelum> * 5);

// --- Armors ---
<theaurorian:auroriansteelhelmet>.setAspects(<aspect:metallum> * 20, <aspect:praemunio> * 15, <aspect:praecantatio> * 10, <aspect:lux> * 5, <aspect:gelum> * 10);
<theaurorian:auroriansteelchestplate>.setAspects(<aspect:metallum> * 20, <aspect:praemunio> * 15, <aspect:praecantatio> * 10, <aspect:lux> * 5, <aspect:gelum> * 10);
<theaurorian:auroriansteelleggings>.setAspects(<aspect:metallum> * 20, <aspect:praemunio> * 15, <aspect:praecantatio> * 10, <aspect:lux> * 5, <aspect:gelum> * 10);
<theaurorian:auroriansteelboots>.setAspects(<aspect:metallum> * 20, <aspect:praemunio> * 15, <aspect:praecantatio> * 10, <aspect:lux> * 5, <aspect:gelum> * 10);

<theaurorian:ceruleanhelmet>.setAspects(<aspect:metallum> * 15, <aspect:praemunio> * 10, <aspect:aqua> * 5, <aspect:gelum> * 5);
<theaurorian:ceruleanchestplate>.setAspects(<aspect:metallum> * 15, <aspect:praemunio> * 10, <aspect:aqua> * 5, <aspect:gelum> * 5);
<theaurorian:ceruleanleggings>.setAspects(<aspect:metallum> * 15, <aspect:praemunio> * 10, <aspect:aqua> * 5, <aspect:gelum> * 5);
<theaurorian:ceruleanboots>.setAspects(<aspect:metallum> * 15, <aspect:praemunio> * 10, <aspect:aqua> * 5, <aspect:gelum> * 5);

<theaurorian:spectralhelmet>.setAspects(<aspect:praemunio> * 8, <aspect:spiritus> * 15, <aspect:vinculum> * 10, <aspect:praecantatio> * 10, <aspect:gelum> * 5);
<theaurorian:spectralchestplate>.setAspects(<aspect:praemunio> * 8, <aspect:spiritus> * 15, <aspect:vinculum> * 10, <aspect:praecantatio> * 10, <aspect:gelum> * 5);
<theaurorian:spectralleggings>.setAspects(<aspect:praemunio> * 8, <aspect:spiritus> * 15, <aspect:vinculum> * 10, <aspect:praecantatio> * 10, <aspect:gelum> * 5);
<theaurorian:spectralboots>.setAspects(<aspect:praemunio> * 8, <aspect:spiritus> * 15, <aspect:vinculum> * 10, <aspect:praecantatio> * 10, <aspect:gelum> * 5);

<theaurorian:knighthelmet>.setAspects(<aspect:metallum> * 20, <aspect:praemunio> * 12, <aspect:gelum> * 5, <aspect:aversio> * 5);
<theaurorian:knightchestplate>.setAspects(<aspect:metallum> * 20, <aspect:praemunio> * 12, <aspect:gelum> * 5, <aspect:aversio> * 5);
<theaurorian:knightleggings>.setAspects(<aspect:metallum> * 20, <aspect:praemunio> * 12, <aspect:gelum> * 5, <aspect:aversio> * 5);
<theaurorian:knightboots>.setAspects(<aspect:metallum> * 20, <aspect:praemunio> * 12, <aspect:gelum> * 5, <aspect:aversio> * 5);
