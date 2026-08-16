#priority 50
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.data.IData;
import mods.jei.JEI;
import mods.thaumcraft.ArcaneWorkbench;
import mods.thaumcraft.InfusionCrafting;

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
    <grapplemod:smartupgradeitem>,
    <grapplemod:pitchupgradeitem>,
    <grapplemod:tapeupgradeitem>,
    <grapplemod:rocketupgradeitem>,
    <grapplemod:smarthook>,
    <grapplemod:magnethook>,
    <grapplemod:rockethook>,
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

// 4. Default NBT Tag Schema
val defaultHookTag as IData = {
    smartmotor: 0 as byte,
    detachonkeyrelease: 0 as byte,
    rocket_force: 1.0,
    doublehook: 0 as byte,
    angle: 20.0,
    playermovementmult: 1.0,
    motorwhennotcrouching: 0 as byte,
    throwspeed: 4.0,
    motordampener: 0 as byte,
    sticky: 0 as byte,
    rocket_vertical_angle: 0.0,
    attractradius: 3.0,
    repelforce: 1.0,
    reelin: 1 as byte,
    phaserope: 0 as byte,
    attract: 0 as byte,
    motoracceleration: 0.1,
    verticalthrowangle: 0.0,
    hookgravity: 1.0,
    crc32: 2100557539 as long,
    maxlen: 30.0,
    motormaxspeed: 0.6,
    repel: 0 as byte,
    sneakingangle: 10.0,
    motorwhencrouching: 1 as byte,
    pullbackwards: 0 as byte,
    smartdoublemotor: 1 as byte,
    sneakingverticalthrowangle: 0.0,
    rocket_refuel_ratio: 15.0,
    rocket_active_time: 0.5,
    oneropepull: 0 as byte,
    enderstaff: 0 as byte,
    motor: 0 as byte,
    rocket: 0 as byte
};

val anyHook = <grapplemod:grapplinghook> | <grapplemod:motorhook> | <grapplemod:enderhook>;

// 5. Dynamic 1-Time Single-Use Upgrades

// Upgrade 1: Ender Hook Upgrade (Hook + Ender Launcher -> Ender Hook with enderstaff: 1)
recipes.addShapeless("aq_upgrade_ender_hook", <grapplemod:enderhook>, [
    anyHook.marked("hook"),
    <grapplemod:launcheritem>
], function(out, ins, cInfo) {
    if (isNull(ins.hook)) { return null; }
    var tag = defaultHookTag;
    if (!isNull(ins.hook.tag)) {
        tag = defaultHookTag + ins.hook.tag;
    }
    if (!isNull(tag.enderstaff) && tag.enderstaff.asByte() == (1 as byte)) {
        return null;
    }
    var newTag = tag + {enderstaff: 1 as byte};
    return <grapplemod:enderhook>.withTag(newTag).withDamage(ins.hook.damage);
}, null);

// Upgrade 2: Rope Upgrade (Hook + Rope -> maxlen 60.0)
recipes.addShapeless("aq_upgrade_rope_hook", <grapplemod:grapplinghook>, [
    anyHook.marked("hook"),
    <farmersdelight:rope>
], function(out, ins, cInfo) {
    if (isNull(ins.hook)) { return null; }
    var tag = defaultHookTag;
    if (!isNull(ins.hook.tag)) {
        tag = defaultHookTag + ins.hook.tag;
    }
    if (!isNull(tag.maxlen) && tag.maxlen.asDouble() >= 60.0) {
        return null;
    }
    var newTag = tag + {maxlen: 60.0};
    var baseOutput = ins.hook.definition.makeItemStack(ins.hook.damage);
    return baseOutput.withTag(newTag);
}, null);

// Upgrade 3: Motor Upgrade (Hook + Complex Mechanism -> Motor Hook)
recipes.addShapeless("aq_upgrade_motor_hook", <grapplemod:motorhook>, [
    anyHook.marked("hook"),
    <thaumcraft:mechanism_complex>
], function(out, ins, cInfo) {
    if (isNull(ins.hook)) { return null; }
    var tag = defaultHookTag;
    if (!isNull(ins.hook.tag)) {
        tag = defaultHookTag + ins.hook.tag;
    }
    if (!isNull(tag.motor) && tag.motor.asByte() == (1 as byte)) {
        return null;
    }
    var newTag = tag + {
        motor: 1 as byte,
        motormaxspeed: 0.5,
        motoracceleration: 0.1,
        motorwhencrouching: 1 as byte,
        motorwhennotcrouching: 0 as byte
    };
    return <grapplemod:motorhook>.withTag(newTag).withDamage(ins.hook.damage);
}, null);

// 6. Long Fall Boots (Arcane Workbench)
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

// 7. Magnetic Repeller Hook (Infusion)
// Gated behind "Magnetic Forcefield" research requiring Pauldron of Repulsion
InfusionCrafting.registerRecipe(
    "aq_repeller",
    "AQ_MAGNETIC_FORCEFIELD",
    <grapplemod:repeller>,
    2,
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
