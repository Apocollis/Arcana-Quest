#priority 50
import crafttweaker.item.IItemStack;
import mods.jei.JEI;

// Tea the Story: Disable & Hide Cups, Pots, Kettles, and Custom Drinkware from JEI
// Custom fluids handle all teas in Arcana Quest

val teaContainersToHide = [
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

    // Empty cups (metadata variants: 0=wood, 2=stone, 3=glass, 4=porcelain, 5=zisha)
    <teastory:cup:0>,
    <teastory:cup:2>,
    <teastory:cup:3>,
    <teastory:cup:4>,
    <teastory:cup:5>,

    // Green Tea cups
    <teastory:green_tea:0>,
    <teastory:green_tea:2>,
    <teastory:green_tea:3>,
    <teastory:green_tea:4>,
    <teastory:green_tea:5>,

    // Matcha Drink cups
    <teastory:matcha_drink:0>,
    <teastory:matcha_drink:2>,
    <teastory:matcha_drink:3>,
    <teastory:matcha_drink:4>,
    <teastory:matcha_drink:5>,

    // Black Tea cups
    <teastory:black_tea:0>,
    <teastory:black_tea:2>,
    <teastory:black_tea:3>,
    <teastory:black_tea:4>,
    <teastory:black_tea:5>,

    // Milk Tea cups
    <teastory:milk_tea:0>,
    <teastory:milk_tea:2>,
    <teastory:milk_tea:3>,
    <teastory:milk_tea:4>,
    <teastory:milk_tea:5>,

    // Lemon Tea cups
    <teastory:lemon_tea:0>,
    <teastory:lemon_tea:2>,
    <teastory:lemon_tea:3>,
    <teastory:lemon_tea:4>,
    <teastory:lemon_tea:5>,

    // Yellow Tea cups
    <teastory:yellow_tea:0>,
    <teastory:yellow_tea:2>,
    <teastory:yellow_tea:3>,
    <teastory:yellow_tea:4>,
    <teastory:yellow_tea:5>,

    // White Tea cups
    <teastory:white_tea:0>,
    <teastory:white_tea:2>,
    <teastory:white_tea:3>,
    <teastory:white_tea:4>,
    <teastory:white_tea:5>,

    // Oolong Tea cups
    <teastory:oolong_tea:0>,
    <teastory:oolong_tea:2>,
    <teastory:oolong_tea:3>,
    <teastory:oolong_tea:4>,
    <teastory:oolong_tea:5>,

    // Puer Tea cups
    <teastory:puer_tea:0>,
    <teastory:puer_tea:2>,
    <teastory:puer_tea:3>,
    <teastory:puer_tea:4>,
    <teastory:puer_tea:5>
] as IItemStack[];

for item in teaContainersToHide {
    recipes.remove(item);
    JEI.hide(item);
}
