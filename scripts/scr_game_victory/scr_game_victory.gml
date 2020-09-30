function scr_game_victory() {
	if (state_new) {
		if (room != room_victory) {
			room_goto(room_victory);
			exit;
		}
	
		runs_won = runs_won + 1;
		current_run_streak = current_run_streak + 1;
		max_run_streak = max(max_run_streak, current_run_streak);
		
		scr_save_game();
	}
}
