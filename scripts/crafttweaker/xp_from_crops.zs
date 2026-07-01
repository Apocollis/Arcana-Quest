import mods.dropt.Dropt;
import mods.dropt.Harvester;

Dropt.list("crops")
  .add(Dropt.rule()
      .matchBlocks([
			"minecraft:wheat:7",
			"minecraft:beetroots:3",
			"minecraft:potatoes:7",
			"minecraft:carrots:7",
			"minecraft:nether_wart:3",
	  ])
	  .matchHarvester(Dropt.harvester()
        .type("REAL_PLAYER")
      )
      .replaceStrategy("ADD")
      .addDrop(Dropt.drop()
		  .selector(Dropt.weight(1))
          .xp("ADD", Dropt.range(1, 1))
	  )
  );