///scr_card_effect_meditate_start_of_turn(target, source);
function scr_card_effect_meditate_start_of_turn() {
	var source = argument[1];

	source.ability_points = source.max_ability_points;


}
