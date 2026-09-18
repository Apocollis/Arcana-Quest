import mods.bewitchment.SpinningWheel;

// ====================================================
// Bewitchment Spinning Wheel - Ported Atum Recipes
// ====================================================

// 1. Flax -> 3 Linen Thread
SpinningWheel.addRecipe(
    "flax_to_linen_thread",
    <atum:linen_thread> * 3,
    [
        <ore:cropFlax>
    ]
);

// 2. Desert Wolf Pelt -> 2 String
SpinningWheel.addRecipe(
    "wolf_pelt_to_string",
    <minecraft:string> * 2,
    [
        <atum:wolf_pelt>
    ]
);

// 3. Cloth Scrap -> 1 Linen Thread
SpinningWheel.addRecipe(
    "scrap_to_linen_thread",
    <atum:linen_thread>,
    [
        <atum:cloth_scrap>
    ]
);
