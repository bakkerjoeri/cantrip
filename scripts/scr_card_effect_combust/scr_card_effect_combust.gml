///scr_card_effect_combust(target, source);
var target = argument[0];
var source = argument[1];

scr_character_take_damage(source, 1, source);
scr_character_take_damage(target, 2, source);