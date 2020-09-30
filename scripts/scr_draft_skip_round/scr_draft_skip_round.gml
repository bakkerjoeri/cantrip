function scr_draft_skip_round() {
	if (state_new) {
		_handle_delay = 1 * room_speed;
	
		for (var c = 0; c <= ds_list_size(draft_list) - 1; c += 1) {
			var card = ds_list_find_value(draft_list, c);

			with (card) {
				animation_add_wait(0.1 * c * room_speed);
				state_switch("draftNotPicked");
			}
		}
	}

	if (_handle_delay <= 0) {
		state_switch("toNextRound");
	}

	_handle_delay -= 1;
}
