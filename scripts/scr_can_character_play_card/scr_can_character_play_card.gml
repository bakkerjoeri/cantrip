/// scr_can_character_play_card(character, card)
var character = argument[0];
var card = argument[1];

return card.cost <= character.ability_points &&
	!card.is_unplayable;