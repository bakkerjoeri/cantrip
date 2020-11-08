function scr_card_is_resolved() {
	if (state_new) {
		animation_add_wait(1 * room_speed);
	}

	if (animation_is_finished) {
		state_switch("beingDiscarded");
	}


}
