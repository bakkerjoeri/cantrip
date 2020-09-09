function scr_card_being_reshuffled() {
	if (state_new) {
		is_face_up = false;
	
		var current_draw_pile_size = ds_list_size(owner.draw_pile);
		var current_draw_pile_position = ds_list_find_index(owner.draw_pile, self.id);
	
		animation_add_next(
			owner.draw_pile_x + (2 * (current_draw_pile_position - current_draw_pile_size + 3)),
			owner.draw_pile_y,
			.25 * room_speed,
			ease_out_quint,
		);
	
		exit;
	}

	if (animation_is_finished) {
		state_switch("inDrawPile");
	}



}
