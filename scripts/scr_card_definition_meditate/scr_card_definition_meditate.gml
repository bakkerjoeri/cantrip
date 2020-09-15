function scr_card_definition_meditate() {
	var definition = {
		name: "meditate",
		title: "meditate",
		cost: 0,
		text: "Start your next turn with full AP.",
		effect: do_meditate_effect,
	};
	
	return definition;
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