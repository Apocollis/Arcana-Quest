#priority 70
import crafttweaker.item.IItemStack;
import mods.chisel.Carving;

// 1. Earthworks Timber Framed Wattle & Daub Chisel Group
val daubCobBlocks = [
    <earthworks:daub_cob_bottom_l>,
    <earthworks:daub_cob_bottom>,
    <earthworks:daub_cob_bottom_r>,
    <earthworks:daub_cob_left>,
    <earthworks:daub_cob_parallel_hor>,
    <earthworks:daub_cob_parallel_vert>,
    <earthworks:daub_cob_right>,
    <earthworks:daub_cob_slash_back>,
    <earthworks:daub_cob_slash>,
    <earthworks:daub_cob_square>,
    <earthworks:daub_cob_square_x>,
    <earthworks:daub_cob_top_l>,
    <earthworks:daub_cob_top>,
    <earthworks:daub_cob_top_r>,
    <earthworks:daub_cob_xbottom>,
    <earthworks:daub_cob_xleft>,
    <earthworks:daub_cob_x>,
    <earthworks:daub_cob_xright>,
    <earthworks:daub_cob_xtop>
] as IItemStack[];

Carving.addGroup("earthworks_wattle_daub");
for block in daubCobBlocks {
    Carving.addVariation("earthworks_wattle_daub", block);
}

// 2. Earthworks Timber Framed Lath & Plaster Chisel Group
val plasterBlocks = [
    <earthworks:plaster_bottom_l>,
    <earthworks:plaster_bottom>,
    <earthworks:plaster_bottom_r>,
    <earthworks:plaster_left>,
    <earthworks:plaster_parallel_hor>,
    <earthworks:plaster_parallel_vert>,
    <earthworks:plaster_right>,
    <earthworks:plaster_slash_back>,
    <earthworks:plaster_slash>,
    <earthworks:plaster_square>,
    <earthworks:plaster_square_x>,
    <earthworks:plaster_top_l>,
    <earthworks:plaster_top>,
    <earthworks:plaster_top_r>,
    <earthworks:plaster_xbottom>,
    <earthworks:plaster_xleft>,
    <earthworks:plaster_x>,
    <earthworks:plaster_xright>,
    <earthworks:plaster_xtop>
] as IItemStack[];

Carving.addGroup("earthworks_lath_plaster");
for block in plasterBlocks {
    Carving.addVariation("earthworks_lath_plaster", block);
}

// 3. Structurize Timber Frame Chisel Groups
val structurizeWoods = ["oak", "spruce", "birch", "jungle", "acacia", "dark_oak"] as string[];
val structurizeShapes = [
    "plain",
    "framed",
    "sideframed",
    "doublecrossed",
    "onecrossedlr",
    "onecrossedrl",
    "gateframed",
    "downgated",
    "horizontalplain",
    "horizontalnocap"
] as string[];

for wood in structurizeWoods {
    val groupName = "structurize_timber_frame_" + wood;
    Carving.addGroup(groupName);
    
    for shape in structurizeShapes {
        val itemId = "structurize:blocktimberframe_" + wood + "_" + shape;
        val block = itemUtils.getItem(itemId);
        if (!isNull(block)) {
            Carving.addVariation(groupName, block);
            val oreKey = "timberFrame" + wood;
            oreDict[oreKey].add(block);
        }
    }
}
