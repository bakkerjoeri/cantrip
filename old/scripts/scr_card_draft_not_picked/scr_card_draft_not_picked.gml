function scr_card_draft_not_picked() {
	if (state_new) {
		animation_add_next(
			x,
			-96,
			0.75 * room_speed,
			ease_in_out_quint,
		);
	
		exit;
	}

	if (animation_is_finished) {
		instance_destroy();
	}


}
