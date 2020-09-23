function scr_card_definition_meditate(card) {
	card.name = "meditate";
	card.title = "meditate";
	card.cost = 0;
	card.text = "Start your next turn with full AP.";
	card.effect = do_meditate_effect;
}

function do_meditate_effect(target, source) {
	scr_add_start_of_turn_effect(
		source,
		"meditate",
		meditate_start_of_turn_effect,
		1,
	);
}

function meditate_start_of_turn_effect(target, source) {
	source.ability_points = source.max_ability_points;
}