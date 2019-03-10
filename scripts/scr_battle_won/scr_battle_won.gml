if (state_new) {
	with (obj_game_manager) {
		battles_won += 1;
		state_switch("draft");
	}
}