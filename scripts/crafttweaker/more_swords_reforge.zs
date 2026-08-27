#priority 70
import crafttweaker.item.IItemStack;
import crafttweaker.enchantments.IEnchantmentDefinition;
import mods.embers.DawnstoneAnvil;

// ==========================================
// More Swords Legacy - Dawnstone Anvil Reforging
// Dormant Relic Sword + Voidmetal Ingot -> Awakened Relic Sword
// ==========================================

// Helper function to create Awakened Sword with Legendary quality & Max Signature Enchantments
function createAwakenedSword(
    baseItem as IItemStack, 
    displayName as string, 
    ench1 as IEnchantmentDefinition, 
    lvl1 as int, 
    ench2 as IEnchantmentDefinition, 
    lvl2 as int
) as IItemStack {
    return baseItem.withDisplayName("§6" + displayName).withLore([
        "§6★ Reforged Relic Weapon ★"
    ]).withTag({
        ench: [
            {id: ench1.id as short, lvl: lvl1 as short},
            {id: ench2.id as short, lvl: lvl2 as short}
        ],
        Quality: {
            Name: "quality.legendary.name",
            Color: "light_purple",
            Slots: ["mainhand"],
            AttributeModifiers: [
                {
                    Name: "generic.attackDamage",
                    AttributeName: "generic.attackDamage",
                    Operation: 2,
                    Amount: 0.15,
                    UUIDMost: 2471852924185794821 as long,
                    UUIDLeast: -5128741957291850124 as long
                },
                {
                    Name: "potioncore.digSpeed",
                    AttributeName: "potioncore.digSpeed",
                    Operation: 2,
                    Amount: 0.1,
                    UUIDMost: 1982741829571928471 as long,
                    UUIDLeast: -3819284719284719283 as long
                },
                {
                    Name: "generic.reachDistance",
                    AttributeName: "generic.reachDistance",
                    Operation: 0,
                    Amount: 0.5,
                    UUIDMost: 8371928471928374612 as long,
                    UUIDLeast: -9182736451829384712 as long
                },
                {
                    Name: "generic.attackSpeed",
                    AttributeName: "generic.attackSpeed",
                    Operation: 2,
                    Amount: 0.1,
                    UUIDMost: 4729184719283746192 as long,
                    UUIDLeast: -1827394817263541829 as long
                }
            ]
        }
    });
}

// 1. Dawn Star (Ignite III + Sparks I)
val awakened_dawn_star = createAwakenedSword(
    <msmlegacy:dawn_star>, 
    "Dawn Star", 
    <enchantment:msmlegacy:ignite>, 3, 
    <enchantment:msmlegacy:sparks>, 1
);
DawnstoneAnvil.add([awakened_dawn_star], <msmlegacy:dawn_star>, <ore:ingotVoid>);

// 2. Vampiric Blade (Feast III + Vitality I)
val awakened_vampiric_blade = createAwakenedSword(
    <msmlegacy:vampiric_blade>, 
    "Vampiric Blade", 
    <enchantment:msmlegacy:feast>, 3, 
    <enchantment:msmlegacy:vitality>, 1
);
DawnstoneAnvil.add([awakened_vampiric_blade], <msmlegacy:vampiric_blade>, <ore:ingotVoid>);

// 3. Wither's Bane (Decay III + Consuming Shadows I)
val awakened_wither_bane = createAwakenedSword(
    <msmlegacy:wither_bane>, 
    "Wither's Bane", 
    <enchantment:msmlegacy:decay>, 3, 
    <enchantment:msmlegacy:consuming_shadows>, 1
);
DawnstoneAnvil.add([awakened_wither_bane], <msmlegacy:wither_bane>, <ore:ingotVoid>);

// 4. Gladiolus (Venomous Aspect III + Absorb I)
val awakened_gladiolus = createAwakenedSword(
    <msmlegacy:gladiolus>, 
    "Gladiolus", 
    <enchantment:msmlegacy:venomous_aspect>, 3, 
    <enchantment:msmlegacy:absorb>, 1
);
DawnstoneAnvil.add([awakened_gladiolus], <msmlegacy:gladiolus>, <ore:ingotVoid>);

// 5. Crystaline Blade (Greed III + Wisdom I)
val awakened_crystaline_blade = createAwakenedSword(
    <msmlegacy:crystaline_blade>, 
    "Crystaline Blade", 
    <enchantment:msmlegacy:greed>, 3, 
    <enchantment:msmlegacy:wisdom>, 1
);
DawnstoneAnvil.add([awakened_crystaline_blade], <msmlegacy:crystaline_blade>, <ore:ingotVoid>);

// 6. Glacial Blade (Frozen Aspect III + Frost Wave I)
val awakened_glacial_blade = createAwakenedSword(
    <msmlegacy:glacial_blade>, 
    "Glacial Blade", 
    <enchantment:msmlegacy:frozen_aspect>, 3, 
    <enchantment:msmlegacy:frost_wave>, 1
);
DawnstoneAnvil.add([awakened_glacial_blade], <msmlegacy:glacial_blade>, <ore:ingotVoid>);

// 7. Eye End Blade (Ender Pulse III + Ender Aura I)
val awakened_eye_end_blade = createAwakenedSword(
    <msmlegacy:eye_end_blade>, 
    "Eye End Blade", 
    <enchantment:msmlegacy:ender_pulse>, 3, 
    <enchantment:msmlegacy:ender_aura>, 1
);
DawnstoneAnvil.add([awakened_eye_end_blade], <msmlegacy:eye_end_blade>, <ore:ingotVoid>);

// 8. Aether's Guard (Ascension III + Descension I)
val awakened_aethers_guard = createAwakenedSword(
    <msmlegacy:aethers_guard>, 
    "Aether's Guard", 
    <enchantment:msmlegacy:ascension>, 3, 
    <enchantment:msmlegacy:descension>, 1
);
DawnstoneAnvil.add([awakened_aethers_guard], <msmlegacy:aethers_guard>, <ore:ingotVoid>);

// 9. Draconic Blade (Keen Edge III + Scorn I)
val awakened_draconic_blade = createAwakenedSword(
    <msmlegacy:draconic_blade>, 
    "Draconic Blade", 
    <enchantment:msmlegacy:keen_edge>, 3, 
    <enchantment:msmlegacy:scorn>, 1
);
DawnstoneAnvil.add([awakened_draconic_blade], <msmlegacy:draconic_blade>, <ore:ingotVoid>);
