function scr_load_game() {
	with (obj_game_manager) {
		runs_won = 0;
		current_run_streak = 0;
		max_run_streak = 0;
		prefers_screen_shake = true;
		prefers_screen_shake = true;
		is_custom_game_unlocked = false;
			
		if (file_exists("cantrip.sav")) {
			saved_data = scr_load_map_from_file("cantrip.sav");
			
			if (ds_map_exists(saved_data, "runs_won")) {
				runs_won = saved_data[? "runs_won"];
			}
			
			if (ds_map_exists(saved_data, "current_run_streak")) {
				current_run_streak = saved_data[? "current_run_streak"];
			}
			
			if (ds_map_exists(saved_data, "max_run_streak")) {
				max_run_streak = saved_data[? "max_run_streak"];
			}
			
			if (ds_map_exists(saved_data, "prefers_full_screen")) {
				show_debug_message(saved_data[? "prefers_full_screen"]);
				window_set_fullscreen(saved_data[? "prefers_full_screen"]);
			} else {
				window_set_fullscreen(true);
			}
			
			if (ds_map_exists(saved_data, "prefers_screen_shake")) {
				prefers_screen_shake = saved_data[? "prefers_screen_shake"];
			}
			
			if (ds_map_exists(saved_data, "prefers_screen_flashes")) {
				prefers_screen_flashes = saved_data[? "prefers_screen_flashes"];
			}
			
			if (ds_map_exists(saved_data, "is_custom_game_unlocked")) {
				is_custom_game_unlocked = saved_data[? "is_custom_game_unlocked"];
			}
		}
	}
}
