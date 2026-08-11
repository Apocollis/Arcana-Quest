#priority 80
import crafttweaker.item.IItemStack;
import mods.jei.JEI;

val disabledExtraDelightItems = [
    // Fast foods & Diner items
    <extradelightlegacy:croque_monsieur>,
    <extradelightlegacy:croque_madame>,
    <extradelightlegacy:sos>,
    <extradelightlegacy:chicken_fried_steak>,
    <extradelightlegacy:chicken_parm>,
    <extradelightlegacy:jalapeno_popper>,
    <extradelightlegacy:chili_cheese_cornbread_muffin>,
    <extradelightlegacy:seaweed_crisps>,

    // Modern Confectionery & Snacks
    <extradelightlegacy:smore>,
    <extradelightlegacy:graham_cracker>,
    <extradelightlegacy:marshmallow>,
    <extradelightlegacy:dark_chocolate_dipped_marshmallow>,
    <extradelightlegacy:milk_chocolate_dipped_marshmallow>,
    <extradelightlegacy:white_chocolate_dipped_marshmallow>,
    <extradelightlegacy:blood_chocolate_dipped_marshmallow>,
    <extradelightlegacy:dark_chocolate_dipped_graham_cracker>,
    <extradelightlegacy:milk_chocolate_dipped_graham_cracker>,
    <extradelightlegacy:white_chocolate_dipped_graham_cracker>,
    <extradelightlegacy:blood_chocolate_dipped_graham_cracker>,
    <extradelightlegacy:dark_chocolate_dipped_bacon>,
    <extradelightlegacy:milk_chocolate_dipped_bacon>,
    <extradelightlegacy:white_chocolate_dipped_bacon>,
    <extradelightlegacy:blood_chocolate_dipped_bacon>,

    // Modern Ice Creams
    <extradelightlegacy:ice_cream_sundae>,
    <extradelightlegacy:cookie_dough_ice_cream>,

    // Novelty Character Cookies & Gingerbread Shapes
    <extradelightlegacy:raw_sugar_cookie_alex>,
    <extradelightlegacy:raw_sugar_cookie_creeper>,
    <extradelightlegacy:raw_sugar_cookie_pickaxe>,
    <extradelightlegacy:raw_sugar_cookie_steve>,
    <extradelightlegacy:raw_sugar_cookie_sword>,
    <extradelightlegacy:raw_sugar_cookie_villager>,
    <extradelightlegacy:raw_sugar_cookie_diamond>,
    <extradelightlegacy:raw_sugar_cookie_emerald>,
    <extradelightlegacy:sugar_cookie_alex>,
    <extradelightlegacy:sugar_cookie_creeper>,
    <extradelightlegacy:sugar_cookie_pickaxe>,
    <extradelightlegacy:sugar_cookie_steve>,
    <extradelightlegacy:sugar_cookie_sword>,
    <extradelightlegacy:sugar_cookie_villager>,
    <extradelightlegacy:sugar_cookie_diamond>,
    <extradelightlegacy:sugar_cookie_emerald>,
    <extradelightlegacy:raw_gingerbread_alex>,
    <extradelightlegacy:raw_gingerbread_creeper>,
    <extradelightlegacy:raw_gingerbread_pickaxe>,
    <extradelightlegacy:raw_gingerbread_steve>,
    <extradelightlegacy:raw_gingerbread_sword>,
    <extradelightlegacy:raw_gingerbread_villager>,
    <extradelightlegacy:raw_gingerbread_diamond>,
    <extradelightlegacy:raw_gingerbread_emerald>,
    <extradelightlegacy:gingerbread_alex>,
    <extradelightlegacy:gingerbread_creeper>,
    <extradelightlegacy:gingerbread_pickaxe>,
    <extradelightlegacy:gingerbread_steve>,
    <extradelightlegacy:gingerbread_sword>,
    <extradelightlegacy:gingerbread_villager>,
    <extradelightlegacy:gingerbread_diamond>,
    <extradelightlegacy:gingerbread_emerald>
] as IItemStack[];

for item in disabledExtraDelightItems {
    recipes.remove(item);
    JEI.hide(item);
}

// Remove and hide all Wallpapers and Molded Wallpapers
val wallpaperColors = [
    "white", "orange", "magenta", "light_blue", "yellow", "lime", "pink", "gray",
    "light_gray", "cyan", "purple", "blue", "brown", "green", "red", "black"
] as string[];

val woodTypes = ["oak", "spruce", "birch", "jungle", "acacia", "dark_oak"] as string[];

for color in wallpaperColors {
    val wpItem = itemUtils.getItem("extradelightlegacy:wallpaper_" + color);
    if (!isNull(wpItem)) {
        recipes.remove(wpItem);
        JEI.hide(wpItem);
    }
    for wood in woodTypes {
        val mwpItem = itemUtils.getItem("extradelightlegacy:" + wood + "_molded_" + color + "_wallpaper");
        if (!isNull(mwpItem)) {
            recipes.remove(mwpItem);
            JEI.hide(mwpItem);
        }
    }
}
