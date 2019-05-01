with (obj_game_manager) {
	var data_to_save = ds_map_create();
	data_to_save[? "runs_won"] = runs_won;
	scr_save_map_to_file(data_to_save, "cantrip.sav");
}