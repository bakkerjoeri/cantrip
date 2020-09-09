function scr_load_game() {
	with (obj_game_manager) {
		if (file_exists("cantrip.sav")) {
			saved_data = scr_load_map_from_file("cantrip.sav");
			runs_won = saved_data[? "runs_won"];
		} else {
			runs_won = 0;
		}
	}




}
