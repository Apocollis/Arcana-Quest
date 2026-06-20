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

// --- Oolong Tea ---
// Warm, amber-orange
var oolong_tea = VanillaFactory.createFluid("oolong_tea", Color.fromHex("B86D29"));
oolong_tea.temperature = 360;
oolong_tea.viscosity = 1000;
oolong_tea.density = 1000;
oolong_tea.colorize = true;
oolong_tea.register();

// --- Pu-erh Tea ---
// Dark, heavy mahogany/black-red
var puerh_tea = VanillaFactory.createFluid("puerh_tea", Color.fromHex("3B1504"));
puerh_tea.temperature = 360;
puerh_tea.viscosity = 1000;
puerh_tea.density = 1000;
puerh_tea.colorize = true;
puerh_tea.register();

// --- Milk Tea ---
// A creamy, light brownish-tan
var milk_tea = VanillaFactory.createFluid("milk_tea", Color.fromHex("D1B280"));
milk_tea.temperature = 360;
milk_tea.viscosity = 1000;
milk_tea.density = 1000;
milk_tea.colorize = true;
milk_tea.register();

// --- Matcha Tea ---
// A vibrant, frothy bright green
var matcha_tea = VanillaFactory.createFluid("matcha_tea", Color.fromHex("8BBC50"));
matcha_tea.temperature = 360;
matcha_tea.viscosity = 1000;
matcha_tea.density = 1000;
matcha_tea.colorize = true;
matcha_tea.register();

// --- Lemon Tea ---
// A bright, translucent yellow-amber
var lemon_tea = VanillaFactory.createFluid("lemon_tea", Color.fromHex("DAB231"));
lemon_tea.temperature = 360;
lemon_tea.viscosity = 1000;
lemon_tea.density = 1000;
lemon_tea.colorize = true;
lemon_tea.register();