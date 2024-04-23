function scr_game_goto_setup_custom_game() {
	if (state_new) {
		if (room != room_setup_custom_game) {
			room_goto(room_setup_custom_game);
		}
	
		state_switch("setupCustomGame");
	}
}
