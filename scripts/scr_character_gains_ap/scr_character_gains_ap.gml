/// scr_character_gains_ap(character);
var character = argument[0];
var amount = argument[1];

character.ability_points = min(character.ability_points + amount, character.max_ability_points);