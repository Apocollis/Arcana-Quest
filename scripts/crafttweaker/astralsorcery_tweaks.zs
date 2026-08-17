#priority 50
import crafttweaker.block.IBlockState;

// Set Starmetal Ore Harvest Level to 3 (Diamond tier) for WAILA/Hwyla display
val starmetalState as IBlockState = <blockstate:astralsorcery:blockcustomore:oretype=starmetal>;
starmetalState.block.definition.setHarvestLevel("pickaxe", 3, starmetalState);
