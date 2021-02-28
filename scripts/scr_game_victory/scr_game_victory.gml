function scr_game_victory() {
	if (state_new) {
		is_run_timer_running = false;

		if (room != room_victory) {
			room_goto(room_victory);
			exit;
		}

		if (!scr_is_custom_game()) {
			runs_won = runs_won + 1;
			current_run_streak = current_run_streak + 1;
			max_run_streak = max(max_run_streak, current_run_streak);
			
			if (min_run_duration == undefined) {
				min_run_duration = run_duration;
			} else {
				min_run_duration = min(run_duration, min_run_duration);
			}

			is_custom_game_unlocked = true;
		}
		
		
		
		scr_save_game();
	}
}
