// Import the necessary package
import mods.astralsorcery.StarlightInfusion;

// Syntax: 
// mods.astralsorcery.StarlightInfusion.addInfusion(input, output, consumeMultiple, consumptionChance, craftingTickTime);

mods.astralsorcery.StarlightInfusion.addInfusion(
    <embers:ingot_silver>,            // Input (the Silver Ingot)
    <metallurgy:astral_silver_ingot>, // Output
    false,                      // consumeMultiple (set to false)
    0.7,                        // consumptionChance (70% chance to consume the catalyst/input)
    200                         // craftingTickTime (duration in ticks)
);