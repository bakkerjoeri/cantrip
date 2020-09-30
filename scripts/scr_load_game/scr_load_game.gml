function scr_load_game() {
	with (obj_game_manager) {
		if (file_exists("cantrip.sav")) {
			saved_data = scr_load_map_from_file("cantrip.sav");
			runs_won = saved_data[? "runs_won"];
			current_run_streak = saved_data[? "current_run_streak"];
			max_run_streak = saved_data[? "max_run_streak"];
		} else {
			runs_won = 0;
			current_run_streak = 0;
			max_run_streak = 0;
		}
	}
}
