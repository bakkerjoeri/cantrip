function scr_draft_handle_pick() {
	if (state_new) {
		_handle_delay = 2 * room_speed;
	
		for (var c = 0; c <= ds_list_size(draft_list) - 1; c += 1) {
			var card = ds_list_find_value(draft_list, c);
	
			if (card.id == picked_card.id) {
				ds_list_add(obj_game_manager.player_deck_list, card.name);
			
				with (card) {
					animation_add_wait(0.1 * c * room_speed);
					state_switch("draftPicked");
				}
			} else {
				with (card) {
					animation_add_wait(0.1 * c * room_speed);
					state_switch("draftNotPicked");
				}
			}
		}
	}

	if (_handle_delay <= 0) {
		state_switch("toNextRound");
	}

	_handle_delay -= 1;


}
