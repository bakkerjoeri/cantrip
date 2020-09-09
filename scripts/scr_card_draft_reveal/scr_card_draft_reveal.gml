function scr_card_draft_reveal() {
	if (state_new) {
		is_face_up = false;

		animation_add_next(
			x,
			obj_draft_manager.draft_list_y,
			1 * room_speed,
			ease_in_out_quint,
		);
	
		exit;
	}

	if (animation_is_finished) {
		is_face_up = true;
	}


}
