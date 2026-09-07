#priority 90
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;

// 1. Canonical Rope
val oreRope = <ore:rope>;
oreRope.add(<farmersdelight:rope>);

// 2. Canonical Tomato & Chili
val oreTomato = <ore:cropTomato>;
oreTomato.add(<rustic:tomato>);
<ore:tomato>.add(<rustic:tomato>);

val oreChili = <ore:cropChili>;
oreChili.add(<rustic:chili_pepper>);

// 3. Canonical Seeds
val oreSeedTomato = <ore:seedTomato>;
oreSeedTomato.add(<rustic:tomato_seeds>);

val oreSeedChili = <ore:seedChili>;
oreSeedChili.add(<rustic:chili_pepper_seeds>);

// 4. Amethyst unification
val oreAmethyst = <ore:gemAmethyst>;
oreAmethyst.add(<bewitchment:amethyst>);

// 5. Canonical Salt Unification (<bewitchment:salt>)
val saltOres = [
    <ore:dustSalt>,
    <ore:foodSalt>,
    <ore:itemSalt>,
    <ore:salt>,
    <ore:allSalt>
] as IOreDictEntry[];

for ore in saltOres {
    ore.add(<bewitchment:salt>);
}

// 6. Glow Berry unification (Dungeon Additions)
val oreGlowBerry = <ore:cropBerryGlow>;
oreGlowBerry.add(<da:glow_berry>);

// 7. Kelp unification (Biomes O Plenty)
val oreKelp = <ore:cropKelp>;
oreKelp.add(<biomesoplenty:seaweed>);
<ore:kelp>.add(<biomesoplenty:seaweed>);
<ore:foodKelpDried>.add(<biomesoplenty:seaweed>);
<ore:mayBeKelp>.remove(<minecraft:reeds>);
<ore:mayBeKelp>.add(<biomesoplenty:seaweed>);

