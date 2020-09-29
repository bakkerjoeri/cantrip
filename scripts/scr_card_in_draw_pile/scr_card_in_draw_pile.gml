function scr_card_in_draw_pile() {
	if (state_new) {
		previous_draw_pile_size = 0;
		previous_draw_pile_position = -1;
	
		x = owner.draw_pile_x;
		y = owner.draw_pile_y;
		is_face_up = false;
	}

	var current_draw_pile_size = ds_list_size(owner.draw_pile);
	var current_draw_pile_position = ds_list_find_index(owner.draw_pile, self.id);

	// Animate to new position if hand composition has changed
	if (
		current_draw_pile_position != -1 && (
			current_draw_pile_size != previous_draw_pile_size ||
			current_draw_pile_position != previous_draw_pile_position ||
			state_new
		)
	) {
		depth = ds_list_size(owner.draw_pile) - 1 - ds_list_find_index(owner.draw_pile, self.id);
	
		if (current_draw_pile_position >= current_draw_pile_size - 3) {
			animation_add_next(
				owner.draw_pile_x + (2 * (current_draw_pile_position - current_draw_pile_size + 3)),
				owner.draw_pile_y,
				.1 * room_speed,
				ease_linear,
			);
		} else {
			animation_add_next(
				owner.draw_pile_x,
				owner.draw_pile_y,
				.1 * room_speed,
				ease_linear,
			);
		}
		
		previous_draw_pile_size = current_draw_pile_size;
		previous_draw_pile_position = current_draw_pile_position;
	}
}
