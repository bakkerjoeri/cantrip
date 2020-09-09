///scr_card_effect_combust(target, source);
function scr_card_effect_rest() {
	var source = argument[1];

	scr_character_gains_ap(source, 1);

	with (source) {
		amount_of_cards_to_draw += 1;
		state_switch("drawingCards");
	}

	with (obj_battle_manager) {
		state_switch("turnEnd");
	}


}
