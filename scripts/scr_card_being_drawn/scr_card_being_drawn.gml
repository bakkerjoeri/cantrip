function scr_card_being_drawn() {
	if (state_new) {
		depth = -1;
	
		is_face_up = owner.is_hand_visible;
		animation_add_next(
			scr_calculate_position_x_in_hand(
				ds_list_find_index(owner.hand, self),
				ds_list_size(owner.hand),
				owner.hand_x,
				owner.hand_width
			),
			owner.hand_y,
			.25 * room_speed,
			ease_out_quint,
		);
	
		exit;
	}

	if (animation_is_finished) {
		state_switch("inHand");
	}



}
