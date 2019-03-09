if (state_new) {
	previous_graveyard_size = 0;
	previous_graveyard_position = -1;
	
	is_face_up = true;
	x = owner.graveyard_x;
	y = owner.graveyard_y;
}

var current_graveyard_size = ds_list_size(owner.graveyard);
var current_graveyard_position = ds_list_find_index(owner.graveyard, self);

// Animate to new position if graveyard composition has changed
if (
	current_graveyard_position != -1 && (
		current_graveyard_size != previous_graveyard_size ||
		current_graveyard_position != previous_graveyard_position ||
		state_new
	)
) {
	depth = ds_list_size(owner.graveyard) - 1 - ds_list_find_index(owner.graveyard, self);
	
	if (current_graveyard_position > current_graveyard_size - 4) {
		animation_add_next(
			owner.graveyard_x + (current_graveyard_size - 1 - current_graveyard_position),
			owner.graveyard_y - (current_graveyard_size - 1 - current_graveyard_position) * 2,
			.1 * room_speed,
			ease_linear,
		);
	}
}

previous_graveyard_position = current_graveyard_position;
previous_graveyard_size = current_graveyard_size;