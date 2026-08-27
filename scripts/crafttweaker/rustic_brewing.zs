#priority 70
import crafttweaker.item.IItemStack;
import mods.rustic.Condenser;

// Cold Resistance Elixir (Cohosh + Belladonna)
Condenser.addRecipe(
    <rustic:elixir>.withTag({ElixirEffects: [{Effect: "simpledifficulty:cold_resist", Duration: 3600, Amplifier: 0}]}),
    [<rustic:cohosh>, <bewitchment:belladonna>]
);

// Extended Cold Resistance Elixir (Cohosh + Belladonna + Horsetail)
Condenser.addRecipe(
    <rustic:elixir>.withTag({ElixirEffects: [{Effect: "simpledifficulty:cold_resist", Duration: 9600, Amplifier: 0}]}),
    [<rustic:cohosh>, <bewitchment:belladonna>],
    <rustic:horsetail>
);

// Heat Resistance Elixir (Cohosh + Hellebore)
Condenser.addRecipe(
    <rustic:elixir>.withTag({ElixirEffects: [{Effect: "simpledifficulty:heat_resist", Duration: 3600, Amplifier: 0}]}),
    [<rustic:cohosh>, <bewitchment:hellebore>]
);

// Extended Heat Resistance Elixir (Cohosh + Hellebore + Horsetail)
Condenser.addRecipe(
    <rustic:elixir>.withTag({ElixirEffects: [{Effect: "simpledifficulty:heat_resist", Duration: 9600, Amplifier: 0}]}),
    [<rustic:cohosh>, <bewitchment:hellebore>],
    <rustic:horsetail>
);


// Replenishment Elixir (Dried Tea + Wind Thistle) - 3:00
Condenser.addRecipe(
    <rustic:elixir>.withTag({ElixirEffects: [{Effect: "elenaidodge2:replenishment", Duration: 3600, Amplifier: 0}]}),
    [<teastory:dried_tea>, <rustic:wind_thistle>]
);

// Extended Replenishment Elixir (Dried Tea + Wind Thistle + Horsetail) - 8:00
Condenser.addRecipe(
    <rustic:elixir>.withTag({ElixirEffects: [{Effect: "elenaidodge2:replenishment", Duration: 9600, Amplifier: 0}]}),
    [<teastory:dried_tea>, <rustic:wind_thistle>],
    <rustic:horsetail>
);

// Feathers Elixir (Ginseng + Wind Thistle) - 3:00
Condenser.addRecipe(
    <rustic:elixir>.withTag({ElixirEffects: [{Effect: "elenaidodge2:feathers", Duration: 3600, Amplifier: 0}]}),
    [<rustic:ginseng>, <rustic:wind_thistle>]
);

// Extended Feathers Elixir (Ginseng + Wind Thistle + Horsetail) - 8:00
Condenser.addRecipe(
    <rustic:elixir>.withTag({ElixirEffects: [{Effect: "elenaidodge2:feathers", Duration: 9600, Amplifier: 0}]}),
    [<rustic:ginseng>, <rustic:wind_thistle>],
    <rustic:horsetail>
);

// Repair Elixir (Isolated Materia + Ironberries) - 3:00
Condenser.addRecipe(
    <rustic:elixir>.withTag({ElixirEffects: [{Effect: "potioncore:repair", Duration: 3600, Amplifier: 0}]}),
    [<embers:isolated_materia>, <rustic:ironberries>]
);

// Extended Repair Elixir (Isolated Materia + Ironberries + Iron Ingot + Diamond) - 8:00
Condenser.addRecipe(
    <rustic:elixir>.withTag({ElixirEffects: [{Effect: "potioncore:repair", Duration: 9600, Amplifier: 0}]}),
    [<embers:isolated_materia>, <rustic:ironberries>, <ore:ingotIron>],
    <minecraft:diamond>
);

// --- Wither & Blazing Trail Elixir Removals ---
val wither_standard = <rustic:elixir>.withTag({ElixirEffects: [{Effect: "minecraft:wither", Duration: 3600, Amplifier: 0}]});
val wither_extended = <rustic:elixir>.withTag({ElixirEffects: [{Effect: "minecraft:wither", Duration: 9600, Amplifier: 0}]});
val wither_enhanced = <rustic:elixir>.withTag({ElixirEffects: [{Effect: "minecraft:wither", Duration: 1800, Amplifier: 1}]});

val blazing_trail_standard = <rustic:elixir>.withTag({ElixirEffects: [{Effect: "rustic:blazing_trail", Duration: 3600, Amplifier: 0}]});
val blazing_trail_extended = <rustic:elixir>.withTag({ElixirEffects: [{Effect: "rustic:blazing_trail", Duration: 9600, Amplifier: 0}]});

Condenser.removeRecipe(wither_standard);
Condenser.removeRecipe(wither_extended);
Condenser.removeRecipe(wither_enhanced);
Condenser.removeRecipe(blazing_trail_standard);
Condenser.removeRecipe(blazing_trail_extended);

mods.jei.JEI.hide(wither_standard);
mods.jei.JEI.hide(wither_extended);
mods.jei.JEI.hide(wither_enhanced);
mods.jei.JEI.hide(blazing_trail_standard);
mods.jei.JEI.hide(blazing_trail_extended);

