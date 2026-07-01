import crafttweaker.item.IItemStack;
import mods.embers.Melter;
import mods.embers.Stamper;
import mods.embers.Mixer;
import mods.metallurgyreforged.Alloyer;
import mods.metallurgyreforged.Crusher;

#Remove Metallurgy 4 recipes
recipes.remove(<metallurgy:alloyer>);
recipes.remove(<metallurgy:crusher>);


##Remove ingots from alloyer. Thanks to MetallurgyTweaks script for the code parts for this function.
static ingots as IItemStack[] = [<ore:ingotAmordrine>.firstItem,<ore:ingotHaderoth>.firstItem,<ore:ingotAlduorite>.firstItem,<ore:ingotPlatinum>.firstItem,<ore:ingotTin>.firstItem,<ore:ingotVulcanite>.firstItem,<ore:ingotIgnatius>.firstItem,<ore:ingotZinc>.firstItem,<ore:ingotEtherium>.firstItem,<ore:ingotQuicksilver>.firstItem,<ore:ingotBrass>.firstItem,<ore:ingotAstralSilver>.firstItem,<ore:ingotHepatizon>.firstItem,<ore:ingotBronze>.firstItem,<ore:ingotLemurite>.firstItem,<ore:ingotEximite>.firstItem,<ore:ingotSanguinite>.firstItem,<ore:ingotSilver>.firstItem,<ore:ingotDesichalkos>.firstItem,<ore:ingotCelenegil>.firstItem,<ore:ingotShadowIron>.firstItem,<ore:ingotSteel>.firstItem,<ore:ingotCarmot>.firstItem,<ore:ingotMithril>.firstItem,<ore:ingotCeruclase>.firstItem,<ore:ingotDeepIron>.firstItem,<ore:ingotAngmallen>.firstItem,<ore:ingotKalendrite>.firstItem,<ore:ingotManganese>.firstItem,<ore:ingotDamascusSteel>.firstItem,<ore:ingotPrometheum>.firstItem,<ore:ingotCopper>.firstItem,<ore:ingotAdamantine>.firstItem,<ore:ingotElectrum>.firstItem,<ore:ingotTartarite>.firstItem,<ore:ingotAtlarus>.firstItem,<ore:ingotBlackSteel>.firstItem,<ore:ingotVyroxeres>.firstItem,<ore:ingotLutetium>.firstItem,<ore:ingotOsmium>.firstItem,<ore:ingotOureclase>.firstItem,<ore:ingotInolashite>.firstItem,<ore:ingotMeutoite>.firstItem,<ore:ingotOrichalcum>.firstItem,<ore:ingotInfuscolium>.firstItem,<ore:ingotMidasium>.firstItem,<ore:ingotShadowSteel>.firstItem,<ore:ingotKrik>.firstItem,<ore:ingotRubracium>.firstItem] as IItemStack[];

for ingot in ingots
	{
		Alloyer.removeRecipe(ingot);
	}


##Remove dusts from crusher. Thanks to MetallurgyTweaks script for the code parts for this function.
static dusts as IItemStack[] = [<ore:dustAmordrine>.firstItem,<ore:dustHaderoth>.firstItem,<ore:dustAlduorite>.firstItem,<ore:dustPlatinum>.firstItem,<ore:dustTin>.firstItem,<ore:dustVulcanite>.firstItem,<ore:dustIgnatius>.firstItem,<ore:dustZinc>.firstItem,<ore:dustEtherium>.firstItem,<ore:dustQuicksilver>.firstItem,<ore:dustBrass>.firstItem,<ore:dustAstralSilver>.firstItem,<ore:dustHepatizon>.firstItem,<ore:dustBronze>.firstItem,<ore:dustLemurite>.firstItem,<ore:dustEximite>.firstItem,<ore:dustSanguinite>.firstItem,<ore:dustSilver>.firstItem,<ore:dustDesichalkos>.firstItem,<ore:dustCelenegil>.firstItem,<ore:dustShadowIron>.firstItem,<ore:dustSteel>.firstItem,<ore:dustCarmot>.firstItem,<ore:dustMithril>.firstItem,<ore:dustCeruclase>.firstItem,<ore:dustDeepIron>.firstItem,<ore:dustAngmallen>.firstItem,<ore:dustKalendrite>.firstItem,<ore:dustManganese>.firstItem,<ore:dustDamascusSteel>.firstItem,<ore:dustPrometheum>.firstItem,<ore:dustCopper>.firstItem,<ore:dustAdamantine>.firstItem,<ore:dustElectrum>.firstItem,<ore:dustTartarite>.firstItem,<ore:dustAtlarus>.firstItem,<ore:dustBlackSteel>.firstItem,<ore:dustVyroxeres>.firstItem,<ore:dustLutetium>.firstItem,<ore:dustOsmium>.firstItem,<ore:dustOureclase>.firstItem,<ore:dustInolashite>.firstItem,<ore:dustMeutoite>.firstItem,<ore:dustOrichalcum>.firstItem,<ore:dustInfuscolium>.firstItem,<ore:dustMidasium>.firstItem,<ore:dustShadowSteel>.firstItem,<ore:dustKrik>.firstItem,<ore:dustRubracium>.firstItem] as IItemStack[];

for dust in dusts
	{
		Crusher.removeRecipe(dust);
	}


##Ores##

#Adamantine
mods.embers.Melter.add(<liquid:adamantine> * 288, <ore:oreAdamantine>);
mods.embers.Melter.add(<liquid:adamantine> * 144, <ore:ingotAdamantine>);
mods.embers.Melter.add(<liquid:adamantine> * 144, <ore:dustAdamantine>);
mods.embers.Melter.add(<liquid:adamantine> * 16, <ore:nuggetAdamantine>);
mods.embers.Stamper.add(<metallurgy:adamantine_ingot>, <liquid:adamantine> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:adamantine_nugget>, <liquid:adamantine> * 16, <soot:stamp_nugget>);

#Alduorite
mods.embers.Melter.add(<liquid:alduorite> * 288, <ore:oreAlduorite>);
mods.embers.Melter.add(<liquid:alduorite> * 144, <ore:ingotAlduorite>);
mods.embers.Melter.add(<liquid:alduorite> * 144, <ore:dustAlduorite>);
mods.embers.Melter.add(<liquid:alduorite> * 16, <ore:nuggetAlduorite>);
mods.embers.Stamper.add(<metallurgy:adamantine_ingot>, <liquid:alduorite> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:adamantine_nugget>, <liquid:alduorite> * 16, <soot:stamp_nugget>);

#Astral Silver
mods.embers.Melter.add(<liquid:astral_silver> * 288, <ore:oreAstralSilver>);
mods.embers.Melter.add(<liquid:astral_silver> * 144, <ore:ingotAstralSilver>);
mods.embers.Melter.add(<liquid:astral_silver> * 144, <ore:dustAstralSilver>);
mods.embers.Melter.add(<liquid:astral_silver> * 16, <ore:nuggetAstralSilver>);
mods.embers.Stamper.add(<metallurgy:astral_silver_ingot>, <liquid:astral_silver> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:astral_silver_nugget>, <liquid:astral_silver> * 16, <soot:stamp_nugget>);

#Atlarus
mods.embers.Melter.add(<liquid:atlarus> * 288, <ore:oreAtlarus>);
mods.embers.Melter.add(<liquid:atlarus> * 144, <ore:ingotAtlarus>);
mods.embers.Melter.add(<liquid:atlarus> * 144, <ore:dustAtlarus>);
mods.embers.Melter.add(<liquid:atlarus> * 16, <ore:nuggetAtlarus>);
mods.embers.Stamper.add(<metallurgy:atlarus_ingot>, <liquid:atlarus> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:atlarus_nugget>, <liquid:atlarus> * 16, <soot:stamp_nugget>);

#Carmot
mods.embers.Melter.add(<liquid:carmot> * 288, <ore:oreCarmot>);
mods.embers.Melter.add(<liquid:carmot> * 144, <ore:ingotCarmot>);
mods.embers.Melter.add(<liquid:carmot> * 144, <ore:dustCarmot>);
mods.embers.Melter.add(<liquid:carmot> * 16, <ore:nuggetCarmot>);
mods.embers.Stamper.add(<metallurgy:carmot_ingot>, <liquid:carmot> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:carmot_nugget>, <liquid:carmot> * 16, <soot:stamp_nugget>);

#Ceruclase
mods.embers.Melter.add(<liquid:ceruclase> * 288, <ore:oreCeruclase>);
mods.embers.Melter.add(<liquid:ceruclase> * 144, <ore:ingotCeruclase>);
mods.embers.Melter.add(<liquid:ceruclase> * 144, <ore:dustCeruclase>);
mods.embers.Melter.add(<liquid:ceruclase> * 16, <ore:nuggetCeruclase>);
mods.embers.Stamper.add(<metallurgy:ceruclase_ingot>, <liquid:ceruclase> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:ceruclase_nugget>, <liquid:ceruclase> * 16, <soot:stamp_nugget>);

#Deep Iron
mods.embers.Melter.add(<liquid:deep_iron> * 288, <ore:oreDeepIron>);
mods.embers.Melter.add(<liquid:deep_iron> * 144, <ore:ingotDeepIron>);
mods.embers.Melter.add(<liquid:deep_iron> * 144, <ore:dustDeepIron>);
mods.embers.Melter.add(<liquid:deep_iron> * 16, <ore:nuggetDeepIron>);
mods.embers.Stamper.add(<metallurgy:deep_iron_ingot>, <liquid:deep_iron> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:deep_iron_nugget>, <liquid:deep_iron> * 16, <soot:stamp_nugget>);

#Eximite
mods.embers.Melter.add(<liquid:eximite> * 288, <ore:oreEximite>);
mods.embers.Melter.add(<liquid:eximite> * 144, <ore:ingotEximite>);
mods.embers.Melter.add(<liquid:eximite> * 144, <ore:dustEximite>);
mods.embers.Melter.add(<liquid:eximite> * 16, <ore:nuggetEximite>);
mods.embers.Stamper.add(<metallurgy:eximite_ingot>, <liquid:eximite> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:eximite_nugget>, <liquid:eximite> * 16, <soot:stamp_nugget>);

#Ignatius
mods.embers.Melter.add(<liquid:ignatius> * 288, <ore:oreIgnatius>);
mods.embers.Melter.add(<liquid:ignatius> * 144, <ore:ingotIgnatius>);
mods.embers.Melter.add(<liquid:ignatius> * 144, <ore:dustIgnatius>);
mods.embers.Melter.add(<liquid:ignatius> * 16, <ore:nuggetIgnatius>);
mods.embers.Stamper.add(<metallurgy:ignatius_ingot>, <liquid:ignatius> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:ignatius_nugget>, <liquid:ignatius> * 16, <soot:stamp_nugget>);

#Infuscolium
mods.embers.Melter.add(<liquid:infuscolium> * 288, <ore:oreInfuscolium>);
mods.embers.Melter.add(<liquid:infuscolium> * 144, <ore:ingotInfuscolium>);
mods.embers.Melter.add(<liquid:infuscolium> * 144, <ore:dustInfuscolium>);
mods.embers.Melter.add(<liquid:infuscolium> * 16, <ore:nuggetInfuscolium>);
mods.embers.Stamper.add(<metallurgy:infuscolium_ingot>, <liquid:infuscolium> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:infuscolium_nugget>, <liquid:infuscolium> * 16, <soot:stamp_nugget>);

#Kalendrite
mods.embers.Melter.add(<liquid:kalendrite> * 288, <ore:oreKalendrite>);
mods.embers.Melter.add(<liquid:kalendrite> * 144, <ore:ingotKalendrite>);
mods.embers.Melter.add(<liquid:kalendrite> * 144, <ore:dustKalendrite>);
mods.embers.Melter.add(<liquid:kalendrite> * 16, <ore:nuggetKalendrite>);
mods.embers.Stamper.add(<metallurgy:kalendrite_ingot>, <liquid:kalendrite> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:kalendrite_nugget>, <liquid:kalendrite> * 16, <soot:stamp_nugget>);

#Lemurite
mods.embers.Melter.add(<liquid:lemurite> * 288, <ore:oreLemurite>);
mods.embers.Melter.add(<liquid:lemurite> * 144, <ore:ingotLemurite>);
mods.embers.Melter.add(<liquid:lemurite> * 144, <ore:dustLemurite>);
mods.embers.Melter.add(<liquid:lemurite> * 16, <ore:nuggetLemurite>);
mods.embers.Stamper.add(<metallurgy:lemurite_ingot>, <liquid:lemurite> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:lemurite_nugget>, <liquid:lemurite> * 16, <soot:stamp_nugget>);

#Lutetium
mods.embers.Melter.add(<liquid:lutetium> * 288, <ore:oreLutetium>);
mods.embers.Melter.add(<liquid:lutetium> * 144, <ore:ingotLutetium>);
mods.embers.Melter.add(<liquid:lutetium> * 144, <ore:dustLutetium>);
mods.embers.Melter.add(<liquid:lutetium> * 16, <ore:nuggetLutetium>);
mods.embers.Stamper.add(<metallurgy:lutetium_ingot>, <liquid:lutetium> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:lutetium_nugget>, <liquid:lutetium> * 16, <soot:stamp_nugget>);

#Manganese
mods.embers.Melter.add(<liquid:manganese> * 288, <ore:oreManganese>);
mods.embers.Melter.add(<liquid:manganese> * 144, <ore:ingotManganese>);
mods.embers.Melter.add(<liquid:manganese> * 144, <ore:dustManganese>);
mods.embers.Melter.add(<liquid:manganese> * 16, <ore:nuggetManganese>);
mods.embers.Stamper.add(<metallurgy:manganese_ingot>, <liquid:manganese> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:manganese_nugget>, <liquid:manganese> * 16, <soot:stamp_nugget>);

#Meutoite
mods.embers.Melter.add(<liquid:meutoite> * 288, <ore:oreMeutoite>);
mods.embers.Melter.add(<liquid:meutoite> * 144, <ore:ingotMeutoite>);
mods.embers.Melter.add(<liquid:meutoite> * 144, <ore:dustMeutoite>);
mods.embers.Melter.add(<liquid:meutoite> * 16, <ore:nuggetMeutoite>);
mods.embers.Stamper.add(<metallurgy:meutoite_ingot>, <liquid:meutoite> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:meutoite_nugget>, <liquid:meutoite> * 16, <soot:stamp_nugget>);

#Midasium
mods.embers.Melter.add(<liquid:midasium> * 288, <ore:oreMidasium>);
mods.embers.Melter.add(<liquid:midasium> * 144, <ore:ingotMidasium>);
mods.embers.Melter.add(<liquid:midasium> * 144, <ore:dustMidasium>);
mods.embers.Melter.add(<liquid:midasium> * 16, <ore:nuggetMidasium>);
mods.embers.Stamper.add(<metallurgy:midasium_ingot>, <liquid:midasium> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:midasium_nugget>, <liquid:midasium> * 16, <soot:stamp_nugget>);

#Mithril
mods.embers.Melter.add(<liquid:mithril> * 288, <ore:oreMithril>);
mods.embers.Melter.add(<liquid:mithril> * 144, <ore:ingotMithril>);
mods.embers.Melter.add(<liquid:mithril> * 144, <ore:dustMithril>);
mods.embers.Melter.add(<liquid:mithril> * 16, <ore:nuggetMithril>);
mods.embers.Stamper.add(<metallurgy:mithril_ingot>, <liquid:mithril> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:mithril_nugget>, <liquid:mithril> * 16, <soot:stamp_nugget>);

#Orichalcum
mods.embers.Melter.add(<liquid:orichalcum> * 288, <ore:oreOrichalcum>);
mods.embers.Melter.add(<liquid:orichalcum> * 144, <ore:ingotOrichalcum>);
mods.embers.Melter.add(<liquid:orichalcum> * 144, <ore:dustOrichalcum>);
mods.embers.Melter.add(<liquid:orichalcum> * 16, <ore:nuggetOrichalcum>);
mods.embers.Stamper.add(<metallurgy:orichalcum_ingot>, <liquid:orichalcum> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:orichalcum_nugget>, <liquid:orichalcum> * 16, <soot:stamp_nugget>);

#Osmium
mods.embers.Melter.add(<liquid:osmium> * 288, <ore:oreOsmium>);
mods.embers.Melter.add(<liquid:osmium> * 144, <ore:ingotOsmium>);
mods.embers.Melter.add(<liquid:osmium> * 144, <ore:dustOsmium>);
mods.embers.Melter.add(<liquid:osmium> * 16, <ore:nuggetOsmium>);
mods.embers.Stamper.add(<metallurgy:osmium_ingot>, <liquid:osmium> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:osmium_nugget>, <liquid:osmium> * 16, <soot:stamp_nugget>);

#Oureclase
mods.embers.Melter.add(<liquid:oureclase> * 288, <ore:oreOureclase>);
mods.embers.Melter.add(<liquid:oureclase> * 144, <ore:ingotOureclase>);
mods.embers.Melter.add(<liquid:oureclase> * 144, <ore:dustOureclase>);
mods.embers.Melter.add(<liquid:oureclase> * 16, <ore:nuggetOureclase>);
mods.embers.Stamper.add(<metallurgy:oureclase_ingot>, <liquid:oureclase> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:oureclase_nugget>, <liquid:oureclase> * 16, <soot:stamp_nugget>);

#Platinum
mods.embers.Melter.add(<liquid:platinum> * 288, <ore:orePlatinum>);
mods.embers.Melter.add(<liquid:platinum> * 144, <ore:ingotPlatinum>);
mods.embers.Melter.add(<liquid:platinum> * 144, <ore:dustPlatinum>);
mods.embers.Melter.add(<liquid:platinum> * 16, <ore:nuggetPlatinum>);
mods.embers.Stamper.add(<metallurgy:platinum_ingot>, <liquid:platinum> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:platinum_nugget>, <liquid:platinum> * 16, <soot:stamp_nugget>);

#Prometheum
mods.embers.Melter.add(<liquid:prometheum> * 288, <ore:orePrometheum>);
mods.embers.Melter.add(<liquid:prometheum> * 144, <ore:ingotPrometheum>);
mods.embers.Melter.add(<liquid:prometheum> * 144, <ore:dustPrometheum>);
mods.embers.Melter.add(<liquid:prometheum> * 16, <ore:nuggetPrometheum>);
mods.embers.Stamper.add(<metallurgy:prometheum_ingot>, <liquid:prometheum> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:prometheum_nugget>, <liquid:prometheum> * 16, <soot:stamp_nugget>);

#Rubracium
mods.embers.Melter.add(<liquid:rubracium> * 288, <ore:oreRubracium>);
mods.embers.Melter.add(<liquid:rubracium> * 144, <ore:ingotRubracium>);
mods.embers.Melter.add(<liquid:rubracium> * 144, <ore:dustRubracium>);
mods.embers.Melter.add(<liquid:rubracium> * 16, <ore:nuggetRubracium>);
mods.embers.Stamper.add(<metallurgy:rubracium_ingot>, <liquid:rubracium> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:rubracium_nugget>, <liquid:rubracium> * 16, <soot:stamp_nugget>);

#Sanguinite
mods.embers.Melter.add(<liquid:sanguinite> * 288, <ore:oreSanguinite>);
mods.embers.Melter.add(<liquid:sanguinite> * 144, <ore:ingotSanguinite>);
mods.embers.Melter.add(<liquid:sanguinite> * 144, <ore:dustSanguinite>);
mods.embers.Melter.add(<liquid:sanguinite> * 16, <ore:nuggetSanguinite>);
mods.embers.Stamper.add(<metallurgy:sanguinite_ingot>, <liquid:sanguinite> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:sanguinite_nugget>, <liquid:sanguinite> * 16, <soot:stamp_nugget>);

#Shadow Iron
mods.embers.Melter.add(<liquid:shadow_iron> * 288, <ore:oreShadowIron>);
mods.embers.Melter.add(<liquid:shadow_iron> * 144, <ore:ingotShadowIron>);
mods.embers.Melter.add(<liquid:shadow_iron> * 144, <ore:dustShadowIron>);
mods.embers.Melter.add(<liquid:shadow_iron> * 16, <ore:nuggetShadowIron>);
mods.embers.Stamper.add(<metallurgy:shadow_iron_ingot>, <liquid:shadow_iron> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:shadow_iron_nugget>, <liquid:shadow_iron> * 16, <soot:stamp_nugget>);

#Vulcanite
mods.embers.Melter.add(<liquid:vulcanite> * 288, <ore:oreVulcanite>);
mods.embers.Melter.add(<liquid:vulcanite> * 144, <ore:ingotVulcanite>);
mods.embers.Melter.add(<liquid:vulcanite> * 144, <ore:dustVulcanite>);
mods.embers.Melter.add(<liquid:vulcanite> * 16, <ore:nuggetVulcanite>);
mods.embers.Stamper.add(<metallurgy:vulcanite_ingot>, <liquid:vulcanite> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:vulcanite_nugget>, <liquid:vulcanite> * 16, <soot:stamp_nugget>);

#Vyroxeres
mods.embers.Melter.add(<liquid:vyroxeres> * 288, <ore:oreVyroxeres>);
mods.embers.Melter.add(<liquid:vyroxeres> * 144, <ore:ingotVyroxeres>);
mods.embers.Melter.add(<liquid:vyroxeres> * 144, <ore:dustVyroxeres>);
mods.embers.Melter.add(<liquid:vyroxeres> * 16, <ore:nuggetVyroxeres>);
mods.embers.Stamper.add(<metallurgy:vyroxeres_ingot>, <liquid:vyroxeres> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:vyroxeres_nugget>, <liquid:vyroxeres> * 16, <soot:stamp_nugget>);

#Zinc
mods.embers.Melter.add(<liquid:zinc> * 288, <ore:oreZinc>);
mods.embers.Melter.add(<liquid:zinc> * 144, <ore:ingotZinc>);
mods.embers.Melter.add(<liquid:zinc> * 144, <ore:dustZinc>);
mods.embers.Melter.add(<liquid:zinc> * 16, <ore:nuggetZinc>);
mods.embers.Stamper.add(<metallurgy:zinc_ingot>, <liquid:zinc> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:zinc_nugget>, <liquid:zinc> * 16, <soot:stamp_nugget>);


##Alloys##

#Amordrine
mods.embers.Melter.add(<liquid:amordrine> * 144, <ore:ingotAmordrine>);
mods.embers.Melter.add(<liquid:amordrine> * 144, <ore:dustAmordrine>);
mods.embers.Melter.add(<liquid:amordrine> * 16, <ore:nuggetAmordrine>);
mods.embers.Mixer.add(<liquid:amordrine> * 8, [<liquid:kalendrite> * 4, <liquid:platinum> * 4]);
mods.embers.Stamper.add(<metallurgy:amordrine_ingot>, <liquid:amordrine> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:amordrine_nugget>, <liquid:amordrine> * 16, <soot:stamp_nugget>);

#Angmallen
mods.embers.Melter.add(<liquid:angmallen> * 144, <ore:ingotAngmallen>);
mods.embers.Melter.add(<liquid:angmallen> * 144, <ore:dustAngmallen>);
mods.embers.Melter.add(<liquid:angmallen> * 16, <ore:nuggetAngmallen>);
mods.embers.Mixer.add(<liquid:angmallen> * 8, [<liquid:iron> * 4, <liquid:gold> * 4]);
mods.embers.Stamper.add(<metallurgy:angmallen_ingot>, <liquid:angmallen> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:angmallen_nugget>, <liquid:angmallen> * 16, <soot:stamp_nugget>);

#Black Steel
mods.embers.Melter.add(<liquid:black_steel> * 144, <ore:ingotBlackSteel>);
mods.embers.Melter.add(<liquid:black_steel> * 144, <ore:dustBlackSteel>);
mods.embers.Melter.add(<liquid:black_steel> * 16, <ore:nuggetBlackSteel>);
mods.embers.Mixer.add(<liquid:black_steel> * 8, [<liquid:deep_iron> * 6, <liquid:infuscolium> * 2]);
mods.embers.Stamper.add(<metallurgy:black_steel_ingot>, <liquid:black_steel> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:black_steel_nugget>, <liquid:black_steel> * 16, <soot:stamp_nugget>);

#Brass
mods.embers.Melter.add(<liquid:brass> * 144, <ore:ingotBrass>);
mods.embers.Melter.add(<liquid:brass> * 144, <ore:dustBrass>);
mods.embers.Melter.add(<liquid:brass> * 16, <ore:nuggetBrass>);
mods.embers.Mixer.add(<liquid:brass> * 8, [<liquid:copper> * 4, <liquid:zinc> * 2]);
mods.embers.Stamper.add(<metallurgy:brass_ingot>, <liquid:brass> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:brass_nugget>, <liquid:brass> * 16, <soot:stamp_nugget>);

#Celenegil
mods.embers.Melter.add(<liquid:celenegil> * 144, <ore:ingotCelenegil>);
mods.embers.Melter.add(<liquid:celenegil> * 144, <ore:dustCelenegil>);
mods.embers.Melter.add(<liquid:celenegil> * 16, <ore:nuggetCelenegil>);
mods.embers.Mixer.add(<liquid:celenegil> * 8, [<liquid:orichalcum> * 4, <liquid:platinum> * 4]);
mods.embers.Stamper.add(<metallurgy:celenegil_ingot>, <liquid:celenegil> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:celenegil_nugget>, <liquid:celenegil> * 16, <soot:stamp_nugget>);

#Damascus Steel
mods.embers.Melter.add(<liquid:damascus_steel> * 144, <ore:ingotDamascusSteel>);
mods.embers.Melter.add(<liquid:damascus_steel> * 144, <ore:dustDamascusSteel>);
mods.embers.Melter.add(<liquid:damascus_steel> * 16, <ore:nuggetDamascusSteel>);
mods.embers.Mixer.add(<liquid:damascus_steel> * 6, [<liquid:bronze> * 4, <liquid:iron> * 2]);
mods.embers.Stamper.add(<metallurgy:damascus_steel_ingot>, <liquid:damascus_steel> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:damascus_steel_nugget>, <liquid:damascus_steel> * 16, <soot:stamp_nugget>);

#Desichalkos
mods.embers.Melter.add(<liquid:desichalkos> * 144, <ore:ingotDesichalkos>);
mods.embers.Melter.add(<liquid:desichalkos> * 144, <ore:dustDesichalkos>);
mods.embers.Melter.add(<liquid:desichalkos> * 16, <ore:nuggetDesichalkos>);
mods.embers.Mixer.add(<liquid:desichalkos> * 8, [<liquid:eximite> * 4, <liquid:meutoite> * 4]);
mods.embers.Stamper.add(<metallurgy:desichalkos_ingot>, <liquid:desichalkos> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:desichalkos_nugget>, <liquid:desichalkos> * 16, <soot:stamp_nugget>);

#Etherium
mods.embers.Melter.add(<liquid:etherium> * 144, <ore:ingotEtherium>);
mods.embers.Melter.add(<liquid:etherium> * 144, <ore:dustEtherium>);
mods.embers.Melter.add(<liquid:etherium> * 16, <ore:nuggetEtherium>);
mods.embers.Mixer.add(<liquid:etherium> * 8, [<liquid:sanguinite> * 4, <liquid:carmot> * 4, <liquid:desichalkos> * 4]);
mods.embers.Stamper.add(<metallurgy:etherium_ingot>, <liquid:etherium> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:etherium_nugget>, <liquid:etherium> * 16, <soot:stamp_nugget>);

#Haderoth
mods.embers.Melter.add(<liquid:haderoth> * 144, <ore:ingotHaderoth>);
mods.embers.Melter.add(<liquid:haderoth> * 144, <ore:dustHaderoth>);
mods.embers.Melter.add(<liquid:haderoth> * 16, <ore:nuggetHaderoth>);
mods.embers.Mixer.add(<liquid:haderoth> * 6, [<liquid:mithril> * 2, <liquid:rubracium> * 4]);
mods.embers.Stamper.add(<metallurgy:haderoth_ingot>, <liquid:haderoth> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:haderoth_nugget>, <liquid:haderoth> * 16, <soot:stamp_nugget>);

#Hepatizon
mods.embers.Melter.add(<liquid:hepatizon> * 144, <ore:ingotHepatizon>);
mods.embers.Melter.add(<liquid:hepatizon> * 144, <ore:dustHepatizon>);
mods.embers.Melter.add(<liquid:hepatizon> * 16, <ore:nuggetHepatizon>);
mods.embers.Mixer.add(<liquid:hepatizon> * 8, [<liquid:infuscolium> * 4, <liquid:steel> * 4]);
mods.embers.Stamper.add(<metallurgy:hepatizon_ingot>, <liquid:hepatizon> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:hepatizon_nugget>, <liquid:hepatizon> * 16, <soot:stamp_nugget>);

#Inolashite
mods.embers.Melter.add(<liquid:inolashite> * 144, <ore:ingotInolashite>);
mods.embers.Melter.add(<liquid:inolashite> * 144, <ore:dustInolashite>);
mods.embers.Melter.add(<liquid:inolashite> * 16, <ore:nuggetInolashite>);
mods.embers.Mixer.add(<liquid:inolashite> * 8, [<liquid:alduorite> * 4, <liquid:ceruclase> * 4]);
mods.embers.Stamper.add(<metallurgy:inolashite_ingot>, <liquid:inolashite> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:inolashite_nugget>, <liquid:inolashite> * 16, <soot:stamp_nugget>);

#Krik
mods.embers.Melter.add(<liquid:krik> * 144, <ore:ingotKrik>);
mods.embers.Melter.add(<liquid:krik> * 144, <ore:dustKrik>);
mods.embers.Melter.add(<liquid:krik> * 16, <ore:nuggetKrik>);
mods.embers.Mixer.add(<liquid:krik> * 8, [<liquid:osmium> * 4, <liquid:lutetium> * 4]);
mods.embers.Stamper.add(<metallurgy:krik_ingot>, <liquid:krik> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:krik_nugget>, <liquid:krik> * 16, <soot:stamp_nugget>);

#Quicksilver
mods.embers.Melter.add(<liquid:quicksilver> * 144, <ore:ingotQuicksilver>);
mods.embers.Melter.add(<liquid:quicksilver> * 144, <ore:dustQuicksilver>);
mods.embers.Melter.add(<liquid:quicksilver> * 16, <metallurgy:quicksilver_nugget>);
mods.embers.Mixer.add(<liquid:quicksilver> * 8, [<liquid:mithril> * 4, <liquid:silver> * 4]);
mods.embers.Stamper.add(<metallurgy:quicksilver_ingot>, <liquid:quicksilver> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:quicksilver_nugget>, <liquid:quicksilver> * 16, <soot:stamp_nugget>);

#Shadow Steel
mods.embers.Melter.add(<liquid:shadow_steel> * 144, <ore:ingotShadowSteel>);
mods.embers.Melter.add(<liquid:shadow_steel> * 144, <ore:dustShadowSteel>);
mods.embers.Melter.add(<liquid:shadow_steel> * 16, <ore:nuggetShadowSteel>);
mods.embers.Mixer.add(<liquid:shadow_steel> * 6, [<liquid:shadow_iron> * 4, <liquid:lemurite> * 2]);
mods.embers.Stamper.add(<metallurgy:shadow_steel_ingot>, <liquid:shadow_steel> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:shadow_steel_nugget>, <liquid:shadow_steel> * 16, <soot:stamp_nugget>);

#Steel
mods.embers.Melter.add(<liquid:steel> * 144, <ore:ingotSteel>);
mods.embers.Melter.add(<liquid:steel> * 144, <ore:dustSteel>);
mods.embers.Melter.add(<liquid:steel> * 16, <ore:nuggetSteel>);
mods.embers.Mixer.add(<liquid:steel> * 8, [<liquid:manganese> * 16, <liquid:iron> * 8]);
mods.embers.Stamper.add(<metallurgy:steel_ingot>, <liquid:steel> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:steel_nugget>, <liquid:steel> * 16, <soot:stamp_nugget>);

#Tartarite
mods.embers.Melter.add(<liquid:tartarite> * 144, <ore:ingotTartarite>);
mods.embers.Melter.add(<liquid:tartarite> * 144, <ore:dustTartarite>);
mods.embers.Melter.add(<liquid:tartarite> * 16, <ore:nuggetTartarite>);
mods.embers.Mixer.add(<liquid:tartarite> * 8, [<liquid:adamantine> * 8, <liquid:atlarus> * 8, <liquid:shadow_steel> * 8]);
mods.embers.Stamper.add(<metallurgy:tartarite_ingot>, <liquid:tartarite> * 144, <embers:stamp_bar>);
mods.embers.Stamper.add(<metallurgy:tartarite_nugget>, <liquid:tartarite> * 16, <soot:stamp_nugget>);


##Embers CT support formatting
#mods.embers.Melter.add(ILiquidStack outputfluid, IIngredient input, @Optional secondaryfluidoutput);
#mods.embers.Stamper.add(IItemStack output, ILiquidStack liquid, IIngredient stamp, @Optional IIngredient input);
#mods.embers.Mixer.add(ILiquidStack outputfluid, ILiquidStack[] inputfluids);