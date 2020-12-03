function scr_card_is_resolved() {
	if (state_new) {
		_delay = 1 * room_speed;
	}

	if (_delay <= 0) {
		if (should_play_again) {
			state_switch("beingPlayed");
			scr_add_event_log(played_by.name + "'s shadow takes shape, and repeats " + self.title);
		} else {
			played_by = noone;
			state_switch("beingDiscarded");
		}
		
		exit;
	}
	
	scr_update_position_on_playing_field();
	
	_delay -= 1;
}
