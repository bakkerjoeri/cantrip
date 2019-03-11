if (state_new) {
	floors = scr_generate_floors();
	player_deck_list = scr_get_deck_list_starter();
	player_max_hand_size = 8;
	player_max_ability_points = 3;
	current_room = undefined;
	current_floor = undefined;
	
	state_switch("gotoBattle");
}