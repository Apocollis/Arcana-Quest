#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Fluid;
import mods.contenttweaker.Color;

// --- Green Tea ---
// Soft, earthy green
var green_tea = VanillaFactory.createFluid("green_tea", Color.fromHex("8FA65C"));
green_tea.temperature = 360;
green_tea.viscosity = 1000;
green_tea.density = 1000;
green_tea.colorize = true;
green_tea.register();

// --- Black Tea ---
// Deep, rich reddish-brown
var black_tea = VanillaFactory.createFluid("black_tea", Color.fromHex("542A0C"));
black_tea.temperature = 360;
black_tea.viscosity = 1000;
black_tea.density = 1000;
black_tea.colorize = true;
black_tea.register();

// --- White Tea ---
// Very pale, delicate champagne/yellow
var white_tea = VanillaFactory.createFluid("white_tea", Color.fromHex("F2E8C9"));
white_tea.temperature = 360;
white_tea.viscosity = 1000;
white_tea.density = 1000;
white_tea.colorize = true;
white_tea.register();

// --- Yellow Tea ---
// Bright golden-yellow
var yellow_tea = VanillaFactory.createFluid("yellow_tea", Color.fromHex("E8C651"));
yellow_tea.temperature = 360;
yellow_tea.viscosity = 1000;
yellow_tea.density = 1000;
yellow_tea.colorize = true;
yellow_tea.register();


// --- Milk Tea ---
// A creamy, light brownish-tan
var milk_tea = VanillaFactory.createFluid("milk_tea", Color.fromHex("D1B280"));
milk_tea.temperature = 360;
milk_tea.viscosity = 1000;
milk_tea.density = 1000;
milk_tea.colorize = true;
milk_tea.register();

// --- Lemon Tea ---
// A bright, translucent yellow-amber
var lemon_tea = VanillaFactory.createFluid("lemon_tea", Color.fromHex("DAB231"));
lemon_tea.temperature = 360;
lemon_tea.viscosity = 1000;
lemon_tea.density = 1000;
lemon_tea.colorize = true;
lemon_tea.register();

// --- White Infused Tea Base ---
var white_infused_tea_base = VanillaFactory.createFluid("white_infused_tea_base", Color.fromHex("DCE3E5"));
white_infused_tea_base.temperature = 360;
white_infused_tea_base.viscosity = 1000;
white_infused_tea_base.density = 1000;
white_infused_tea_base.colorize = true;
white_infused_tea_base.register();

// --- Black Infused Tea Base ---
var black_infused_tea_base = VanillaFactory.createFluid("black_infused_tea_base", Color.fromHex("3B281A"));
black_infused_tea_base.temperature = 360;
black_infused_tea_base.viscosity = 1000;
black_infused_tea_base.density = 1000;
black_infused_tea_base.colorize = true;
black_infused_tea_base.register();

// --- Green Infused Tea Base ---
var green_infused_tea_base = VanillaFactory.createFluid("green_infused_tea_base", Color.fromHex("6F8F5E"));
green_infused_tea_base.temperature = 360;
green_infused_tea_base.viscosity = 1000;
green_infused_tea_base.density = 1000;
green_infused_tea_base.colorize = true;
green_infused_tea_base.register();

// --- Purifying Tea ---
var purifying_tea = VanillaFactory.createFluid("purifying_tea", Color.fromHex("D5DAED"));
purifying_tea.temperature = 360;
purifying_tea.viscosity = 1000;
purifying_tea.density = 1000;
purifying_tea.colorize = true;
purifying_tea.register();