import moretweaker.bewitchment.WitchesRitual;

# Gating Betweenlands Swamp Talisman with Bewitchment Witches' Ritual
recipes.remove(<thebetweenlands:swamp_talisman>);

WitchesRitual.addRecipe(
    "swamp_talisman",
    [<thebetweenlands:swamp_talisman>],
    [
        <thebetweenlands:swamp_talisman:1>,
        <thebetweenlands:swamp_talisman:2>,
        <thebetweenlands:swamp_talisman:3>,
        <thebetweenlands:swamp_talisman:4>,
        <bewitchment:mandrake_root>,
        <bewitchment:belladonna>
    ],
    null, null, 2000,
    WitchesRitual.PHASING, WitchesRitual.RITUAL, WitchesRitual.PHASING
);
