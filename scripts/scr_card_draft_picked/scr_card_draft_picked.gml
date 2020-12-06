function scr_card_draft_picked() {
	if (state_new) {
		animation_add_next(
			obj_draft_manager.deck_x,
			obj_draft_manager.deck_y,
			0.5 * room_speed,
			ease_in_out_quint,
		);
	
		exit;
	}

	if (animation_is_finished) {
		audio_play_sound(card, 1, false);
		instance_destroy();
	}
}
