#priority 75
import crafttweaker.item.IItemStack;
import mods.atum.SpinningWheel;
import mods.jei.JEI;

// ==========================================
// Deprecate & Hide Atum Spinning Wheel
// ==========================================

// Remove crafting recipes for the Atum Spinning Wheel block
recipes.remove(<atum:spinning_wheel>);

// Hide the Spinning Wheel item from JEI
JEI.hide(<atum:spinning_wheel>);

// Remove all machine recipes using the Atum Spinning Wheel
SpinningWheel.removeRecipe("atum:flax");
SpinningWheel.removeRecipe("atum:wolf_pelt");
SpinningWheel.removeRecipe("atum:cloth_scrap");

// Hide the Atum Spinning Wheel recipe category from JEI
JEI.hideCategory("atum.spinningwheel");
