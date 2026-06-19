import crafttweaker.item.IItemStack;

// 1. Define the item with correct tutorial syntax and your exact weapon stats
val stat_sword = <item:contenttweaker:infinity_sword>.withTag({
    HideFlags: 2,
    AttributeModifiers: [
        {
            UUIDMost: 240000 as long,
            UUIDLeast: 230000 as long,
            Slot: "mainhand",
            AttributeName: "generic.attackDamage",
            Operation: 0,
            Name: "generic.attackDamage",
            Amount: 18.0
        },
        {
            UUIDMost: 240001 as long,
            UUIDLeast: 230001 as long,
            Slot: "mainhand",
            AttributeName: "generic.attackSpeed",
            Operation: 0,
            Name: "generic.attackSpeed",
            Amount: -2.4
        }
    ]
});

// 2. Add your custom crafting recipe using your endgame item base
recipes.addShaped("infinity_sword_recipe", stat_sword, [
    [<minecraft:nether_star>, <minecraft:nether_star>, <minecraft:nether_star>],
    [<minecraft:nether_star>, <minecraft:diamond_sword>, <minecraft:nether_star>],
    [<minecraft:nether_star>, <minecraft:nether_star>, <minecraft:nether_star>]
]);