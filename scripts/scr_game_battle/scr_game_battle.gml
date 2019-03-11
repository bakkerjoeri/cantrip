if (state_new) {
	var previous_floor = current_floor;
	var previous_room = current_room;
	
	if (!scr_has_next_room(floors, previous_floor, previous_room)) {
		state_switch("victory");
		exit;
	}
	
	current_floor = scr_get_next_floor(floors, previous_floor, previous_room);
	current_room = scr_get_next_room(floors, previous_floor, previous_room);

	with (obj_battle_manager) {
		state_switch("start");
	}
}