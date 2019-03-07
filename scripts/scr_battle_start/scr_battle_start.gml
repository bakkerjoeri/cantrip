if (state_new) {	
	ds_list_copy(player.draw_pile, player.deck);
	ds_list_shuffle(player.draw_pile);

	ds_list_copy(opponent.draw_pile, opponent.deck);
	ds_list_shuffle(opponent.draw_pile);
	
	repeat(3) {
		scr_character_draws_card(opponent);
	}

	_card_draw_delay = 0;
	amount_of_cards_left_to_draw = 3;
}

if (_card_draw_delay <= 0 && amount_of_cards_left_to_draw > 0) {
	// Draw a card
	var card_to_draw = ds_list_find_value(player.draw_pile, 0);

	ds_list_delete(player.draw_pile, 0);
	ds_list_add(player.hand, card_to_draw);

	if (player.is_player) {
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
	turn_of_character = player;
	state_switch("turnStart");
}