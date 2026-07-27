#priority 70
import crafttweaker.item.IItemStack;
import mods.rustic.Condenser;

// Cold Resistance Elixir (Cohosh + Belladonna)
Condenser.addRecipe(
    <rustic:elixir>.withTag({ElixirEffects: [{Effect: "simpledifficulty:cold_resist", Duration: 3600, Amplifier: 0}]}),
    [<rustic:cohosh>, <bewitchment:belladonna>]
);

// Heat Resistance Elixir (Cohosh + Hellebore)
Condenser.addRecipe(
    <rustic:elixir>.withTag({ElixirEffects: [{Effect: "simpledifficulty:heat_resist", Duration: 3600, Amplifier: 0}]}),
    [<rustic:cohosh>, <bewitchment:hellebore>]
);
