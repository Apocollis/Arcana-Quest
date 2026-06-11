# THAUMCRAFT ASPECTS - MODTWEAKER SCRIPT
# SEE: https://github.com/jaredlll08/ModTweaker/blob/1.12/test_scripts/thaumcraft.zs
#
#Aspects can be added like so:
#<minecraft:stone>.setAspects(<aspect:ignis>*5);
#<entity:minecraft:sheep>.setAspects(<aspect:aqua>);
#
#Aspects can be removed like so:
#<thaumcraft:thaumonomicon>.removeAspects(<aspect:aqua>);
#

##############
# MISC

<ordinarycoins:coinbronze>.setAspects(<aspect:permutatio>*2,<aspect:desiderium>*1);
<ordinarycoins:coinsilver>.setAspects(<aspect:permutatio>*16,<aspect:desiderium>*8);
<ordinarycoins:coingold>.setAspects(<aspect:permutatio>*128,<aspect:desiderium>*64);
<ordinarycoins:coinplatinum>.setAspects(<aspect:permutatio>*512,<aspect:desiderium>*252);

<contenttweaker:life_crystal>.setAspects(<aspect:victus>*30,<aspect:vitreus>*20,<aspect:humanus>*15);


##############
# XRELIQUARY

<xreliquary:mob_ingredient:0>.setAspects(<aspect:mortuus>*15,<aspect:victus>*15);
<xreliquary:mob_ingredient:1>.setAspects(<aspect:mortuus>*15,<aspect:exanimis>*15,<aspect:tenebrae>*15);
<xreliquary:mob_ingredient:2>.setAspects(<aspect:mortuus>*15,<aspect:bestia>*15,<aspect:alkimia>*5);
<xreliquary:mob_ingredient:3>.setAspects(<aspect:potentia>*25,<aspect:perditio>*15,<aspect:bestia>*10);
<xreliquary:mob_ingredient:4>.setAspects(<aspect:aqua>*15,<aspect:victus>*15,<aspect:alkimia>*5);
<xreliquary:mob_ingredient:5>.setAspects(<aspect:volatus>*15,<aspect:bestia>*10);
<xreliquary:mob_ingredient:6>.setAspects(<aspect:mortuus>*10,<aspect:exanimis>*15,<aspect:victus>*10);
<xreliquary:mob_ingredient:7>.setAspects(<aspect:ignis>*30,<aspect:potentia>*15);
<xreliquary:mob_ingredient:8>.setAspects(<aspect:potentia>*50,<aspect:aer>*30);
<xreliquary:mob_ingredient:10>.setAspects(<aspect:gelum>*30,<aspect:aqua>*15);
<xreliquary:mob_ingredient:11>.setAspects(<aspect:alienis>*30,<aspect:tenebrae>*15);
<xreliquary:mob_ingredient:12>.setAspects(<aspect:aqua>*15,<aspect:bestia>*15,<aspect:sensus>*5);
<xreliquary:mob_ingredient:16>.setAspects(<aspect:aqua>*30,<aspect:bestia>*20,<aspect:aversio>*30);


##############
# ASTRAL SORCERY

<astralsorcery:itemcraftingcomponent:0>.setAspects(<aspect:sensus>*3,<aspect:vitreus>*5,<aspect:praecantatio>*2);
<astralsorcery:itemcraftingcomponent:1>.setAspects(<aspect:lux>*5,<aspect:tenebrae>*5,<aspect:praecantatio>*5,<aspect:metallum>*10);
<astralsorcery:itemcraftingcomponent:2>.setAspects(<aspect:lux>*5,<aspect:tenebrae>*5,<aspect:praecantatio>*5,<aspect:perditio>*5);
<astralsorcery:itemrockcrystalsimple:0>.setAspects(<aspect:vitreus>*15,<aspect:terra>*5,<aspect:ordo>*10);
<astralsorcery:itemcelestialcrystal:0>.setAspects(<aspect:vitreus>*25,<aspect:praecantatio>*10,<aspect:ordo>*15);