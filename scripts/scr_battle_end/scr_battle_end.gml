if (state_new) {
	if (character_that_lost == player) {
		show_message("Game over...");
		game_restart();
	} else {
		show_message("Battle won!");
	}
}