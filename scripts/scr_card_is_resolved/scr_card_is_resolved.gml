function scr_card_is_resolved() {
	if (state_new) {
		animation_add_wait(1 * room_speed);
	}

	if (animation_is_finished) {
		if (should_play_again) {
			state_switch("beingPlayed");
			scr_add_event_log(played_by.name + "'s shadow takes shape, and repeats " + self.title);
		} else {
			played_by = noone;
			state_switch("beingDiscarded");
		}
	}
}
