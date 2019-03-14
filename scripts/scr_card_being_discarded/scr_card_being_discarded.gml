if (state_new) {
	if (ds_list_find_index(owner.graveyard, self) == -1) {
		ds_list_add(owner.graveyard, self);
	}
	
	depth = ds_list_size(owner.graveyard) - 1 - ds_list_find_index(owner.graveyard, self);
	is_face_up = true;
	
	var current_graveyard_size = ds_list_size(owner.graveyard);
	var current_graveyard_position = ds_list_find_index(owner.graveyard, self);
	
	animation_add_next(
		owner.graveyard_x + (2 * (current_graveyard_position - current_graveyard_size + min(3, current_graveyard_size))),
		owner.graveyard_y,
		.25 * room_speed,
		ease_out_quint,
	);
	
	exit;
}

if (animation_is_finished) {
	state_switch("inGraveyard");
}
