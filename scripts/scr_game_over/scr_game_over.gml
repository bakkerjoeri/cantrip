function scr_game_over() {
	if (state_new) {	
		if (room != room_game_over) {
			room_goto(room_game_over);
		}
	}

	current_run_streak = 0;
	scr_save_game();
}
