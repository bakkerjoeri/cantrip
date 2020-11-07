function scr_save_game() {
	with (obj_game_manager) {
		var data_to_save = ds_map_create();
		data_to_save[? "runs_won"] = runs_won;
		data_to_save[? "current_run_streak"] = current_run_streak;
		data_to_save[? "max_run_streak"] = max_run_streak;
		data_to_save[? "is_custom_game_unlocked"] = is_custom_game_unlocked;
		scr_save_map_to_file(data_to_save, "cantrip.sav");
	}
}
