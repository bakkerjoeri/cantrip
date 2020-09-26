function scr_card_start_play() {
	if (state_new) {
		scr_remove_item_from_list(owner.hand, self.id);
		is_face_up = true;
	
		animation_add_next(
			(room_width / 2) - (sprite_width / 2),
			(room_height / 2) - (sprite_height / 2),
			0.5 * room_speed,
			ease_out_quint,
		);
	
		animation_add_wait(.5 * room_speed);
	
		exit;
	}

	if (animation_is_finished) {
		state_switch("beingPlayed");
	}


}
