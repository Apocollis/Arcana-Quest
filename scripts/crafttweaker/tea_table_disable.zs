#loader crafttweaker
import crafttweaker.event.PlayerInteractBlockEvent;

events.onPlayerInteractBlock(function(event as PlayerInteractBlockEvent) {
    if (!event.world.isRemote() && !isNull(event.block) && event.block.definition.id == "teastory:tea_table") {
        event.cancel();
    }
});
