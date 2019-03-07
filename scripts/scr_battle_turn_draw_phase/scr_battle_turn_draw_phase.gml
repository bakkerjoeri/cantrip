if (state_new) {
	_card_draw_delay = 0;
	amount_of_cards_left_to_draw = 2;
}

if (_card_draw_delay <= 0 && amount_of_cards_left_to_draw > 0) {
	// Draw a card
	var card_to_draw = ds_list_find_value(turn_of_character.draw_pile, 0);

	ds_list_delete(turn_of_character.draw_pile, 0);
	ds_list_add(turn_of_character.hand, card_to_draw);

	if (turn_of_character.is_player) {
		card_to_draw.is_face_up = true;
	}
	
	with (card_to_draw) {
		state_switch("beingDrawn");
	}

	amount_of_cards_left_to_draw -= 1;
	
	// If there's more cards left, set a short timer
	if (amount_of_cards_left_to_draw > 0) {
		_card_draw_delay = 0.25 * room_speed;
		exit;
	}
	
	// If there's only 1 card left, set a longer timer
	_card_draw_delay = 1.0 * room_speed;
	exit;
}

_card_draw_delay -= 1;

if (_card_draw_delay <= 0 && amount_of_cards_left_to_draw == 0) {
	state_switch("turnPointsPhase");
}