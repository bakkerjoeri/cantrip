if (state_new) {
	floors = scr_generate_floors();
	current_floor = ds_list_find_value(floors, 0);
	current_room = ds_list_find_value(current_floor[? "rooms"], 0);
	player_deck_list = scr_get_deck_list_starter();
	player_max_hand_size = 8;
	player_max_ability_points = 3;
	
	state_switch("gotoDraft");
}