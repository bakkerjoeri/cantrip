function scr_character_reshuffling_cards() {
	if (state_new) {
		_card_reshuffle_delay = 0;
	}

	if (_card_reshuffle_delay <= 0 && ds_list_empty(graveyard)) {
		ds_list_shuffle(draw_pile);
		state_switch_previous();
		exit;
	}

	if (_card_reshuffle_delay <= 0 && !ds_list_empty(graveyard)) {
		var card_to_reshuffle = ds_list_find_value(graveyard, 0);
		scr_move_item_between_lists(card_to_reshuffle, graveyard, draw_pile);

		with (card_to_reshuffle) {
			state_switch("beingReshuffled");
		}
	
		if (ds_list_empty(graveyard)) {
			_card_reshuffle_delay = 0.2 * room_speed;
		} else {
			_card_reshuffle_delay = 0.1 * room_speed;
		}
		
		exit;
	}

	_card_reshuffle_delay -= 1;
}
