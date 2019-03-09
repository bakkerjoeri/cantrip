if (state_new) {
	if (character_that_lost == player) {
		with(obj_game_manager) {
			state_switch("gameOver");
		}
	} else {
		show_message("Battle won!");
		obj_game_manager.battles_won += 1;
		game_restart();
	}
}