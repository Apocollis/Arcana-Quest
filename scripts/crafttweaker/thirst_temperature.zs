#priority 30
import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;
import mods.hungertweaker.SimpleDifficulty;
import mods.hungertweaker.events.HungerEvents;
import mods.hungertweaker.events.SimpleDifficultyDrinkEvent;

// ================================================================================
// Arcana Quest: Simple Difficulty Drink & Temperature Integrations
// Dynamic thermal reactions and custom drink behaviors calibrated to the HUD:
// - Cooling drinks active at temp >= 12 (Yellow/Warm+), clamped at 11 (Neutral Green)
// - Warming drinks active at temp <= 9 (Cyan/Cool-), clamped at 10 (Neutral Green)
// - Neutral band (10 - 11) is stable comfort equilibrium
// ================================================================================

// Register beverages not present in simpledifficulty config
SimpleDifficulty.registerConsumableThirst(<farmersdelight:hot_cocoa>, 6, 0.6, 0.0);
SimpleDifficulty.registerConsumableThirst(<twilightdelight:twilight_spring>, 6, 0.6, 0.0);

// --- Cooling Drink Categories ---
val coolingWaters as IItemStack[] = [
    <simpledifficulty:purified_water_bottle>,
    <simpledifficulty:canteen:*>,
    <minecraft:potion>.withTag({Potion: "minecraft:water"})
];

val coolingGlacial as IItemStack[] = [
    <twilightdelight:glacier_ice_tea>,
    <twilightdelight:twilight_spring>
];

val coolingFruits as IItemStack[] = [
    <extradelightlegacy:cactus_juice>,
    <farmersdelight:melon_juice>,
    <extradelightlegacy:melon_juice>,
    <extradelightlegacy:lemon_juice>,
    <extradelightlegacy:lime_juice>
];

// --- Warming Drink Categories ---
val warmingComfort as IItemStack[] = [
    <farmersdelight:hot_cocoa>,
    <farmersdelight:apple_cider>,
    <extradelightlegacy:apple_cider>,
    <extradelightlegacy:eggnog>,
    <bewitchment:juniper_tea>
];

val warmingFiery as IItemStack[] = [
    <twilightdelight:torchberry_juice>
];

HungerEvents.onSimpleDifficultyDrink(function(event as SimpleDifficultyDrinkEvent) {
    val player as IPlayer = event.player;
    if (isNull(player)) return;

    val drink = event.food;
    if (isNull(drink)) return;

    val currentTemp = SimpleDifficulty.getTemperatureLevel(player);

    // ============================================================
    // 1. COOLING DRINKS (Active at temp >= 12, clamped at 11)
    // Scale: 0-5 FREEZING | 6-10 COLD | 10-11 NEUTRAL | 12-13 WARM | 14-19 HOT | 20-25 BURNING
    // ============================================================
    if (currentTemp >= 12) {
        // A. Glacial Cryo-Coolers (-4 Temp, -1.5 Drift for 45s)
        var isGlacial = false;
        for item in coolingGlacial {
            if (!isNull(item) && item.matches(drink)) {
                isGlacial = true;
            }
        }
        if (isGlacial) {
            var newTemp = currentTemp - 4;
            if (newTemp < 11) {
                newTemp = 11;
            }
            SimpleDifficulty.setTemperatureLevel(player, newTemp);
            SimpleDifficulty.setTemporaryModifier(player, "glacial_cooling", -1.5, 900);
            return;
        }

        // B. Purified & Bottled Waters (-3 Temp, -1.0 Drift for 30s)
        var isWater = false;
        for item in coolingWaters {
            if (!isNull(item) && item.matches(drink)) {
                isWater = true;
            }
        }
        if (isWater) {
            var newTemp = currentTemp - 3;
            if (newTemp < 11) {
                newTemp = 11;
            }
            SimpleDifficulty.setTemperatureLevel(player, newTemp);
            SimpleDifficulty.setTemporaryModifier(player, "water_cooling", -1.0, 600);
            return;
        }

        // C. Refreshing Fruit & Cactus Juices (-2 Temp, -0.8 Drift for 30s)
        var isFruit = false;
        for item in coolingFruits {
            if (!isNull(item) && item.matches(drink)) {
                isFruit = true;
            }
        }
        if (isFruit) {
            var newTemp = currentTemp - 2;
            if (newTemp < 11) {
                newTemp = 11;
            }
            SimpleDifficulty.setTemperatureLevel(player, newTemp);
            SimpleDifficulty.setTemporaryModifier(player, "fruit_cooling", -0.8, 600);
            return;
        }
    }

    // ============================================================
    // 2. WARMING DRINKS (Active at temp <= 9, clamped at 10)
    // ============================================================
    if (currentTemp <= 9) {
        // A. Fiery Torchberry Juice (+4 Temp, +1.5 Drift for 45s)
        var isFiery = false;
        for item in warmingFiery {
            if (!isNull(item) && item.matches(drink)) {
                isFiery = true;
            }
        }
        if (isFiery) {
            var newTemp = currentTemp + 4;
            if (newTemp > 10) {
                newTemp = 10;
            }
            SimpleDifficulty.setTemperatureLevel(player, newTemp);
            SimpleDifficulty.setTemporaryModifier(player, "torchberry_warmth", 1.5, 900);
            return;
        }

        // B. Comforting Hot Brews (+3 Temp, +1.0 Drift for 30s)
        var isComfort = false;
        for item in warmingComfort {
            if (!isNull(item) && item.matches(drink)) {
                isComfort = true;
            }
        }
        if (isComfort) {
            var newTemp = currentTemp + 3;
            if (newTemp > 10) {
                newTemp = 10;
            }
            SimpleDifficulty.setTemperatureLevel(player, newTemp);
            SimpleDifficulty.setTemporaryModifier(player, "comfort_warmth", 1.0, 600);
            return;
        }
    }
});
