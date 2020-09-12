function scr_card_definition_rest() {
	var definition = {
		name: "rest",
		title: "rest",
		cost: 0,
		text: "Draw 1 card, Gain 1 AP, end your turn.",
		effect: do_rest_effect,
	};
	
	return definition;
}

function do_rest_effect(target, source) {
	scr_character_gains_ap(source, 1);

	with (source) {
		amount_of_cards_to_draw += 1;
		state_switch("drawingCards");
	}

	with (obj_battle_manager) {
		state_switch("turnEnd");
	}
}

