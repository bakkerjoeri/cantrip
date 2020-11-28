function scr_character_reshuffling_cards() {
	if (state_new) {
		_delay = 0;

		if (ds_list_empty(graveyard)) {
			return;
		}

		for (var c = 0; c <= ds_list_size(graveyard) - 1; c += 1) {
			var card_to_reshuffle = ds_list_find_value(graveyard, c);

			with (card_to_reshuffle) {
				state_switch("beingReshuffled");
			}
		}
		
		scr_move_all_items_between_lists(graveyard, draw_pile);
		ds_list_shuffle(draw_pile);
		
		_delay = 0.25 * room_speed;

		return;
	}
	
	if (_delay <= 0) {
		state_switch_previous();
		return;
	}
	
	_delay -= 1;
}
