function scr_character_waiting() {
	if (!ds_queue_empty(cards_to_discard)) {
		state_switch("discardingCards");
		exit;
	}


	if (amount_of_cards_to_draw > 0) {
		state_switch("drawingCards");
		exit;
	}

	if (!ds_queue_empty(damage_events)) {
		state_switch("takingDamage");
		exit;
	}
}
