#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.ItemFood;

// --- Green Tea Bottled Tea ---
var bottled_green_tea = VanillaFactory.createItemFood("bottled_green_tea", 0);
bottled_green_tea.alwaysEdible = true;
bottled_green_tea.saturation = 0.0;
bottled_green_tea.itemUseAction = "DRINK"; 
bottled_green_tea.onItemFoodEaten = function(stack, world, player) {
    if (!world.isRemote()) {
        // Applies the Excitement effect for 300 seconds (6000 ticks)
        player.addPotionEffect(<potion:teastory:excitement>.makePotionEffect(6000, 0));
		player.addPotionEffect(<potion:elenaidodge2:replenishment>.makePotionEffect(2400, 0));
    }
};
bottled_green_tea.register();

// --- Black Tea Bottled Tea ---
var bottled_black_tea = VanillaFactory.createItemFood("bottled_black_tea", 0);
bottled_black_tea.alwaysEdible = true;
bottled_black_tea.saturation = 0.0;
bottled_black_tea.itemUseAction = "DRINK"; 
bottled_black_tea.onItemFoodEaten = function(stack, world, player) {
    if (!world.isRemote()) {
        player.addPotionEffect(<potion:teastory:excitement>.makePotionEffect(6000, 0));
		player.addPotionEffect(<potion:elenaidodge2:replenishment>.makePotionEffect(2400, 0));
    }
};
bottled_black_tea.register();

// --- White Tea Bottled Tea ---
var bottled_white_tea = VanillaFactory.createItemFood("bottled_white_tea", 0);
bottled_white_tea.alwaysEdible = true;
bottled_white_tea.saturation = 0.0;
bottled_white_tea.itemUseAction = "DRINK"; 
bottled_white_tea.onItemFoodEaten = function(stack, world, player) {
    if (!world.isRemote()) {
        player.addPotionEffect(<potion:teastory:excitement>.makePotionEffect(6000, 0));
		player.addPotionEffect(<potion:elenaidodge2:replenishment>.makePotionEffect(2400, 0));
    }
};
bottled_white_tea.register();

// --- Yellow Tea Bottled Tea ---
var bottled_yellow_tea = VanillaFactory.createItemFood("bottled_yellow_tea", 0);
bottled_yellow_tea.alwaysEdible = true;
bottled_yellow_tea.saturation = 0.0;
bottled_yellow_tea.itemUseAction = "DRINK"; 
bottled_yellow_tea.onItemFoodEaten = function(stack, world, player) {
    if (!world.isRemote()) {
        player.addPotionEffect(<potion:teastory:excitement>.makePotionEffect(6000, 0));
		player.addPotionEffect(<potion:elenaidodge2:replenishment>.makePotionEffect(2400, 0));
    }
};
bottled_yellow_tea.register();


// --- Milk Tea Bottled Tea ---
var bottled_milk_tea = VanillaFactory.createItemFood("bottled_milk_tea", 0);
bottled_milk_tea.alwaysEdible = true;
bottled_milk_tea.saturation = 0.0;
bottled_milk_tea.itemUseAction = "DRINK"; 
bottled_milk_tea.onItemFoodEaten = function(stack, world, player) {
    if (!world.isRemote()) {
        player.addPotionEffect(<potion:teastory:excitement>.makePotionEffect(6000, 0));
		player.addPotionEffect(<potion:elenaidodge2:replenishment>.makePotionEffect(2400, 0));
    }
};
bottled_milk_tea.register();

// --- Lemon Tea Bottled Tea ---
var bottled_lemon_tea = VanillaFactory.createItemFood("bottled_lemon_tea", 0);
bottled_lemon_tea.alwaysEdible = true;
bottled_lemon_tea.saturation = 0.0;
bottled_lemon_tea.itemUseAction = "DRINK"; 
bottled_lemon_tea.onItemFoodEaten = function(stack, world, player) {
    if (!world.isRemote()) {
        player.addPotionEffect(<potion:teastory:excitement>.makePotionEffect(6000, 0));
		player.addPotionEffect(<potion:elenaidodge2:replenishment>.makePotionEffect(2400, 0));
    }
};
bottled_lemon_tea.register();

// --- White Infused Tea Base ---
var bottled_white_infused_tea_base = VanillaFactory.createItemFood("bottled_white_infused_tea_base", 0);
bottled_white_infused_tea_base.alwaysEdible = true;
bottled_white_infused_tea_base.saturation = 0.0;
bottled_white_infused_tea_base.itemUseAction = "DRINK"; 
bottled_white_infused_tea_base.onItemFoodEaten = function(stack, world, player) {
    if (!world.isRemote()) {
        player.addPotionEffect(<potion:teastory:excitement>.makePotionEffect(6000, 0));
    }
};
bottled_white_infused_tea_base.register();

// --- Black Infused Tea Base ---
var bottled_black_infused_tea_base = VanillaFactory.createItemFood("bottled_black_infused_tea_base", 0);
bottled_black_infused_tea_base.alwaysEdible = true;
bottled_black_infused_tea_base.saturation = 0.0;
bottled_black_infused_tea_base.itemUseAction = "DRINK"; 
bottled_black_infused_tea_base.onItemFoodEaten = function(stack, world, player) {
    if (!world.isRemote()) {
        player.addPotionEffect(<potion:teastory:excitement>.makePotionEffect(6000, 0));
    }
};
bottled_black_infused_tea_base.register();

// --- Green Infused Tea Base ---
var bottled_green_infused_tea_base = VanillaFactory.createItemFood("bottled_green_infused_tea_base", 0);
bottled_green_infused_tea_base.alwaysEdible = true;
bottled_green_infused_tea_base.saturation = 0.0;
bottled_green_infused_tea_base.itemUseAction = "DRINK"; 
bottled_green_infused_tea_base.onItemFoodEaten = function(stack, world, player) {
    if (!world.isRemote()) {
        player.addPotionEffect(<potion:teastory:excitement>.makePotionEffect(6000, 0));
    }
};
bottled_green_infused_tea_base.register();

// --- Purifying Tea ---
var bottled_purifying_tea = VanillaFactory.createItemFood("bottled_purifying_tea", 0);
bottled_purifying_tea.alwaysEdible = true;
bottled_purifying_tea.saturation = 0.0;
bottled_purifying_tea.itemUseAction = "DRINK"; 

bottled_purifying_tea.onItemFoodEaten = function(stack, world, player) {
    // Everything that changes game state must happen on the server
    if (!world.isRemote()) {
        // Apply potion effects
        player.addPotionEffect(<potion:teastory:excitement>.makePotionEffect(6000, 0));
        player.addPotionEffect(<potion:thaumcraft:warpward>.makePotionEffect(6000, 0));
        
        // Execute server commands using the player's name instead of @s
        server.commandManager.executeCommand(server, "playsound thaumcraft:brain master " + player.name);
        server.commandManager.executeCommand(server, "tc warp " + player.name + " remove 1 PERM");
    }
};

bottled_purifying_tea.register();