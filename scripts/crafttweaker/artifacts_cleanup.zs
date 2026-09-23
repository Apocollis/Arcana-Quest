#priority 70
import mods.jei.JEI;
import loottweaker.LootTweaker;

// Disable 7 modern/novelty Artifacts items (recipe removal & JEI hide)
recipes.remove(<artifacts:night_vision_goggles>);
JEI.hide(<artifacts:night_vision_goggles>);

recipes.remove(<artifacts:drinking_hat>);
JEI.hide(<artifacts:drinking_hat>);

recipes.remove(<artifacts:bubble_wrap>);
JEI.hide(<artifacts:bubble_wrap>);

recipes.remove(<artifacts:snorkel>);
JEI.hide(<artifacts:snorkel>);

recipes.remove(<artifacts:whoopie_cushion>);
JEI.hide(<artifacts:whoopie_cushion>);

recipes.remove(<artifacts:bottled_fart>);
JEI.hide(<artifacts:bottled_fart>);

recipes.remove(<artifacts:shiny_red_balloon>);
JEI.hide(<artifacts:shiny_red_balloon>);

// Remove novelty items from Mimic drop table
val mimicTable = LootTweaker.getTable("artifacts:mimic_underground");
if (!isNull(mimicTable)) {
    val mimicPool = mimicTable.getPool("main");
    if (!isNull(mimicPool)) {
        mimicPool.removeEntry("artifacts:whoopie_cushion");
        mimicPool.removeEntry("artifacts:drinking_hat");
        mimicPool.removeEntry("artifacts:bubble_wrap");
    }
}
