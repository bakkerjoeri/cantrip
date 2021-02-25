function scr_game_over() {
	if (state_new) {	
		if (room != room_game_over) {
			room_goto(room_game_over);
		}
	}

	if (!scr_is_custom_game()) {
		current_run_streak = 0;
	}

	scr_save_game();
}
