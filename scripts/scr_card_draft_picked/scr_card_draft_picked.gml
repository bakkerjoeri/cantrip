function scr_card_draft_picked() {
	if (state_new) {
		_card_sound_played = false;
		_delay = 0.4 * room_speed;
		
		animation_add_next(
			obj_draft_manager.deck_x,
			obj_draft_manager.deck_y,
			0.5 * room_speed,
			ease_in_out_quint,
		);
	
		exit;
	}
	
	if (_delay <= 0 && !_card_sound_played) {
		audio_play_sound(sound_card, 1, false);
		_card_sound_played = true;
	}

	if (animation_is_finished) {
		instance_destroy();
	}
	
	_delay -= 1;
}
