function scr_game_goto_travel() {
	if (state_new) {
		if (room != room_travel) {
			room_goto(room_travel);
		}
	
		state_switch("travel");
	}
}
