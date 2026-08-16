#priority 50
import crafttweaker.item.IItemStack;
import mods.jei.JEI;

// SaltyMod: Disable & Hide Redundant Salts and Food Items
// (Preserves Salt Blocks, Bricks, Worldgen Dirt/Ores, and Salt Lamps)

val saltmodItemsToHide = [
    // Redundant Salts
    "saltmod:salt_pinch",
    "saltmod:salt",

    // Pies
    "saltmod:apple_pie",
    "saltmod:carrot_pie",
    "saltmod:fish_pie",
    "saltmod:fish_salmon_pie",
    "saltmod:mushroom_pie",
    "saltmod:onion_pie",
    "saltmod:potato_pie",
    "saltmod:saltwort_pie",

    // Salads, Soups & Stews
    "saltmod:beetroot_salad",
    "saltmod:dandelion_salad",
    "saltmod:fruit_salad",
    "saltmod:fish_soup",
    "saltmod:fish_salmon_soup",
    "saltmod:salt_beetroot_salad",
    "saltmod:salt_beetroot_soup",
    "saltmod:salt_dandelion_salad",
    "saltmod:salt_fish_soup",
    "saltmod:salt_fish_salmon_soup",
    "saltmod:salt_mushroom_stew",
    "saltmod:salt_rabbit_stew",
    "saltmod:salt_vegetable_stew",
    "saltmod:saltwort_salad",
    "saltmod:vegetable_stew",

    // Salted Meats & Dishes
    "saltmod:corned_beef",
    "saltmod:escargot",
    "saltmod:grated_carrot",
    "saltmod:hemoglobin",
    "saltmod:muffin",
    "saltmod:pickled_fern",
    "saltmod:pickled_mushroom",
    "saltmod:potato_mushroom",
    "saltmod:powdered_milk",
    "saltmod:pumpkin_porridge",
    "saltmod:salt_beef_cooked",
    "saltmod:salt_beetroot",
    "saltmod:salt_bread",
    "saltmod:salt_chicken_cooked",
    "saltmod:salt_egg",
    "saltmod:salt_fish_clownfish",
    "saltmod:salt_fish_cod",
    "saltmod:salt_fish_cod_cooked",
    "saltmod:salt_fish_salmon",
    "saltmod:salt_fish_salmon_cooked",
    "saltmod:salt_mutton_cooked",
    "saltmod:salt_porkchop_cooked",
    "saltmod:salt_potato_baked",
    "saltmod:salt_potato_mushroom",
    "saltmod:salt_rabbit_cooked",
    "saltmod:salt_wheat_sprouts",
    "saltmod:wheat_sprouts",
    "saltmod:saltwort_beef",
    "saltmod:saltwort_mutton",
    "saltmod:saltwort_porkchop",

    // Drinks
    "saltmod:fizzy_drink",
    "saltmod:soda",

    // Cross-Mod Compatibility Foods
    "saltmod:bop_pickled_turnip",
    "saltmod:bop_poison",
    "saltmod:bop_salt_rice_bowl",
    "saltmod:bop_salt_salad_shroom",
    "saltmod:bop_salt_salad_veggie",
    "saltmod:bop_salt_shroom_powder",
    "saltmod:tf_pickled_mushgloom",
    "saltmod:tf_salt_hydra_chop",
    "saltmod:tf_salt_meef_steak",
    "saltmod:tf_salt_meef_stroganoff",
    "saltmod:tf_salt_venison_cooked",
    "saltmod:tf_saltwort_meef_steak",
    "saltmod:tf_saltwort_venison"
] as string[];

for id in saltmodItemsToHide {
    val item = itemUtils.getItem(id);
    if (!isNull(item)) {
        recipes.remove(item);
        JEI.hide(item);
    }
}
