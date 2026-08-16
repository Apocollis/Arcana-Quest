#priority 90
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;

// 1. Canonical Rope
val oreRope = <ore:rope>;
oreRope.add(<farmersdelight:rope>);

// 2. Canonical Tomato & Chili
val oreTomato = <ore:cropTomato>;
oreTomato.add(<farmersdelight:tomato>);

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

