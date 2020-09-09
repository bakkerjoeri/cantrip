/// scr_can_character_play_card(character, card)
function scr_can_character_play_card() {
	var character = argument[0];
	var card = argument[1];
	var opponent = scr_get_opponent_of_character(character);

	if (!is_undefined(card.condition)) {
		return !card.is_unplayable &&
			card.cost <= character.ability_points &&
			script_execute(card.condition, opponent, character)
	}

	return !card.is_unplayable && card.cost <= character.ability_points;


}
