function scr_get_next_floor() {
	var floors = argument[0];
	var previous_floor = argument[1];
	var previous_room = argument[2];

	if (is_undefined(previous_floor)) {
		return ds_list_find_value(floors, 0);
	}

	var next_room_index = ds_list_find_index(previous_floor[? "rooms"], previous_room) + 1;
	var next_room = ds_list_find_value(previous_floor[? "rooms"], next_room_index);
		
	if (!is_undefined(next_room)) {
		return previous_floor;
	}

	var next_floor_index = ds_list_find_index(floors, previous_floor) + 1;
	var next_floor = ds_list_find_value(floors, next_floor_index);

	return next_floor;


}
