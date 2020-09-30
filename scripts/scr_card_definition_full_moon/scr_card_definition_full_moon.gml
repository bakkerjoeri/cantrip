function scr_card_definition_full_moon(card) {
	card.name = "full_moon";
	card.title = "full moon";
	card.cost = 0;
	card.text = "Everyone regains all AP.";
	card.effect = do_full_moon_effect;
	card.condition = can_play_full_moon;
	card.rarity = 2;
}

function do_full_moon_effect(target, source) {
	scr_character_gains_ap(source, source.max_ability_points - source.ability_points);
	scr_character_gains_ap(target, target.max_ability_points - target.ability_points);
}

function can_play_full_moon(target, source) {
	if (
		source.ability_points == source.max_ability_points &&
		target.ability_points == target.max_ability_points
	) {
		return false;
	}

	return true;
}