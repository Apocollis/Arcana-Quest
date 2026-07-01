import crafttweaker.events.IEventManager;
import crafttweaker.event.BlockHarvestDropsEvent;

events.onBlockHarvestDrops(function(event as BlockHarvestDropsEvent) {
    val id = event.block.definition.id;
    
    if (id == "contenttweaker:wild_tea_plant") {
        event.drops = [<teastory:tea_seeds>, <teastory:tea_leaf>];
    } 
    else if (id == "contenttweaker:wild_grape") {
        event.drops = [<rustic:grape_stem>, <rustic:grapes>];
    } 
    else if (id == "contenttweaker:wild_chili") {
        event.drops = [<rustic:chili_pepper_seeds>, <rustic:chili_pepper>];
    }
});