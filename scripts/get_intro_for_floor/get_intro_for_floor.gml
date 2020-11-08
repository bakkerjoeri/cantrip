function get_intro_for_floor(floor_number, floors) {
	if (floor_number == 1) {
		return scr_choose_from_array([
			"The forest closes in around you...",
			"Daylight fades as you go deeper into the woods."
		]);
	}
	
	if (floor_number == 2) {
		return "The ruins of the village lay between you and the tower beyond. It seems less abandoned than you expected...";
	}
	
	if (floor_number == 3) {
		var final_floor = ds_list_find_value(floors, ds_list_size(floors) - 1);
		var final_room = ds_list_find_value(final_floor[? "rooms"], ds_list_size(final_floor[? "rooms"]) - 1);
		var final_boss_name = final_room[? "enemy"][? "name"];

		return "As you reach its base, your eyes follow the massive tower upwards.\n\nThe " + final_boss_name + " is up there.\n\nYou steel yourself and enter.";
	}
	
	return "";
}
