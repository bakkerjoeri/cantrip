if (state_new) {
	with (turn_of_character) {
		amount_of_cards_to_draw += 1;
		state_switch("drawingCards");
	}
	
	exit;
}

if (turn_of_character.state_name == "waiting") {
	state_switch("turnPointsPhase");
}

