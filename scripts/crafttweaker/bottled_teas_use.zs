#loader crafttweaker

events.onEntityLivingUseItemFinish(function(event as crafttweaker.event.EntityLivingUseItemEvent.Finish) {
    if (event.isPlayer) {
        val player = event.player;
        val item = event.item;
        if (!isNull(item) && item.definition.id.startsWith("contenttweaker:bottled_")) {
            if (!player.world.isRemote()) {
                player.give(<minecraft:glass_bottle>);
            }
        }
    }
});
