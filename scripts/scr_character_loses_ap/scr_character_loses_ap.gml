/// scr_character_loses_ap(character);
function scr_character_loses_ap() {
	var character = argument[0];
	var amount = argument[1];

	character.ability_points = max(character.ability_points - amount, 0);



}
