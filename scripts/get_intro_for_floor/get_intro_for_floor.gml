function get_intro_for_floor(floor_number, floors) {
	if (floor_number == 1) {
		return scr_choose_from_array([
			"The forest closes in around you...",
			"Daylight fades as you go deeper into the woods.",
			"Everything grows more quiet as you enter the dense canopy..."
		]);
	}
	
	if (floor_number == 2) {
		return scr_choose_from_array([
			"The ruins of the village lay before you, although it seems less abandoned than you expected...",
			"It smells of death. You see movement among the many ruined buildings.",
			"Another village in ruins. The tower looms in the background. They never stood a chance here..."
		]);
	}
	
	if (floor_number == 3) {
		var final_floor = ds_list_find_value(floors, ds_list_size(floors) - 1);
		var final_room = ds_list_find_value(final_floor[? "rooms"], ds_list_size(final_floor[? "rooms"]) - 1);
		var final_boss = final_room[? "enemy"][? "id"];
		var final_boss_name = final_room[? "enemy"][? "name"];
		var tower_description = "";
		
		if (final_boss == "crimson_mage") {
			tower_description = "Bright red windows adorn the chamber at the top.";
		}
		
		if (final_boss == "ancient_wizard") {
			tower_description = "A cloud looms over the open top floor, rumbling, flashing.";
		}
		
		if (final_boss == "void_cardinal") {
			tower_description = "A shimmering green gloom falls from its windows.";
		}

		return "As you reach its base, your eyes follow the massive tower upwards.\n\n" + tower_description + " The " + final_boss_name + " is up there.\n\nYou steel yourself and start your climb...";
	}
	
	return "";
}
