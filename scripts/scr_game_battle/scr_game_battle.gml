if (state_new) {
	var previous_floor = current_floor;
	var previous_room = current_room;
	
	if (!scr_has_next_room(floors, previous_floor, previous_room)) {
		state_switch("victory");
		exit;
	}
	
	current_floor = scr_get_next_floor(floors, previous_floor, previous_room);
	current_room = scr_get_next_room(floors, previous_floor, previous_room);
	current_floor_number = ds_list_find_index(current_floor[? "rooms"], current_room) + 1;
	current_room_number = ds_list_find_index(floors, current_floor) + 1;

	with (obj_battle_manager) {
		state_switch("start");
	}
}