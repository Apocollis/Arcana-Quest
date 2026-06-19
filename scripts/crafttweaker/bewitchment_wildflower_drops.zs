import crafttweaker.events.IEventManager;
import crafttweaker.event.BlockHarvestDropsEvent;

events.onBlockHarvestDrops(function(event as BlockHarvestDropsEvent) {
    val id = event.block.definition.id;
    
    if (id == "contenttweaker:wild_mandrake") {
        event.drops = [<bewitchment:mandrake_seeds>, <bewitchment:mandrake_root>];
    } 
    else if (id == "contenttweaker:wild_belladonna") {
        event.drops = [<bewitchment:belladonna_seeds>, <bewitchment:belladonna>];
    } 
    else if (id == "contenttweaker:wild_aconitum") {
        event.drops = [<bewitchment:aconitum_seeds>, <bewitchment:aconitum>];
    } 
    else if (id == "contenttweaker:wild_garlic") {
        event.drops = [<bewitchment:garlic_seeds>, <bewitchment:garlic>];
    } 
    else if (id == "contenttweaker:wild_hellebore") {
        event.drops = [<bewitchment:hellebore_seeds>, <bewitchment:hellebore>];
    } 
    else if (id == "contenttweaker:wild_wormwood") {
        event.drops = [<bewitchment:wormwood_seeds>, <bewitchment:wormwood>];
    } 
    else if (id == "contenttweaker:wild_white_sage") {
        event.drops = [<bewitchment:white_sage_seeds>, <bewitchment:white_sage>];
    }
});