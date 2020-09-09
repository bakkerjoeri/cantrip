function scr_card_in_graveyard() {
	if (state_new) {
		previous_graveyard_size = 0;
		previous_graveyard_position = -1;
		is_face_up = true;
	}

	var current_graveyard_size = ds_list_size(owner.graveyard);
	var current_graveyard_position = ds_list_find_index(owner.graveyard, self.id);

	// Animate to new position if graveyard composition has changed
	if (
		current_graveyard_position != -1 && (
			current_graveyard_size != previous_graveyard_size ||
			current_graveyard_position != previous_graveyard_position ||
			state_new
		)
	) {
		depth = ds_list_size(owner.graveyard) - 1 - ds_list_find_index(owner.graveyard, self.id);
	
		if (current_graveyard_position >= current_graveyard_size - 3) {
			animation_add_next(
				owner.graveyard_x + (2 * (current_graveyard_position - current_graveyard_size + min(3, current_graveyard_size))),
				owner.graveyard_y,
				.1 * room_speed,
				ease_linear,
			);
		} else {
			animation_add_next(
				owner.graveyard_x,
				owner.graveyard_y,
				.1 * room_speed,
				ease_linear,
			);
		}
	}

	previous_graveyard_position = current_graveyard_position;
	previous_graveyard_size = current_graveyard_size;


}
