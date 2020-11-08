function scr_game_goto_settings() {
	if (state_new) {
		if (room != room_settings) {
			room_goto(room_settings);
		}
	
		state_switch("settings");
	}
}
