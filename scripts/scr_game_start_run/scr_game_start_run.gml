function scr_game_start_run() {
	if (state_new) {
		floors = scr_generate_floors();
		player_deck_list = scr_get_deck_list_starter();
		player_max_hand_size = 7;
		player_max_ability_points = 3;
		battles_won = 0;
		current_room = undefined;
		current_floor = undefined;
	
		with (obj_pause_controller) {
			state_switch("unpaused");
		}
	
		state_switch("gotoDraft");
	}


}
