///scr_card_effect_concentrate(target, source);
var target = argument[0];
var source = argument[1];

var stolen_ap = min(target.ability_points, 2);

scr_character_loses_ap(target, stolen_ap)
scr_character_gains_ap(source, stolen_ap);