#priority 50
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.data.IData;
import mods.jei.JEI;
import mods.thaumcraft.ArcaneWorkbench;
import mods.thaumcraft.Infusion;

// 1. Remove Default Recipes & Hide Unwanted Items
val itemsToHide = [
    <grapplemod:block_grapple_modifier>,
    <grapplemod:baseupgradeitem>,
    <grapplemod:doubleupgradeitem>,
    <grapplemod:forcefieldupgradeitem>,
    <grapplemod:motorupgradeitem>,
    <grapplemod:ropeupgradeitem>,
    <grapplemod:swingupgradeitem>,
    <grapplemod:throwupgradeitem>,
    <grapplemod:limitsupgradeitem>,
    <grapplemod:staffupgradeitem>,
    <grapplemod:magnetupgradeitem>,
    <grapplemod:rocketupgradeitem>,
    <grapplemod:smarthook>,
    <grapplemod:magnethook>,
    <grapplemod:rockethook>,
    <grapplemod:doublemotorhook>,
    <grapplemod:rocketdoublemotorhook>
] as IItemStack[];

for item in itemsToHide {
    recipes.remove(item);
    JEI.hide(item);
}

// Remove default recipes for hooks that have custom progression
recipes.remove(<grapplemod:enderhook>);
recipes.remove(<grapplemod:motorhook>);
recipes.remove(<grapplemod:repeller>);
recipes.remove(<grapplemod:doublemotorhook>);

// 2. Base Grappling Hook Recipe (Pickaxe Shape with Farmer's Delight Rope)
recipes.remove(<grapplemod:grapplinghook>);
recipes.addShaped("aq_base_grapplinghook", <grapplemod:grapplinghook>, [
    [<minecraft:iron_ingot>, <minecraft:iron_ingot>, <minecraft:iron_ingot>],
    [null, <farmersdelight:rope>, null],
    [null, <farmersdelight:rope>, null]
]);

// 3. Ender Launcher Item (Arcane Workbench)
recipes.remove(<grapplemod:launcheritem>);
ArcaneWorkbench.registerShapedRecipe(
    "aq_ender_launcher",
    "BASEARTIFICE",
    15,
    [<aspect:aer> * 2, <aspect:ordo> * 2],
    <grapplemod:launcheritem>,
    [
        [<thaumcraft:ingot:0>, <minecraft:ender_pearl>, <thaumcraft:ingot:0>],
        [null, <thaumcraft:log_greatwood>, null],
        [null, <minecraft:ender_pearl>, null]
    ]
);

// 4. Clean NBT Tag Schemas (NO crc32 key so Grapple Mod skips checksum validation and preserves all values)

val tagRope as IData = {
    maxlen: 60.0,
    throwspeed: 2.0
};

val tagEnder as IData = {
    enderstaff: 1 as byte,
    maxlen: 30.0,
    throwspeed: 2.0
};

val tagRopeEnder as IData = {
    maxlen: 60.0,
    enderstaff: 1 as byte,
    throwspeed: 2.0
};

val tagMotor as IData = {
    motor: 1 as byte,
    maxlen: 30.0,
    throwspeed: 5.0,
    motormaxspeed: 0.5,
    motoracceleration: 0.1,
    motorwhencrouching: 1 as byte,
    motorwhennotcrouching: 0 as byte
};

val tagRopeMotor as IData = {
    maxlen: 60.0,
    motor: 1 as byte,
    throwspeed: 5.0,
    motormaxspeed: 0.5,
    motoracceleration: 0.1,
    motorwhencrouching: 1 as byte,
    motorwhennotcrouching: 0 as byte
};

val tagEnderMotor as IData = {
    maxlen: 30.0,
    enderstaff: 1 as byte,
    motor: 1 as byte,
    throwspeed: 5.0,
    motormaxspeed: 0.5,
    motoracceleration: 0.1,
    motorwhencrouching: 1 as byte,
    motorwhennotcrouching: 0 as byte
};

val tagFullyUpgraded as IData = {
    maxlen: 60.0,
    enderstaff: 1 as byte,
    motor: 1 as byte,
    throwspeed: 5.0,
    motormaxspeed: 0.5,
    motoracceleration: 0.1,
    motorwhencrouching: 1 as byte,
    motorwhennotcrouching: 0 as byte
};

// 5. Dynamic 1-Time Single-Use Upgrades (Preserves 60m Length, Motor, Ender Staff & Durability in ANY order)

// --- Stage 1: Upgrades from Base Hook ---

// Base Hook -> Ender Hook (Dynamic: preserves 60m length if already upgraded)
recipes.addShapeless(
    "aq_upgrade_base_to_ender",
    <grapplemod:enderhook>.withTag(tagEnder),
    [<grapplemod:grapplinghook>.anyDamage().marked("hook"), <grapplemod:launcheritem>],
    function(out, ins, cInfo) {
        if (isNull(ins.hook)) { return null; }
        var hasRope = false;
        if (!isNull(ins.hook.tag) && !isNull(ins.hook.tag.maxlen) && ins.hook.tag.maxlen.asDouble() >= 60.0) {
            hasRope = true;
        }
        val resultingTag = hasRope ? tagRopeEnder : tagEnder;
        return <grapplemod:enderhook>.withTag(resultingTag).withDamage(ins.hook.damage);
    },
    null
);

// Base Hook -> 60m Rope Hook
recipes.addShapeless(
    "aq_upgrade_base_to_rope",
    <grapplemod:grapplinghook>.withTag(tagRope),
    [<grapplemod:grapplinghook>.anyDamage().marked("hook"), <farmersdelight:rope>],
    function(out, ins, cInfo) {
        if (isNull(ins.hook)) { return null; }
        if (!isNull(ins.hook.tag) && !isNull(ins.hook.tag.maxlen) && ins.hook.tag.maxlen.asDouble() >= 60.0) {
            return null;
        }
        return <grapplemod:grapplinghook>.withTag(tagRope).withDamage(ins.hook.damage);
    },
    null
);

// Base Hook -> Motor Hook (Dynamic: preserves 60m length if already upgraded)
recipes.addShapeless(
    "aq_upgrade_base_to_motor",
    <grapplemod:motorhook>.withTag(tagMotor),
    [<grapplemod:grapplinghook>.anyDamage().marked("hook"), <thaumcraft:mechanism_complex>],
    function(out, ins, cInfo) {
        if (isNull(ins.hook)) { return null; }
        var hasRope = false;
        if (!isNull(ins.hook.tag) && !isNull(ins.hook.tag.maxlen) && ins.hook.tag.maxlen.asDouble() >= 60.0) {
            hasRope = true;
        }
        val resultingTag = hasRope ? tagRopeMotor : tagMotor;
        return <grapplemod:motorhook>.withTag(resultingTag).withDamage(ins.hook.damage);
    },
    null
);

// --- Stage 2: Upgrades from Dual-Tier Hooks ---

// Motor Hook -> Ender Motor Hook (Dynamic: produces Fully Upgraded if already 60m)
recipes.addShapeless(
    "aq_upgrade_motor_to_ender",
    <grapplemod:motorhook>.withTag(tagEnderMotor),
    [<grapplemod:motorhook>.anyDamage().marked("hook"), <grapplemod:launcheritem>],
    function(out, ins, cInfo) {
        if (isNull(ins.hook)) { return null; }
        var hasRope = false;
        if (!isNull(ins.hook.tag) && !isNull(ins.hook.tag.maxlen) && ins.hook.tag.maxlen.asDouble() >= 60.0) {
            hasRope = true;
        }
        val resultingTag = hasRope ? tagFullyUpgraded : tagEnderMotor;
        return <grapplemod:motorhook>.withTag(resultingTag).withDamage(ins.hook.damage);
    },
    null
);

// Ender Hook -> Ender Motor Hook (Dynamic: produces Fully Upgraded if already 60m)
recipes.addShapeless(
    "aq_upgrade_ender_to_motor",
    <grapplemod:motorhook>.withTag(tagEnderMotor),
    [<grapplemod:enderhook>.anyDamage().marked("hook"), <thaumcraft:mechanism_complex>],
    function(out, ins, cInfo) {
        if (isNull(ins.hook)) { return null; }
        var hasRope = false;
        if (!isNull(ins.hook.tag) && !isNull(ins.hook.tag.maxlen) && ins.hook.tag.maxlen.asDouble() >= 60.0) {
            hasRope = true;
        }
        val resultingTag = hasRope ? tagFullyUpgraded : tagEnderMotor;
        return <grapplemod:motorhook>.withTag(resultingTag).withDamage(ins.hook.damage);
    },
    null
);

// Motor Hook -> 60m Motor Hook (Dynamic: produces Fully Upgraded if already has Ender Staff)
recipes.addShapeless(
    "aq_upgrade_motor_to_rope",
    <grapplemod:motorhook>.withTag(tagRopeMotor),
    [<grapplemod:motorhook>.anyDamage().marked("hook"), <farmersdelight:rope>],
    function(out, ins, cInfo) {
        if (isNull(ins.hook)) { return null; }
        if (!isNull(ins.hook.tag) && !isNull(ins.hook.tag.maxlen) && ins.hook.tag.maxlen.asDouble() >= 60.0) {
            return null;
        }
        var hasEnder = false;
        if (!isNull(ins.hook.tag) && !isNull(ins.hook.tag.enderstaff) && ins.hook.tag.enderstaff.asByte() == (1 as byte)) {
            hasEnder = true;
        }
        val resultingTag = hasEnder ? tagFullyUpgraded : tagRopeMotor;
        return <grapplemod:motorhook>.withTag(resultingTag).withDamage(ins.hook.damage);
    },
    null
);

// Ender Hook -> 60m Ender Hook (Dynamic: produces Fully Upgraded if already has Motor)
recipes.addShapeless(
    "aq_upgrade_ender_to_rope",
    <grapplemod:enderhook>.withTag(tagRopeEnder),
    [<grapplemod:enderhook>.anyDamage().marked("hook"), <farmersdelight:rope>],
    function(out, ins, cInfo) {
        if (isNull(ins.hook)) { return null; }
        if (!isNull(ins.hook.tag) && !isNull(ins.hook.tag.maxlen) && ins.hook.tag.maxlen.asDouble() >= 60.0) {
            return null;
        }
        var hasMotor = false;
        if (!isNull(ins.hook.tag) && !isNull(ins.hook.tag.motor) && ins.hook.tag.motor.asByte() == (1 as byte)) {
            hasMotor = true;
        }
        val resultingTag = hasMotor ? tagFullyUpgraded : tagRopeEnder;
        if (hasMotor) {
            return <grapplemod:motorhook>.withTag(resultingTag).withDamage(ins.hook.damage);
        } else {
            return <grapplemod:enderhook>.withTag(resultingTag).withDamage(ins.hook.damage);
        }
    },
    null
);

// --- Stage 3: Fully Upgraded (60m Ender Motor Hook) ---

// 60m Motor Hook + Launcher -> 60m Ender Motor Hook
recipes.addShapeless(
    "aq_upgrade_60m_motor_to_ender",
    <grapplemod:motorhook>.withTag(tagFullyUpgraded),
    [<grapplemod:motorhook>.anyDamage().marked("hook"), <grapplemod:launcheritem>],
    function(out, ins, cInfo) {
        if (isNull(ins.hook)) { return null; }
        return <grapplemod:motorhook>.withTag(tagFullyUpgraded).withDamage(ins.hook.damage);
    },
    null
);

// 60m Ender Hook + Complex Mechanism -> 60m Ender Motor Hook
recipes.addShapeless(
    "aq_upgrade_60m_ender_to_motor",
    <grapplemod:motorhook>.withTag(tagFullyUpgraded),
    [<grapplemod:enderhook>.anyDamage().marked("hook"), <thaumcraft:mechanism_complex>],
    function(out, ins, cInfo) {
        if (isNull(ins.hook)) { return null; }
        return <grapplemod:motorhook>.withTag(tagFullyUpgraded).withDamage(ins.hook.damage);
    },
    null
);

// Ender Motor Hook + Rope -> 60m Ender Motor Hook
recipes.addShapeless(
    "aq_upgrade_endermotor_to_rope",
    <grapplemod:motorhook>.withTag(tagFullyUpgraded),
    [<grapplemod:motorhook>.anyDamage().marked("hook"), <farmersdelight:rope>],
    function(out, ins, cInfo) {
        if (isNull(ins.hook)) { return null; }
        return <grapplemod:motorhook>.withTag(tagFullyUpgraded).withDamage(ins.hook.damage);
    },
    null
);

// 6. Direct Visual Tooltips for Rope Length
val hooksForTooltips = [
    <grapplemod:grapplinghook>,
    <grapplemod:motorhook>,
    <grapplemod:enderhook>
] as IItemStack[];

for h in hooksForTooltips {
    h.addAdvancedTooltip(function(item) {
        if (!isNull(item.tag) && !isNull(item.tag.maxlen) && item.tag.maxlen.asDouble() >= 60.0) {
            return "§aMax Rope Length: 60m";
        } else {
            return "§7Max Rope Length: 30m";
        }
    });
}

// 7. Long Fall Boots (Arcane Workbench)
// Gated behind "Long Fall Boots" research under Artifice requiring Cloudstepper Ring
ArcaneWorkbench.registerShapelessRecipe(
    "aq_longfall_boots",
    "AQ_LONGFALL_BOOTS",
    10,
    [<aspect:aer> * 4, <aspect:ordo> * 2],
    <grapplemod:longfallboots>,
    [
        <minecraft:diamond_boots>,
        <bewitchment:flying_ointment>,
        <thaumcraft:cloud_ring>
    ]
);

// 8. Magnetic Repeller Hook (Infusion)
// Gated behind "Magnetic Forcefield" research requiring Pauldron of Repulsion
// Instability: 4 (Medium / Moderate)
Infusion.registerRecipe(
    "aq_repeller",
    "AQ_MAGNETIC_FORCEFIELD",
    <grapplemod:repeller>,
    4,
    [<aspect:motus> * 50, <aspect:aer> * 50, <aspect:terra> * 20, <aspect:permutatio> * 20],
    <botania:magnetring>,
    [
        <xreliquary:interdiction_torch>,
        <thaumcraft:paving_stone_barrier>,
        <xreliquary:interdiction_torch>,
        <thaumcraft:paving_stone_barrier>,
        <xreliquary:interdiction_torch>,
        <thaumcraft:paving_stone_barrier>
    ]
);
