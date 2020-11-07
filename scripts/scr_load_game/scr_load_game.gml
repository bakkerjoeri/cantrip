function scr_load_game() {
	with (obj_game_manager) {
		runs_won = 0;
		current_run_streak = 0;
		max_run_streak = 0;
		is_custom_game_unlocked = false;
			
		if (file_exists("cantrip.sav")) {
			saved_data = scr_load_map_from_file("cantrip.sav");
			
			if (ds_map_exists(saved_data, "data_won")) {
				runs_won = saved_data[? "runs_won"];
			}
			
			if (ds_map_exists(saved_data, "current_run_streak")) {
				current_run_streak = saved_data[? "current_run_streak"];
			}
			
			if (ds_map_exists(saved_data, "max_run_streak")) {
				max_run_streak = saved_data[? "max_run_streak"];
			}
			
			if (ds_map_exists(saved_data, "is_custom_game_unlocked")) {
				is_custom_game_unlocked = saved_data[? "is_custom_game_unlocked"];
			}
		}
	}
}
