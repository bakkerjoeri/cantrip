if (state_new) {
	previous_draw_pile_size = 0;
	previous_draw_pile_position = -1;
	
	is_face_up = false;
	x = owner.draw_pile_x;
	y = owner.draw_pile_y;
}

var current_draw_pile_size = ds_list_size(owner.draw_pile);
var current_draw_pile_position = ds_list_find_index(owner.draw_pile, self);

// Animate to new position if hand composition has changed
if (
	current_draw_pile_position != -1 && (
		current_draw_pile_size != previous_draw_pile_size ||
		current_draw_pile_position != previous_draw_pile_position ||
		state_new
	)
) {
	depth = ds_list_size(owner.draw_pile) - 1 - ds_list_find_index(owner.draw_pile, self);
	
	if (current_draw_pile_position > current_draw_pile_size - 4) {
		animation_add_next(
			owner.draw_pile_x + (current_draw_pile_size - 1 - current_draw_pile_position),
			owner.draw_pile_y - (current_draw_pile_size - 1 - current_draw_pile_position) * 2,
			.1 * room_speed,
			ease_linear,
		);
	}
}

previous_draw_pile_size = current_draw_pile_size;
previous_draw_pile_position = current_draw_pile_position;