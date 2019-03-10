if (state_new) {	
	current_floor_number = 1;
	player_deck_list = scr_get_deck_list_starter();
	
	with (obj_battle_manager) {
		state_switch("battleStart");
	}
}