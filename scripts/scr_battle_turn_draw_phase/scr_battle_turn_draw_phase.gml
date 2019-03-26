if (state_new) {
	with (turn_of_character) {
		if (ds_list_size(hand) + 1 > max_hand_size) {
			ds_queue_enqueue(cards_to_discard, ds_list_find_value(hand, 0));
		}
		
		amount_of_cards_to_draw += 1;
	}
	
	exit;
}

if (turn_of_character.state_name == "waiting") {
	state_switch("turnPointsPhase");
}

