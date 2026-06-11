
val iron_water = <minecraft:water_bucket>;
val clay_water = <ceramics:clay_bucket:0>.withTag({fluids: {FluidName:"water",Amount:1000}});
val iron_dist = <forge:bucketfilled>.withTag({FluidName:"dist_water",Amount:1000});
val clay_dist = <ceramics:clay_bucket:0>.withTag({fluids: {FluidName:"dist_water",Amount:1000}});
val iron_pure = <forge:bucketfilled>.withTag({FluidName:"purified_water",Amount:1000});
val clay_pure = <ceramics:clay_bucket:0>.withTag({fluids: {FluidName:"purified_water",Amount:1000}});

	
print(<simpledifficulty:purified_water_bottle>.maxStackSize);
<simpledifficulty:purified_water_bottle>.maxStackSize = 16;