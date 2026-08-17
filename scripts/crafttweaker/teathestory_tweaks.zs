#priority 50
import crafttweaker.item.IItemStack;
import mods.jei.JEI;

// Tea the Story: Comprehensive Pruning & JEI Hiding

val teaStoryPrunedItems = [
    // Standalone cup & pot items
    <teastory:clay_cup>,
    <teastory:zisha_clay_cup>,
    <teastory:pot_clay>,
    <teastory:pot_zisha_clay>,
    <teastory:pot_stone>,
    <teastory:pot_iron>,
    <teastory:pot_porcelain>,
    <teastory:pot_zisha>,
    <teastory:cold_water_pot_stone>,
    <teastory:cold_water_pot_iron>,
    <teastory:cold_water_pot_porcelain>,
    <teastory:cold_water_pot_zisha>,
    <teastory:boiled_water_pot_stone>,
    <teastory:boiled_water_pot_iron>,
    <teastory:boiled_water_pot_porcelain>,
    <teastory:boiled_water_pot_zisha>,

    // Empty cups (0=wood, 2=stone, 3=glass, 4=porcelain, 5=zisha)
    <teastory:cup:0>,
    <teastory:cup:2>,
    <teastory:cup:3>,
    <teastory:cup:4>,
    <teastory:cup:5>,

    // Filled tea cups
    <teastory:green_tea:0>,
    <teastory:green_tea:2>,
    <teastory:green_tea:3>,
    <teastory:green_tea:4>,
    <teastory:green_tea:5>,

    <teastory:matcha_drink:0>,
    <teastory:matcha_drink:2>,
    <teastory:matcha_drink:3>,
    <teastory:matcha_drink:4>,
    <teastory:matcha_drink:5>,

    <teastory:black_tea:0>,
    <teastory:black_tea:2>,
    <teastory:black_tea:3>,
    <teastory:black_tea:4>,
    <teastory:black_tea:5>,

    <teastory:milk_tea:0>,
    <teastory:milk_tea:2>,
    <teastory:milk_tea:3>,
    <teastory:milk_tea:4>,
    <teastory:milk_tea:5>,

    <teastory:lemon_tea:0>,
    <teastory:lemon_tea:2>,
    <teastory:lemon_tea:3>,
    <teastory:lemon_tea:4>,
    <teastory:lemon_tea:5>,

    <teastory:yellow_tea:0>,
    <teastory:yellow_tea:2>,
    <teastory:yellow_tea:3>,
    <teastory:yellow_tea:4>,
    <teastory:yellow_tea:5>,

    <teastory:white_tea:0>,
    <teastory:white_tea:2>,
    <teastory:white_tea:3>,
    <teastory:white_tea:4>,
    <teastory:white_tea:5>,

    <teastory:oolong_tea:0>,
    <teastory:oolong_tea:2>,
    <teastory:oolong_tea:3>,
    <teastory:oolong_tea:4>,
    <teastory:oolong_tea:5>,

    <teastory:puer_tea:0>,
    <teastory:puer_tea:2>,
    <teastory:puer_tea:3>,
    <teastory:puer_tea:4>,
    <teastory:puer_tea:5>,

    // All Kettles
    <teastory:clay_kettle>,
    <teastory:zisha_clay_kettle>,
    <teastory:empty_porcelain_kettle>,
    <teastory:empty_zisha_kettle>,
    <teastory:green_tea_porcelain_kettle>,
    <teastory:matcha_drink_porcelain_kettle>,
    <teastory:black_tea_porcelain_kettle>,
    <teastory:milk_tea_porcelain_kettle>,
    <teastory:lemon_tea_porcelain_kettle>,
    <teastory:yellow_tea_porcelain_kettle>,
    <teastory:white_tea_porcelain_kettle>,
    <teastory:oolong_tea_porcelain_kettle>,
    <teastory:puer_tea_porcelain_kettle>,
    <teastory:green_tea_zisha_kettle>,
    <teastory:matcha_drink_zisha_kettle>,
    <teastory:black_tea_zisha_kettle>,
    <teastory:milk_tea_zisha_kettle>,
    <teastory:lemon_tea_zisha_kettle>,
    <teastory:yellow_tea_zisha_kettle>,
    <teastory:white_tea_zisha_kettle>,
    <teastory:oolong_tea_zisha_kettle>,
    <teastory:puer_tea_zisha_kettle>,

    // Tea Bags
    <teastory:empty_tea_bag>,
    <teastory:green_tea_bag>,
    <teastory:black_tea_bag>,
    <teastory:yellow_tea_bag>,
    <teastory:white_tea_bag>,
    <teastory:oolong_tea_bag>,
    <teastory:puer_tea_bag>,

    // Rice items (Unified under Farmer's Delight)
    <teastory:xian_rice_seeds>,
    <teastory:item_xian_rice_seedling>,
    <teastory:xian_rice>,
    <teastory:washed_rice>,
    <teastory:rice_ball>,
    <teastory:porkchop_rice>,
    <teastory:steak_rice>,
    <teastory:chicken_rice>,
    <teastory:potato_rice>,
    <teastory:rabbit_rice>,

    // Straw Items
    <teastory:straw_rope>,
    <teastory:item_straw_blanket>,
    <teastory:straw_cushion>,

    // Machinery, Stoves & Cooking Tools
    <teastory:tea_drying_pan>,
    <teastory:wooden_lid>,
    <teastory:tea_stove>,
    <teastory:tea_whisk>,
    <teastory:wooden_mortar_and_pestle>,
    <teastory:soil_detection_meter>,
    <teastory:sickle>,

    // Disabled Leaf Types, Powders & Unused Residues (Residues 0-3 remain enabled in JEI)
    <teastory:matcha_leaf>,
    <teastory:matcha_powder>,
    <teastory:oolong_tea_leaf>,
    <teastory:puer_tea_leaf>,
    <teastory:tea_residue:4>,
    <teastory:tea_residue:5>,

    // Miscellaneous Food & Materials
    <teastory:zisha_clay>,
    <teastory:tea_egg>,
    <teastory:matcha_cookie>,
    <teastory:half_dried_leaf_block>
] as IItemStack[];

for item in teaStoryPrunedItems {
    recipes.remove(item);
    JEI.hide(item);
}

// Hide Straw & Lemon from JEI (Farmer's Delight Straw & Extra Delight Lemon are canonical)
JEI.hide(<teastory:straw>);
JEI.hide(<teastory:lemon>);
